part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> productData;
  ProductLoaded(this.productData);
}

class ProductError extends ProductState {
  final String errorMsg;
  ProductError(this.errorMsg);
}
