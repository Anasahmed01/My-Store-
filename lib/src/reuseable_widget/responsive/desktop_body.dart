// ignore_for_file: prefer_const_constructors

import 'package:checkout/src/reuseable_widget/buttons/custom_buttons.dart';
import 'package:checkout/src/reuseable_widget/text/custome_text.dart';
import 'package:checkout/src/reuseable_widget/textfields/textfield.dart';
import 'package:checkout/src/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../utils/validation/validation.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) async {},
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.5,
                image: AssetImage('assets/store.png'),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Form(
                            key: viewModel.formKey,
                            child: Column(
                              children: [
                                Text(
                                  'Chagan Store',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                appTextField(
                                  validator: (value) =>
                                      validateProductName(value),
                                  hintText: 'Product Name',
                                  controller: viewModel.productController,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                appTextField(
                                  validator: (value) => validatePrice(value),
                                  hintText: 'Product Price',
                                  keBoardType: TextInputType.number,
                                  controller: viewModel.priceController,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (viewModel.formKey.currentState!
                                        .validate()) {
                                      await viewModel.addProduct();
                                    }
                                  },
                                  child: customButton(
                                    text: 'Add to Cart',
                                    buttonHeight: 46,
                                    buttonwidth:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    viewModel.total();
                                    viewModel.navigateToReceiptView(
                                      productName: viewModel.productList,
                                      productPrice: viewModel.productPriceList,
                                      totalPrice: viewModel.totalPrice,
                                    );
                                  },
                                  child: customButton(
                                    text: 'Check Out',
                                    buttonHeight: 46,
                                    buttonwidth:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.productList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: customSizedText(
                            text: viewModel.productList[index],
                            fontWeight: FontWeight.w500,
                            size: 16,
                          ),
                          trailing: SizedBox(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: customSizedText(
                                    text:
                                        "Rs: ${viewModel.productPriceList[index]}",
                                    fontWeight: FontWeight.w500,
                                    size: 16,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    viewModel.deleteProduct(index: index);
                                  },
                                  child: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
