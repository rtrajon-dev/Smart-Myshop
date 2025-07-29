import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FavoritesPage extends StatelessWidget {
  final List<String> favoriteItems = [
    'smart Watch',
    'Wireless Earbuds',
    'Gaming mouse',
  ];


  @override
  Widget build(BuildContext context){
    return ListView.separated(
      padding: EdgeInsets.all(12),
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.favorite, color: Colors.red,),
            title: Text(favoriteItems[index]),
          );
        },
        separatorBuilder: (_, _) => Divider(),
        itemCount: favoriteItems.length,
    );
  }
}