import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Text('RT', style: TextStyle(fontSize: 40, color: Colors.white),),
            ),
            SizedBox(height: 20,),
            Text('Rajon Talukdar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text('rajon@example.com', style: TextStyle(color: Colors.grey[600]),),
            SizedBox(height: 30,),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout),
              label: Text("Log out"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}