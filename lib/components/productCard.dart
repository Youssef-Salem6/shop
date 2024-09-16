import 'package:fakestore/constant/colors.dart';
import 'package:fakestore/models/productsModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  ProductCard({super.key, required this.productsModel});
  ProductsModel productsModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLove = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: kGray),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(widget.productsModel.image!),
                  width: 160,
                  height: 120,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    widget.productsModel.title!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: kBlue),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Text(
                    widget.productsModel.description!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: kBlue),
                  ),
                ),
                const Gap(10),
                Text(
                  "EGP ${widget.productsModel.price}",
                  style: TextStyle(fontSize: 18, color: kBlue),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Review (${widget.productsModel.rate}) ",
                            style: TextStyle(fontSize: 16, color: kBlue),
                          ),
                          const Image(
                            image: AssetImage("assets/images/star.png"),
                            width: 20,
                            height: 20,
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kBlue,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Image(
                          image: AssetImage("assets/images/plus-small.png"),
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isLove = !isLove;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Image(
                image: isLove
                    ? const AssetImage("assets/images/heart2.png")
                    : const AssetImage("assets/images/heart.png"),
                width: 30,
                height: 30,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
