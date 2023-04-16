import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart'as http;

import 'dart:convert';
import 'dart:async';

import 'package:thispls/models/login_page.dart';

class add_car extends StatelessWidget {
   add_car({super.key});

  TextEditingController model_name= new TextEditingController();
  TextEditingController car_age=new TextEditingController();
  TextEditingController car_no=new TextEditingController();
  TextEditingController car_cond=new TextEditingController();
  TextEditingController state=new TextEditingController();
  TextEditingController district=new TextEditingController();
  TextEditingController rent_per_day=new TextEditingController();



  Future <List> senddata() async {
    print('Entered senddata');
    final response = await http.post(Uri.parse("http://192.168.1.164/dashboard/test/rentcar.php"), body: {
      "model_name": model_name.text,
      "car_age": car_age.text,
      "car_no": car_no.text,
      "car_cond": car_cond.text,
      "state": state.text,
      "district": district.text,
      "rent_per_day": rent_per_day.text,
      "dealer": logged_name,

    });
    var datauser = json.decode(response.body);
    return [];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: const Text('Login Page'),

      //   ),
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hello again
              Text('Car Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:36,
                  )
              ),

              SizedBox(height: 10),

              Text("Enter the specific information of the car you wish to rent.",
                style: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 50),
              // email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: TextField(
                      controller: model_name,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText:' model name',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              // password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller: car_age,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: 'Car Age',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller: car_no,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: 'Car Number',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller: car_cond,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: 'Car Condition',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller: state,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: 'State',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller: district,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: 'District',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller: rent_per_day,
                      decoration: InputDecoration(
                        border:InputBorder.none,
                        hintText: 'Rent per day',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              // sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:150.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  ElevatedButton(
                    onPressed: (){senddata();},
                    child: Text(
                      'Add Car',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),




    );
  }
}