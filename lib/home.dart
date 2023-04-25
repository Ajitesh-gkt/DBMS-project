import 'dart:convert';
import 'package:thispls/models/carModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thispls/models/login_page.dart';

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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     backgroundColor:Colors.grey[600],
  //     body: FutureBuilder(
  //       future: ReadJsonData(),
  //       builder: (context, dta) {
  //         if (dta.hasData) {
  //           var car = dta.data as List<data>;
  //           return GridView.builder(
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 1, crossAxisSpacing: 15, childAspectRatio: 3),
  //             itemCount: car.length,
  //             itemBuilder: (context, index) {
  //               return Padding(
  //                 padding: const EdgeInsets.all(1.0),
  //                 child: Card(
  //                   color: Colors.grey[800],
  //                   child: ListTile(
  //                     title: Row(
  //                       children: [
  //                         Container(
  //                           height: 150,
  //                           width: 200,
  //                           child: Image(
  //                             image: AssetImage(car[index].image.toString()),
  //                             fit: BoxFit.fill,
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             padding: EdgeInsets.only(bottom: 8),
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Padding(
  //                                   padding: EdgeInsets.only(left: 8, right: 8),
  //                                   child: Text(
  //                                     '${car[index].model.toString()}\n${car[index].rent.toString()}',
  //                                     style: const TextStyle(
  //                                         color: Colors.white,
  //                                         fontSize: 16,
  //                                       ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           );
  //         }
  //         return Center(
  //           child: Text("${dta.error}"),
  //         );
  //       },
  //     ),
  //     appBar: AppBar(
  //       backgroundColor: Colors.black,
  //       title:const Text("DASHBOARD"),
  //     ),
  //     drawer: AppDrawer(),
  //   );
  // }
// }
//   SingleChildScrollView makeDashboardItem(String title, IconData icon) {
//     return SingleChildScrollView(
//       child: Card(
//         // elevation: 1.0,
//         margin: EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
//           child: new InkWell(
//             onTap: () {},
//             // child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               verticalDirection: VerticalDirection.down,
//               children: <Widget>[
//                 SizedBox(height: 50.0),
//                 Center(
//                     child: Icon(
//                       icon,
//                       size: 40.0,
//                       color: Colors.black,
//                     )),
//                 SizedBox(height: 10.0),
//                 new Center(
//                   child: new Text(title,
//                       style:
//                       new TextStyle(fontSize: 18.0, color: Colors.black)),
//                 ),
//               ],
//             ),
//           // ),
//           ),
//         )),);
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Text("Hello $logged_name!",style: TextStyle(fontSize:30 ,decoration: TextDecoration.overline,
          ), ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.all(12),
                  child: Center(
                    child:Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 140,
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((8)),
                            ),
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child:Column(
                                    children: [
                                      Icon(
                                        Icons.car_rental,size: 50,
                                      ),
                                      SizedBox(height: 10,),
                                      Text('Account'),
                                    ],
                                  )
                              ),
                            ),

                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, "/addCar"),
                          child: SizedBox(
                            width: 150,
                            height: 140,
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular((8)),
                              ),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child:Column(
                                      children: [
                                        Icon(
                                          Icons.car_rental,
                                        ),
                                        SizedBox(height: 10,),
                                        Text('Car Rent'),
                                      ],
                                    )
                                ),
                              ),

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                SizedBox(height: 20,),
                Padding(padding: EdgeInsets.all(12),
                  child: Center(
                    child:Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, "/carlist"),
                          child: SizedBox(
                            width: 150,
                            height: 140,
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular((8)),
                              ),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child:Column(
                                      children: [
                                        Icon(
                                          Icons.car_rental,
                                        ),
                                        SizedBox(height: 10,),
                                        Text('Car Lists'),
                                      ],
                                    )
                                ),
                              ),

                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, "/request"),
                          child: SizedBox(
                            width: 150,
                            height: 140,
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular((8)),
                              ),
                              child: Center(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child:Column(
                                      children: [
                                        Icon(
                                          Icons.car_rental,
                                        ),
                                        SizedBox(height: 10,),
                                        Text('Requests'),
                                      ],
                                    )
                                ),
                              ),

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                )

              ],
            ),
          ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [

            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(12),
              child: Center(
                child:Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, "/updates"),
                      child: SizedBox(
                        width: 150,
                        height: 140,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((8)),
                          ),
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child:Column(
                                  children: [
                                    Icon(
                                      Icons.car_rental,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Updates'),
                                  ],
                                )
                            ),
                          ),

                        ),
                      ),
                    ),


                  ],
                ),
              ),

            )

          ],
        ),
      ),
          // Container(
          //   // decoration: BoxDecoration(
          //   //   border: Border.all(color: Colors.black)
          //   // ),
          //   color: Colors.black,
          //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          //   child: Column(
          //     // crossAxisCount: 2,
          //     // padding: EdgeInsets.all(3.0),
          //     children: <Widget>[
          //       Row(
          //         children: <Widget>[
          //           Container(
          //            
          //           ),
          //           // makeDashboardItem("Rent", Icons.car_rental),
          //           // makeDashboardItem("Car List", Icons.car_crash_outlined),
          //         ],
          //       ),
          //       Row(
          //         children: <Widget>[
          //           // makeDashboardItem("Request", Icons.car_crash_rounded),
          //           // makeDashboardItem("Updates", Icons.alarm),
          //         ],
          //       ),
          //
          //
          //       // makeDashboardItem("Renter List", Icons.alarm),
          //
          //     ],
          //   ),
          // ),
        ],
      ),
      appBar: AppBar(
        title: Text("DASHBOARD"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey,
      drawer: AppDrawer(),
    );
  }
}