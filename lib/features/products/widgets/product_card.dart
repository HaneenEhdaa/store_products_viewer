import 'package:flutter/material.dart';
import 'package:store_products_viewer/features/products/data/models/product_model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(255, 196, 218, 236),
            width: 2,
          )),
      child: Column(
        children: [
          Container(
            height: height * 0.16,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 241, 241),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Image.network(
                    widget.product.thumbnail,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: height * 0.01,
                  right: width * 0.02,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 155, 155, 155),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : Color.fromARGB(255, 1, 72, 142),
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(width * 0.015),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: width * 0.040,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff06004F),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.003,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.product.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: width * 0.040,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff06004F),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.009,
                  ),
                  Row(
                    children: [
                      Text(
                        "EGP ${(widget.product.price - (widget.product.price * widget.product.discountPercentage / 100)).toStringAsFixed(2)}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff06004F),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4.0,
                        ),
                        child: Text(
                          " ${widget.product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: width * 0.03,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.blue.shade300,
                            decorationThickness: 2,
                            color: Colors.blue.shade300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Review (${widget.product.rating})",
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: const Color(0xff06004F),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 1, 72, 142),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 155, 155, 155),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${widget.product.title} added to cart",
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 125, 194, 55),
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.all(12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(
                                width * 0.018,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: width * 0.06,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
