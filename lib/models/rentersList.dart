import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../AppDrawer.dart';

class rentersList extends StatefulWidget {
  const rentersList({super.key});

  @override
  State<rentersList> createState() => _rentersListState();
}

class _rentersListState extends State<rentersList> {
  // Future<List<data>?> ReadJsonData() async {
  //   final jsondata = await rootBundle.loadString('car.json');
  //   final list = jsonDecode(jsondata) as List<dynamic>;
  //   return list.map((e) => data.fromJson(e)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[600],
      // body: FutureBuilder(
      //   future: ReadJsonData(),
      //   builder: (context, dta) {
      //     if (dta.hasData) {
      //       var car = dta.data as List<data>;
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 15, childAspectRatio: 3),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    color: Colors.grey[800],
                    child: ListTile(
                      title: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage("https://www.shutterstock.com/image-vector/businessman-icon-can-be-used-260nw-247098721.jpg"),
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
                                      'Name\nLocation\nContact\nRent for 3 days',
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
            ),
      //     }
      //     return Center(
      //       child: Text("${dta.error}"),
      //     );
      //   },
      // ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Renters' List"),
      ),
      drawer: AppDrawer(),
    );
  }
}