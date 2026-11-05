import 'package:dio/dio.dart';
import 'product.dart';

class ProductApi {
  final Dio dio = Dio();

  Future<List<Product>> getProducts() async {
    final response = await dio.get('https://dummyjson.com/products');
    final List products = response.data['products'];
    return products.map((item) => Product.fromJson(item)).toList();
  }
}
