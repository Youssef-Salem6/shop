import 'package:fakestore/components/productCard.dart';
import 'package:fakestore/cubit/productsCubit/products_cubit.dart';
import 'package:fakestore/models/productsModel.dart';
import 'package:fakestore/pages/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return state is Productsloading
                ? const LoadingPage()
                : ListView.builder(
                    itemCount:
                        BlocProvider.of<ProductsCubit>(context).data.length,
                    itemBuilder: (context, index) {
                      if (index % 2 != 0) {
                        return const SizedBox.shrink();
                      }
                      ProductsModel firstProductsModel = ProductsModel.fromjson(
                          BlocProvider.of<ProductsCubit>(context).data[index]);
                      ProductsModel secProductsModel = ProductsModel.fromjson(
                          BlocProvider.of<ProductsCubit>(context)
                              .data[index + 1]);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductCard(productsModel: firstProductsModel),
                          ProductCard(productsModel: secProductsModel)
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
