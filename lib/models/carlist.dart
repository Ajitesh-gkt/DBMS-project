import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class car_list extends StatefulWidget {
  car_list({Key? key}) : super(key: key);

  @override
  _CarListState createState() => _CarListState();
}

class cars
{
  String modelname;
  String carno;
  int carage;

  cars({required this.modelname,required this.carno,required this.carage});
  factory cars.fromJson(Map<String,dynamic> json)
  {
    return cars(
      modelname: json['model_name'],
      carage: json['car_age'],
      carno: json['car_no'],

    );
  }




}

Future<List<dynamic>> getCars() async {
  var response = await http.get(Uri.parse("http://192.168.0.132/dashboard/test/carlist.php"));
  try {
    return cars.fromJson(json.decode(response.body));
  } catch (e) {
    throw Exception('Failed to load cars: ${e.toString()}');
  }
}

class _CarListState extends State<car_list> {
  late Future<List<dynamic>> _futureCars;

  @override
  void initState() {
    super.initState();
    _futureCars = getCars();
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
                  leading: Text(car_list[index]['car_model']),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching car list: ${snapshot.error}'),
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
