// ignore_for_file: unrelated_type_equality_checks, unnecessary_brace_in_string_interps, avoid_print

import 'package:checkout/app/app.locator.dart';
import 'package:checkout/app/app.router.dart';
import 'package:checkout/src/service/snackbar_service/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<String> productList = [];
  List<String> productPriceList = [];

  addProduct() {
    if (productController.text.isEmpty && priceController.text.isEmpty) {
      ShowSnackBarService.showSnackbar('', 'please fill the fields!');
    } else {
      productList.add(productController.text);
      productPriceList.add(priceController.text);
    }

    // print(productList);
    // print(productPriceList);
    rebuildUi();
    clearFields();
  }

  clearFields() {
    productController.clear();
    priceController.clear();
  }

  deleteProduct({required int index}) {
    productList.removeAt(index);
    productPriceList.removeAt(index);
    rebuildUi();
    notifyListeners();
  }

  navigateToReceiptView(
      {required productName, required productPrice, required totalPrice}) {
    if (productList.isEmpty && productPriceList.isEmpty) {
      ShowSnackBarService.showSnackbar('', 'please add some product!');
    } else {
      locator<NavigationService>().navigateTo(
        Routes.receipt,
        arguments: ReceiptArguments(
          totalPrice: totalPrice,
          productName: productName,
          productPrice: productPrice,
        ),
      );
    }

    rebuildUi();
  }

  var totalPrice = 0;
  total() {
    List<String> prList = productPriceList;

    List<int> numbers = prList.map((price) => int.parse(price)).toList();
    print('total priceeeeeee>>>>>>${numbers}');
    var sum = numbers.fold(
        0, (dynamic currentSum, dynamic element) => currentSum + element);

    // Add the sum to totalPrice
    rebuildUi();
    totalPrice = sum as int;
    print('total priceeeeeee>>>>>>${totalPrice}');
    notifyListeners();
    rebuildUi();
  }
}
