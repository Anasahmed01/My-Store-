// ignore_for_file: unrelated_type_equality_checks

import 'package:checkout/app/app.locator.dart';
import 'package:checkout/app/app.router.dart';
import 'package:checkout/src/service/snackbar_service/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List productList = [];
  List productPriceList = [];

  num totalPrice = 0;

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
    rebuildUi();
  }

  navigateToReceiptView({required productName, required productPrice}) {
    if (productList.isEmpty && productPriceList.isEmpty) {
      ShowSnackBarService.showSnackbar('', 'please add some product!');
    } else {
      locator<NavigationService>().navigateTo(
        Routes.receipt,
        arguments: ReceiptArguments(
          productName: productName,
          productPrice: productPrice,
        ),
      );
    }

    rebuildUi();
  }

  total() async {
    // Create a list of integers
    var subTotalPrice = await Future.wait(productPriceList as Iterable<Future>);

    // Calculate the sum of the list using the fold() method
    var sum = subTotalPrice.fold(
        0, (dynamic currentSum, dynamic element) => currentSum + element);

    // Print the result
    print('Sum of the list: $sum');
  }
}
