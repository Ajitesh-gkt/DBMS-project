import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thispls/models/login_page.dart';

class account extends StatefulWidget {
  account({Key? key}) : super(key: key);

  @override
  _accountstate createState() => _accountstate();
}

class _accountstate extends State<account> {
  late Future<List<dynamic>> _futureacc;

  @override
  void initState() {
    super.initState();
    _futureacc = getAcc();
  }
  List acc = <dynamic>[];

  Future<List<dynamic>> getAcc() async {

    var response = await http.post(Uri.parse("http://$localhost/dashboard/test/account.php"),
        body:{
          "logged_name":logged_name,
        });

    setState(() {
      acc=json.decode(response.body);
    });

    return acc;
  }

  // sendreq(String car_no) async
  // {
  //   var res = await http.post(
  //     Uri.parse("http://$localhost/dashboard/test/confbooking.php"),
  //     body: {
  //       "car_no": car_no,
  //
  //     },
  //   );
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.black,
    title: Text(
        'Page Title',style: TextStyle(color: Colors.white,
        fontSize: 22,),
        ),
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
      child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
      Container(

        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
        child: Image.network(
        'https://picsum.photos/seed/981/600',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        ),
        ),
        ),
      Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
      ),
      child: Text(
        'name: $logged_name\nEmail: $logged_email \nMobile: $logged_mobile \n',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        ),
      ),
        Text('Cars booked:',
        style: TextStyle(
          fontSize: 25,
        ),),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<dynamic>>(
            future: _futureacc,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                List<dynamic> ACC = snapshot.data!;
                return
                  Expanded(

                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: ACC.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          shape:BeveledRectangleBorder(side: BorderSide(width: 2,color: Colors.black),borderRadius: BorderRadius.circular(8)),
                          leading: Icon(Icons.car_rental,size: 42,),//Text(car_list[index]['model_name']),
                          title: Text(ACC[index]['model_name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          subtitle: Text(ACC[index]['car_no']+'    AGE: '+ACC[index]['car_age'],style: TextStyle(fontSize: 15),),
                          
                        );

                      },
                    ),
                  );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error fetching car list'),
                );
              } else {
                return Center(
                  child: Text('No data'),
                );
              }
            },
          ),
        ),
      ],
      ),
      ),
    );
  }
}
