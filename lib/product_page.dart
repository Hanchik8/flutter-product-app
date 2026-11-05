import 'package:flutter/material.dart';
import 'product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.thumbnail,
                height: 220,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Category: ${product.category}'),
            Text('Rating: ${product.rating} / 5'),
            const SizedBox(height: 16),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
