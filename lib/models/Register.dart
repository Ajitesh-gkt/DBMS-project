import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart'as http;

import 'dart:convert';
import 'dart:async';
String localhost="192.168.1.166";


class Register_as_dealer extends StatefulWidget {
  const Register_as_dealer({super.key});

  @override
  State<Register_as_dealer> createState() => _Register_as_dealerState();
}


class _Register_as_dealerState extends State<Register_as_dealer> {


  TextEditingController name= new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController mobile=new TextEditingController();
  TextEditingController password=new TextEditingController();
  // String nm='Entered';

  Future <List> senddata() async {
    print('Entered senddata');
    final response = await http.post(Uri.parse("http://$localhost/dashboard/test/register.php"), body: {
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
      "password": password.text,
    });
    var datauser = json.decode(response.body);
    return [];
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
    // String? swipeDirection;
    // return GestureDetector(
    //   onPanUpdate: ((details) {
    //     swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
    //   }),
    //   onPanEnd: (details) {
    //     if (swipeDirection == null) {
    //       return;
    //     }
    //     if (swipeDirection == 'left') {
    //       //handle swipe left event
    //       // Navigator.pushNamedAndRemoveUntil(
    //       //     context, "/signup/Renter", (route) => false);
    //       Navigator.popAndPushNamed(context, "/signup/Renter");
    //     }
    //   },
    //   child:
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hello again
                  const Text("Dealers' Registration form",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
          
                  const SizedBox(height: 10),
          
                  const Text(
                      "Enter the specific information of the dealer who wish to put a car on rent.",
                      style: TextStyle(
                        fontSize: 15,
                      )).p(10),
          
                  const SizedBox(height: 50),
                  // email textfield
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
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
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(CupertinoIcons.mail),
                            hintText: ' Email',
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  const SizedBox(
                    height: 10,
                  ),
          
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: mobile,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: password,
                          obscureText: check,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: IconButton(onPressed: () {
                                  toggle();
                                  setState(() {});
                                }, icon: !check
                                    ? const Icon(CupertinoIcons.eye)
                                    : const Icon(CupertinoIcons.eye_slash))
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                  
          
          
                  // sign in button
                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 100.0),
                  //   child:
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  ElevatedButton(
                        onPressed: (){senddata();},
                        child: Text(
                          'Register as Dealer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    
                  // ),
                  SizedBox(height: 150,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.lightbulb_fill, color: Colors.yellow[600],),
                      Text('  swipe left to register as a renter',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    ],
                  ),
                ],
              ),
          ),
        ),
      );
    // );
  }
}

class Register_as_Renter extends StatefulWidget {
  const Register_as_Renter({super.key});


  @override
  State<Register_as_Renter> createState() => _Register_as_RenterState();
}

class _Register_as_RenterState extends State<Register_as_Renter> {
  TextEditingController name= new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController mobile=new TextEditingController();
  TextEditingController password=new TextEditingController();
  // String nm='Entered';

  Future <List> senddata() async {
    print('Entered senddata');
    final response = await http.post(Uri.parse("http://192.168.209.222/dashboard/test/adddata.php"), body: {
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
      "password": password.text,
    });
    var datauser = json.decode(response.body);
    return [];
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
    String? swipeDirection;
    return GestureDetector(
      onPanUpdate: ((details) {
        swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
      }),
      onPanEnd: (details) {
        if (swipeDirection == null) {
          return;
        }
        if (swipeDirection == 'right') {
          //handle swipe right event
          // Navigator.pushNamedAndRemoveUntil(
          //     context, "/signup/dealer", (route) => false);
          Navigator.popAndPushNamed(context, "/signup/dealer");
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: const Text('Login Page'),

        //   ),
        backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hello again
                const SizedBox(height: 120),
                const Text("Renters' registration form",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
          
                const SizedBox(height: 10),
          
                const Text(
                    "Enter the specific information of the Renter who wish to borrow a car.",
                    style: TextStyle(
                      fontSize: 15,
                    )).p(8),
          
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
                    child:  Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(height: 10),
          
                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Padding(
                      padding:  EdgeInsets.only(left: 10.0),
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
          
                SizedBox(
                  height: 10,
                ),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: mobile,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                        ),
                      ),
                    ),
                  ),
                ),
          
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: password,
                        obscureText: check,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                toggle();
                                setState(() {});
                              },
                              icon: !check
                                  ? const Icon(CupertinoIcons.eye)
                                  : const Icon(CupertinoIcons.eye_slash)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // sign in button
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  ElevatedButton(
                    onPressed: (){senddata();},
                    child: Text(
                      'Register as Dealer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),

                 SizedBox(height: 150,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.lightbulb_fill, color: Colors.yellow[600],),
                      Text('  swipe left to register as a dealer',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    String? swipeDirection;
    return GestureDetector(
        onPanUpdate: ((details) {
          swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
        }),
        onPanEnd: (details) {
          if (swipeDirection == null) {
            return;
          }
          if (swipeDirection == 'left') {
            //handle swipe left event
            Navigator.pushNamed(context, "/signup/dealer");
            setState(() {
              
            });
          }
          if (swipeDirection == 'right') {
            //handle swipe right event
            Navigator.pushNamed(context, "/signup/Renter");
            setState(() {
              
            });
          }
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dealer"),
              Text("Renter")
            ],
          ),
        ));
  }
}
