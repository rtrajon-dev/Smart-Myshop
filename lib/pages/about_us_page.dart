import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AboutUsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(title: Text("About Us"),),
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: Column(
         children: [
           Icon(Icons.info_outline, size: 80, color: Colors.indigo,),
           SizedBox(height: 20,),
           Text(
             "This app is developed as part of a Flutter training course. "
                 "It demonstrates UI layouts, navigation, state management, and more.",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 16),
           ),
           SizedBox(height: 20,),
           Text("Version 1.0.0", style: TextStyle(color: Colors.grey),),
         ],
       ),
     ),
   );
  }
}