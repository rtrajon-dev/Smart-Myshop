import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
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