import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_api.dart';
import 'product_bloc.dart';
import 'product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductApi())..add(LoadProducts()),
      child: MaterialApp(
        title: 'Products',
        theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
        home: const ProductsPage(),
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductsError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Could not load products'),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<ProductBloc>().add(LoadProducts()),
                    child: const Text('Try again'),
                  ),
                ],
              ),
            );
          }
          if (state is ProductsLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: Image.network(
                      product.thumbnail,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported),
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
