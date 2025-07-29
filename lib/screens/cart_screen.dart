// // cart_screen.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/cart_provider.dart';
//
// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final cartItems = cartProvider.items;
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('My Cart')),
//       body: cartItems.isEmpty
//           ? const Center(child: Text('Your cart is empty.'))
//           : ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           final product = cartItems[index];
//           return ListTile(
//             leading: Image.network(product.image, width: 50, height: 50),
//             title: Text(product.title),
//             subtitle: Text("\$${product.price}"),
//             trailing: IconButton(
//               icon: const Icon(Icons.remove_circle_outline),
//               onPressed: () => cartProvider.removeFromCart(product),
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16),
//         color: Colors.blueGrey.shade50,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text("Total:", style: TextStyle(fontSize: 18)),
//             Text("\$${cartProvider.total.toStringAsFixed(2)}",
//                 style: const TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold)),
//           ],
//         ),
//       ),
//     );
//   }
// }
//



// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/drawer_widget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.cartItems.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      // appBar: AppBar(
      //   title: Text("Cart"),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context); // Go back to the previous screen
      //     },
      //   ),
      // ),
      drawer: AppDrawer(),

      body: items.isEmpty
          ? Center(child: Text("Cart is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, i) {
                final product = items[i];
                return ListTile(
                  leading: Image.network(product.image, width: 50),
                  title: Text(product.title),
                  subtitle: Text('Rating: ${product.rating}'),
                  trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
