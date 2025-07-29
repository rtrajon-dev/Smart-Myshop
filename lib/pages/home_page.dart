import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {"title": "Smart Watch", "price": 299.0, "icon": Icons.watch},
    {"title": "Camera", "price": 599.0, "icon": Icons.camera_alt},
    {"title": "Sneakers", "price": 149.0, "icon": Icons.directions_run},
    {"title": "Phone", "price": 799.0, "icon": Icons.smartphone},
  ];

  @override
  Widget build(BuildContext context){
    return GridView.count(
      crossAxisCount: 2, //2 item per row
      padding: EdgeInsets.all(12),
      crossAxisSpacing: 10, //horizontal space between column
      mainAxisSpacing: 10, //vertical space between rows
      childAspectRatio: 3/2, //width height ratio of each cart 3/2 = wider than tall

      children: products.map((product) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(product['icon'], size: 40, color: Colors.indigo),
                        SizedBox(height: 10,),
                        Text(product['title'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                        Text('\$${product['price']}',
                          style: TextStyle(color: Colors.grey[600]),),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        );
      }).toList(), //convert the mapped result into a list of widgets
    );
  }
}