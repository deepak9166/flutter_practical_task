import 'dart:convert';

import 'package:http/http.dart' as http;

import '../src/home/modal/product_model.dart';

class ApiService {
  /// fetch data from api
  static Future<List<ProductModel>> fetchProduct() async {
    print('call api');
    var res = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(res.body) as List;

    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
}
