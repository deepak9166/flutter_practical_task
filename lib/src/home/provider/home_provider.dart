import 'package:flutter/material.dart';
import 'package:flutter_practical_task/services/api_service.dart';

import '../modal/product_model.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  updateLoader(bool status) {
    isLoading = status;
    notifyListeners();
  }

  List<ProductModel> productList = [];

  fetchProductData() async {
    try {
      updateLoader(true);
      var data = await ApiService.fetchProduct();
      productList = data;
      notifyListeners();
      updateLoader(false);
    } catch (e) {
      updateLoader(false);
    }
  }
}
