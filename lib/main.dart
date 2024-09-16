import 'package:fakestore/cubit/productsCubit/products_cubit.dart';
import 'package:fakestore/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(
    BlocProvider(
      create: (context) => ProductsCubit(),
      child: const MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
