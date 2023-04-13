import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class add_car extends StatelessWidget {
  const add_car({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: const Text('Login Page'),
        
      //   ), 
        backgroundColor: Colors.grey[400],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          // Hello again
          Text('Car Details',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:36,
            )
            ),
           
           SizedBox(height: 10),
    
          Text("Enter the specific information of the car you wish to rent.",
          style: TextStyle(
            fontSize:15,
            fontWeight: FontWeight.bold,
            ),
            ),

          SizedBox(height: 50),
          // email textfield
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left:8.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText:' model name',
                   ),
                 ),
               ),
             ),
           ),

           SizedBox(height: 10,),
        
          // password textfield
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left:20.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'Purchase date',
                   ),
                 ),
               ),
             ),
           ),

          SizedBox(height: 10,),

          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left:20.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'Car Number',
                   ),
                 ),
               ),
             ),
           ),

          SizedBox(height: 10,),
Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left:20.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'Car Condition',
                   ),
                 ),
               ),
             ),
           ),

          SizedBox(height: 10,),

          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left:20.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'State',
                   ),
                 ),
               ),
             ),
           ),

          SizedBox(height: 10,),

          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left:20.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'District',
                   ),
                 ),
               ),
             ),
           ),

          SizedBox(height: 10,),

          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left:20.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border:InputBorder.none,
                    hintText: 'Rent per day',
                   ),
                 ),
               ),
             ),
           ),

          SizedBox(height: 10,),

          // sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:150.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text('Add Car',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),

                ),
              ),
            ),
          ),
         ],
            ),
          ),
         
        ),

      
      
      
    );
  }
}