import 'package:dio/dio.dart';
import 'product.dart';

class ProductApi {
  final Dio dio = Dio();

  Future<List<Product>> getProducts() async {
    final response = await dio.get('https://dummyjson.com/products');
    final List productsJson = response.data['products'];
    final List<Product> products = [];

    for (final item in productsJson) {
      products.add(Product.fromJson(item));
    }

    return products;
  }
}
