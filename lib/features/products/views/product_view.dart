import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_products_viewer/features/products/viewmodels/cubits/product/product_cubit.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        if (state is ProductLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        }
        if (state is ProductLoaded) {
          return ListView.builder(
              itemCount: state.productData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    state.productData[index].title,
                    style: TextStyle(color: Colors.amber),
                  ),
                );
              });
        }
        if (state is ProductError) {
          return Center(
            child: Text(state.errorMsg),
          );
        }
        return Container();
      }),
    );
  }
}
