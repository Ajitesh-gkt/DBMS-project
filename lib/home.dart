import 'dart:convert';
import 'package:thispls/models/carModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AppDrawer.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Future<List<data>?> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/car.json');
    final list = jsonDecode(jsondata) as List<dynamic>;
    return list.map((e) => data.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Colors.grey[600],
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, dta) {
          if (dta.hasData) {
            var car = dta.data as List<data>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 15, childAspectRatio: 3),
              itemCount: car.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    color: Colors.grey[800],
                    child: ListTile(
                      title: Row(
                        children: [
                          Container(
                            height: 140,
                            width: 200,
                            child: Image(
                              image: AssetImage(car[index].image.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      '${car[index].model.toString()}\n${car[index].rent.toString()}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text("${dta.error}"),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("List of Cars"),
      ),
      drawer: AppDrawer(),
    );
  }
}
