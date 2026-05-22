import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_products_viewer/features/products/viewmodels/cubits/product/product_cubit.dart';
import 'package:store_products_viewer/features/products/widgets/product_card.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.015,
        ),
        child:
            BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            );
          }
          if (state is ProductLoaded) {
            return GridView.builder(
                itemCount: state.productData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.63,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: state.productData[index]);
                });
          }
          if (state is ProductError) {
            return Center(
              child: Text(state.errorMsg),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
