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

    var response = await http.get(Uri.parse("http://$localhost/dashboard/test/carlist.php"));

    setState(() {
      carlist=json.decode(response.body);
    });

    return carlist;
  }

  sendreq(String car_no) async
  {
    var res = await http.post(
      Uri.parse("http://$localhost/dashboard/test/requestrent.php"),
      body: {
        "car_no": car_no,
        "logged_name": logged_name,
      },
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Cars' List"),
    ),
      backgroundColor: Colors.grey[200],
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<dynamic>>(
          future: _futureCars,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              List<dynamic> car_list = snapshot.data!;
              return
                ListView.builder(
                itemCount: car_list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape:BeveledRectangleBorder(side: BorderSide(width: 2,color: Colors.black),borderRadius: BorderRadius.circular(8)),
                    leading: Icon(Icons.car_rental,size: 42,),//Text(car_list[index]['model_name']),
                    title: Text(car_list[index]['model_name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    subtitle: Text(car_list[index]['car_no']+'    AGE: '+car_list[index]['car_age'],style: TextStyle(fontSize: 15),),

                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        foregroundColor: Colors.white
                      ),
                        onPressed: (){sendreq(car_list[index]['car_no'].toString());ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Request submitted')),);},
                        child: Text('Submit Request',style: TextStyle(color: Colors.black),)),
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
      ),
    );
  }
}
