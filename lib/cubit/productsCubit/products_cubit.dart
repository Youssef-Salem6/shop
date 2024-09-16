import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  List<dynamic> data = [];

  getProducts({required int index}) async {
    try {
      emit(Productsloading());
      String uri = "https://fakestoreapi.com/products";
      Uri url = Uri.parse(uri);
      http.Response response = await http.get(url);
      data = jsonDecode(response.body);
      emit(ProductsSuccess());
    } on Exception {
      emit(ProductsFail());
    }
  }
}
