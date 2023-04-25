import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thispls/models/login_page.dart';

class request extends StatefulWidget {
  request({Key? key}) : super(key: key);

  @override
  _requeststate createState() => _requeststate();
}

class _requeststate extends State<request> {
  late Future<List<dynamic>> _futureeq;

  @override
  void initState() {
    super.initState();
    _futureeq = getCars();
  }
  List reqlist = <dynamic>[];

  Future<List<dynamic>> getCars() async {

    var response = await http.post(Uri.parse("http://$localhost/dashboard/test/request.php"),
    body:{
      "logged_name":logged_name,
    });

    setState(() {
      reqlist=json.decode(response.body);
    });

    return reqlist;
  }

  sendreq(String car_no) async
  {
    var res = await http.post(
      Uri.parse("http://$localhost/dashboard/test/confbooking.php"),
      body: {
        "car_no": car_no,

      },
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Requests"),),
      backgroundColor: Colors.grey[400],
      body: FutureBuilder<List<dynamic>>(
        future: _futureeq,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<dynamic> car_list = snapshot.data!;
            return ListView.builder(
              itemCount: car_list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Request from "+car_list[index]['renter_name']),
                  subtitle: Text("For: "+car_list[index]['model_name']+" Cost:"+car_list[index]['rent']),

                  trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                          foregroundColor: Colors.white
                      ),
                      onPressed: (){sendreq(car_list[index]['car_no'].toString());},child: Text('Accept Request')),
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
