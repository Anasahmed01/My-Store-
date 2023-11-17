import 'package:checkout/app/app.locator.dart';
import 'package:checkout/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List productList = [];
  List productPriceList = [];
  List totalPriceList = [];

  
 void totalPrice() {
    final sum = productPriceList;
  }

  addProduct() {
    productList.add(productController.text);
    productPriceList.add(priceController.text);

    clearFields();
    rebuildUi();
  }

  clearFields() {
    productController.clear();
    priceController.clear();
  }

  navigateToReceiptView({required productName, required productPrice}) {
    locator<NavigationService>().navigateTo(
      Routes.receipt,
      arguments: ReceiptArguments(
        productName: productName,
        productPrice: productPrice,
      ),
    );
  }
}
