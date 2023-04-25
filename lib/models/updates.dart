import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thispls/constant.dart';
import 'package:thispls/models/login_page.dart';

class updates extends StatefulWidget {
  updates({Key? key}) : super(key: key);

  @override
  _updatesstate createState() => _updatesstate();
}

class _updatesstate extends State<updates> {
  late Future<List<dynamic>> _futureeq;

  @override
  void initState() {
    super.initState();
    _futureeq = getCars();
  }
  List reqlist = <dynamic>[];

  Future<List<dynamic>> getCars() async {

    var response = await http.post(Uri.parse("http://$localhost/dashboard/test/updates.php"),
        body:{
          "logged_name":logged_name,
        });

    setState(() {
      reqlist=json.decode(response.body);
    });

    return reqlist;
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
        title: Text("Updates"),),
      backgroundColor: Colors.grey[400],
      body: FutureBuilder<List<dynamic>>(
        future: _futureeq,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<dynamic> car_list = snapshot.data!;

            return ListView.builder(
              itemCount: car_list.length,
              itemBuilder: (context, index) {

                String dealer = car_list[index]["dealer_name"];
                String carname = car_list[index]['model_name'];
                String renter = car_list[index]['renter_name'];
                return ListTile(

                  title: Card(
                    child: car_list[index]['renter_name'] == logged_name ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Your Request from $dealer for the car $carname is confirmed',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),),
                    )
                        :(car_list[index]['dealer_name'] == logged_name) ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Your car $carname has been booked by $renter',
                      style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                            fontSize: 15),),
                        )
                        : Text('You have not done anything yet',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Garamond',
                          fontSize: 20),),
                    elevation: 6,
                    // margin: EdgeInsets.all(10),
                  ),
                );
              },
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
    );
  }
}
