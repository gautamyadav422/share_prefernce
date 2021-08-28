import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    bool _obscureText = true;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.grey,
                        size: 40,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Highlands Latin School",
                    style: TextStyle(fontSize: 25, color: Colors.blue[900]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Canvas Grades",
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText ? Icons.visibility_off: Icons.visibility),
                            onPressed: (){
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: _isChecked,
                                onChanged: (value){
                                  setState(() {
                                    _isChecked = !_isChecked;
                                  });
                                },
                              ),
                              Text(
                                "SAVE LOGIN?"
                              )
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: Colors.grey,
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Text(
                              "FORGOT PASSWORD?"
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  color: Colors.blue[900],
                  onPressed: (){

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  shareme() async {
    SharedPreferences shrepred = await SharedPreferences.getInstance();
    shrepred.getString("key");
    
  }
}
