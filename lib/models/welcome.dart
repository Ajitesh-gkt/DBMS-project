import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.popAndPushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(title: const Text("Welcome!",
      // textAlign: TextAlign.center,
      // style: TextStyle(fontSize: 8),
      // )
      // ),
      backgroundColor:Color.fromARGB(255, 17, 71, 74),
      // appBar: AppBar(title: "welcome!".text.center.xl.make()),
      body: Column(children: [
        const SizedBox(height: 200),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/logo.png")),
            SizedBox(height: 350,),
            const Text(
              'REXAR',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
        // SizedBox(height: 20),
        // //Image(image: NetworkImage("https://media.istockphoto.com/id/1311963466/vector/car-rental.jpg?s=612x612&w=0&k=20&c=zjFSeyjCJ6-yzzY3r-AMj6MghqpS9wytGYGutG9QlhE=" ))
        //  Image.asset("assets/dealer_renter.png", fit: BoxFit.fill).p(30),

        // SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //         onPressed: () => Navigator.pushNamed(context, "/login"),
        //         child: "LogIn".text.make()),
        //     // SizedBox(width: 20),
        //     // ElevatedButton(onPressed: () => Navigator.pushNamed(context, "/login"), child: "LogIn as renter".text.make()),
        //   ],
        // ),
        // SizedBox(height: 25),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //         onPressed: () => Navigator.pushNamed(context, "/signup"),
        //         child: "signup".text.make()),
        //     SizedBox(height: 105),
        //   ],
        // ),
      ]),
      drawer: Drawer(),
    );
  }
}
