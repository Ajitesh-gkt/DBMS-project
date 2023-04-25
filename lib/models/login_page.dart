import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'dart:async';
import 'dart:convert';



import 'package:thispls/home.dart';
import 'package:thispls/models/add_car.dart';
String logged_name="default";
String logged_email="default";
List ll = <dynamic>[];


String localhost="192.168.1.166";


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {

  bool error=true;
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();

  var h = new Map<String,dynamic>();

  login() async
  {
    var res = await http.post(
      Uri.parse("http://$localhost/dashboard/test/login.php"),
      body: {
        "email": email.text.trim(),
        "password": password.text.trim(),
      },
    );

    var info = json.decode(res.body);
   logged_name=info[0]["name"];
   logged_email=info[0]["email"];



    // var response = await http.get(Uri.parse("http://192.168.0.132/dashboard/test/login.php"));
    // ll=json.decode(response.body);
    // logged_name=ll[0]['name'];
    // print(logged_name);



    if (res.statusCode == 200) {
      // var info = json.decode(res.body);
      // if(info["success"])
      //   {
      //     String name = info["name"];
      //     print(name);
      //
      //   }
      Navigator.push(context, MaterialPageRoute(builder: (context) => home()));

    }
    else {
      // Handle failed login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }
  @override
  void initState()
  {
    error = false;
  }

  bool check = true;
  void toggle() {
    if (check == true) {
      check = false;
    } else {
      check = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Login Page'),
      ),
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hello again
                const Text('Hello Again!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    )),
          
                const SizedBox(height: 10),
          
                const Text('Welcome back,you\'ve been missed !',
                    style: TextStyle(
                      fontSize: 15,
                    )),
          
                const SizedBox(height: 50),
                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(CupertinoIcons.mail),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(
                  height: 10,
                ),
          
                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: TextField(
                        controller: password,
                        obscureText: check,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(CupertinoIcons.lock_shield),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  toggle();
                                  setState(() {});
                                },
                                icon: !check
                                    ? const Icon(CupertinoIcons.eye)
                                    : const Icon(CupertinoIcons.eye_slash)),
                            labelText: "Password",
                          ),
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(height: 10,),
                // sign in button
                ElevatedButton(onPressed: (){login();},
                  child: Text('Submit'),
                ),

                SizedBox(height: 25,),
                // not a member ? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "Don't have an account?",
                      style: TextStyle(
                         fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/signup/dealer"),
                      child: Text(
                        ' SignUp',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}
