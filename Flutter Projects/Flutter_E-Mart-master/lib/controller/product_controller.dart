import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/category_model.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;
var totalPrice = 0.obs;

  var subCategory = [];
  getSubCategory(title) async {
    subCategory.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decode = categoryModelFromJson(data);
    var filter =
        decode.categories.where((element) => element.name == title).toList();

    for (var e in filter[0].subcategories) {
      subCategory.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuantity(p_quantity) {
    if (quantity.value < p_quantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price){
    totalPrice.value = price*quantity.value;
  }
}
