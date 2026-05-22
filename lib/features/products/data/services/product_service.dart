import 'package:dio/dio.dart';
import 'package:store_products_viewer/features/products/data/models/product_model.dart';

class ProductService {
  String endpoint = "https://dummyjson.com/products";

  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> products = [];
    try {
      var response = await Dio().get(endpoint);
      var data = response.data['products'];
      data.forEach((json) {
        ProductModel product = ProductModel.fromJson(json);
        products.add(product);
      });
    } catch (e) {
      print(e);
    }
    return products;
  }
}
