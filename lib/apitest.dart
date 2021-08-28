import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_prefernce/constant.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  List PostApi = [];
  @override
  void initState() {
    // TODO: implement initState
    apicall();
  }

  apicall() async {
    print("Response start ${DateTime.now()}");
    var resApi = await http.get(
      Uri.parse(ApiCallMain.userPostApi),
    );

    print("Response here ${DateTime.now()}${resApi.body}");
    setState(() {
      PostApi = json.decode(resApi.body);
    });

    print("jsonResp ${PostApi.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: PostApi.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                PostApi[index]["id"].toString(),
                style: TextStyle(color: Colors.red),
              ),
              title: Text(
                PostApi[index]["title"],
                style: TextStyle(color: Colors.red),
              ),
              subtitle: Text(PostApi[index]["body"]),
              trailing: Text(PostApi[index]["userId"].toString()),
            );
          }),
    );
  }
}
