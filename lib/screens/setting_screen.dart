import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatefulWidget{
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(title: Text("Settings"),),
      appBar: AppBar(
        title: Text("Setting"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text("Enable Notifications"),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: Text("Dark Mode"),
            value: false,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}