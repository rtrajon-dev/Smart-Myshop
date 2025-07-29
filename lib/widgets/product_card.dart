import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/favorites_provider.dart';
import '../providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritesProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final isFavorite = favProvider.isFavorite(product.id);
    final isInCart = cartProvider.isInCart(product.id);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),

            // Rating & Favorite
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  SizedBox(width: 4),
                  Text('${product.rating}', style: TextStyle(fontSize: 13)),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      favProvider.toggleFavorite(product.id);
                    },
                  ),
                ],
              ),
            ),

            // Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ElevatedButton(
                onPressed: () {
                  isInCart
                      ? cartProvider.removeFromCart(product.id)
                      : cartProvider.addToCart(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isInCart ? Colors.red : Colors.teal,
                  minimumSize: Size(double.infinity, 35),
                  padding: EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  isInCart ? 'Remove from Cart' : 'Add to Cart',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// // lib/widgets/product_card.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/favorites_provider.dart';
// import '../providers/cart_provider.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final favProvider = Provider.of<FavoritesProvider>(context);
//     final cartProvider = Provider.of<CartProvider>(context);
//
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       elevation: 4,
//       child: ListTile(
//         contentPadding: EdgeInsets.all(10),
//         leading: Image.network(
//           product.image,
//           height: 60,
//           width: 60,
//           fit: BoxFit.contain,
//         ),
//         title: Text(
//           product.title,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('\$${product.price.toStringAsFixed(2)}'),
//             Row(
//               children: [
//                 Icon(Icons.star, size: 16, color: Colors.amber),
//                 SizedBox(width: 4),
//                 Text('${product.rating}'),
//               ],
//             ),
//           ],
//         ),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(
//                 favProvider.isFavorite(product.id)
//                     ? Icons.favorite
//                     : Icons.favorite_border,
//                 color: Colors.red,
//               ),
//               onPressed: () => favProvider.toggleFavorite(product.id),
//             ),
//             IconButton(
//               icon: Icon(
//                 cartProvider.isInCart(product.id)
//                     ? Icons.shopping_cart
//                     : Icons.add_shopping_cart,
//                 color: Colors.green,
//               ),
//               onPressed: () {
//                 cartProvider.isInCart(product.id)
//                     ? cartProvider.removeFromCart(product.id)
//                     : cartProvider.addToCart(product);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//





//
//
//
//
// // // lib/widgets/product_card.dart
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../models/product.dart';
// // import '../providers/favorites_provider.dart';
// //
// // class ProductCard extends StatelessWidget {
// //   final Product product;
// //
// //   ProductCard({required this.product});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final favProvider = Provider.of<FavoritesProvider>(context);
// //
// //     return Card(
// //       child: ListTile(
// //         leading: Image.network(product.image, width: 50, height: 50),
// //         title: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
// //         subtitle: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text('\$${product.price.toStringAsFixed(2)}'),
// //             Row(
// //               children: [
// //                 Icon(Icons.star, color: Colors.amber, size: 16),
// //                 Text('${product.rating}'),
// //               ],
// //             )
// //           ],
// //         ),
// //         trailing: IconButton(
// //           icon: Icon(
// //             favProvider.isFavorite(product.id)
// //                 ? Icons.favorite
// //                 : Icons.favorite_border,
// //             color: Colors.red,
// //           ),
// //
// //           onPressed: () => favProvider.toggleFavorite(product.id),
// //         ),
// //
// //       ),
// //     );
// //   }
// // }
