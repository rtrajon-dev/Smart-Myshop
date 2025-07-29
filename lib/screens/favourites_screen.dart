// TODO Implement this library.// lib/screens/favourites_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/favorites_provider.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import '../widgets/drawer_widget.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      // appBar: AppBar(
      //   title: Text("Favourites"),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context); // Go back to the previous screen
      //     },
      //   ),
      // ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Product>>(
        future: ApiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (snapshot.hasError)
            return Center(child: Text('Error loading favourites'));

          final products = snapshot.data!;
          final favoriteProducts = products
              .where((product) => favProvider.isFavorite(product.id))
              .toList();

          if (favoriteProducts.isEmpty) {
            return Center(child: Text('No favourite products'));
          }

          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (ctx, i) => ProductCard(product: favoriteProducts[i]),
          );
        },
      ),
    );
  }
}
