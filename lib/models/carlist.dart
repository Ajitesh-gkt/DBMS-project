import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thispls/models/login_page.dart';

class car_list extends StatefulWidget {
  car_list({Key? key}) : super(key: key);

  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<car_list> {
  late Future<List<dynamic>> _futureCars;

  @override
  void initState() {
    super.initState();
    _futureCars = getCars();
  }
  List carlist = <dynamic>[];

  Future<List<dynamic>> getCars() async {

    var response = await http.get(Uri.parse("http://192.168.0.106/dashboard/test/carlist.php"));

    setState(() {
      carlist=json.decode(response.body);
    });

    return carlist;
  }

  sendreq(String car_no) async
  {
    var res = await http.post(
      Uri.parse("http://192.168.0.106/dashboard/test/requestrent.php"),
      body: {
        "car_no": car_no,
        "logged_name": logged_name,
      },
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: FutureBuilder<List<dynamic>>(
        future: _futureCars,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<dynamic> car_list = snapshot.data!;
            return ListView.builder(
              itemCount: car_list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(car_list[index]['model_name']),
                  title: Text(car_list[index]['car_no']),
                  subtitle: Text(car_list[index]['car_age']),

                  trailing: ElevatedButton(onPressed: (){sendreq(car_list[index]['car_no'].toString());},child: Text('Submit Request')),
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
