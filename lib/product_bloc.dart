import 'package:flutter_bloc/flutter_bloc.dart';
import 'product.dart';
import 'product_api.dart';

abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}

abstract class ProductState {}

class ProductsLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductState {}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductApi api;

  ProductBloc(this.api) : super(ProductsLoading()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductsLoading());
      try {
        final products = await api.getProducts();
        emit(ProductsLoaded(products));
      } catch (error) {
        emit(ProductsError());
      }
    });
  }
}
