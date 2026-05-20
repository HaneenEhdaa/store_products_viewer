import 'package:flutter/material.dart';
import 'package:store_products_viewer/features/products/data/models/product_model.dart';
import 'package:store_products_viewer/features/products/data/services/product_service.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<ProductModel> products = [];
  getMyProduct() async {
    products = await ProductService().getProduct();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                products[index].title,
                style: TextStyle(color: Colors.amber),
              ),
            );
          }),
    );
  }
}
