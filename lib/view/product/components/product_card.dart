import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../model/product.dart';
import '../../product_details/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: product)));
        },
        child: Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 5,
                    child: Hero(
                      tag: product.images.first,
                      child: CachedNetworkImage(
                        imageUrl: product.images.first,
                        placeholder: (context, url) => Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: Colors.grey.shade300,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.grey.shade300,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor),
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$${product.tages.first.price.toStringAsFixed(2)}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
