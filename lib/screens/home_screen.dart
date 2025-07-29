import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = ApiService.fetchProducts();
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _productFuture = ApiService.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: FutureBuilder<List<Product>>(
          future: _productFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Colors.teal));
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Something went wrong!\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              );
            }

            final products = snapshot.data ?? [];

            if (products.isEmpty) {
              return Center(
                child: Text(
                  'No products found.',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (ctx, i) => ProductCard(product: products[i]),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CartScreen()),
          );
        },
        label: Text('Cart (${cartProvider.itemCount})', style: TextStyle(color: Colors.black),),
        icon: Icon(Icons.shopping_cart),
        backgroundColor: Colors.teal,
      ),
    );
  }
}





// // lib/screens/home_screen.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../services/api_service.dart';
// import '../widgets/product_card.dart';
// import '../providers/cart_provider.dart';
// import 'cart_screen.dart';
// import '../widgets/drawer_widget.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Product>> _productFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _productFuture = ApiService.fetchProducts();
//   }
//
//   Future<void> _refreshProducts() async {
//     setState(() {
//       _productFuture = ApiService.fetchProducts();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MyShop'),
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => CartScreen()),
//                   );
//                 },
//               ),
//               if (cartProvider.itemCount > 0)
//                 Positioned(
//                   right: 6,
//                   top: 6,
//                   child: Container(
//                     padding: EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Text(
//                       cartProvider.itemCount.toString(),
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//       drawer: AppDrawer(),
//       body: RefreshIndicator(
//         onRefresh: _refreshProducts,
//         child: FutureBuilder<List<Product>>(
//           future: _productFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting)
//               return Center(child: CircularProgressIndicator());
//
//             if (snapshot.hasError)
//               return Center(child: Text('Error: ${snapshot.error}'));
//
//             final products = snapshot.data!;
//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (ctx, i) => ProductCard(product: products[i]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }











// // lib/screens/home_screen.dart
// import 'package:flutter/material.dart';
// import '../models/product.dart';
// import '../services/api_service.dart';
// import '../widgets/product_card.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Product>> _productFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _productFuture = ApiService.fetchProducts();
//   }
//
//   Future<void> _refreshProducts() async {
//     setState(() {
//       _productFuture = ApiService.fetchProducts();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('MyShop')),
//       body: RefreshIndicator(
//         onRefresh: _refreshProducts,
//         child: FutureBuilder<List<Product>>(
//           future: _productFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting)
//               return Center(child: CircularProgressIndicator());
//
//             if (snapshot.hasError)
//               return Center(child: Text('Error: ${snapshot.error}'));
//
//             final products = snapshot.data!;
//             return ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (ctx, i) => ProductCard(product: products[i]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
