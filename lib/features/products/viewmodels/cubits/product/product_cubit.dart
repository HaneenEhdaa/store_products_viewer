import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_products_viewer/features/products/data/models/product_model.dart';
import 'package:store_products_viewer/features/products/data/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getMyProduct() async {
    try {
      emit(ProductLoading());
      var products = await ProductService().getProduct();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
