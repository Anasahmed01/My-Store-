// ignore_for_file: prefer_const_constructors

import 'package:checkout/src/reuseable_widget/buttons/custom_buttons.dart';
import 'package:checkout/src/reuseable_widget/text/custome_text.dart';
import 'package:checkout/src/reuseable_widget/textfields/textfield.dart';
import 'package:checkout/src/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.totalPriceFunc();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
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
                        width: MediaQuery.sizeOf(context).width * 0.32,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Text('Company Name'),
                              SizedBox(
                                height: 30,
                              ),
                              appTextField(
                                hintText: 'Enter product Name',
                                controller: viewModel.productController,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              appTextField(
                                hintText: 'Enter product Price',
                                keBoardType: TextInputType.number,
                                controller: viewModel.priceController,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await viewModel.addProduct();
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Receipt()),
                                  // );
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
                                  viewModel.navigateToReceiptView(
                                    productName: viewModel.productList,
                                    productPrice: viewModel.productPriceList,
                                  );
                                  viewModel.totalPriceFunc();
                                },
                                child: customButton(
                                  text: 'Check Out',
                                  buttonHeight: 46,
                                  buttonwidth:
                                      MediaQuery.sizeOf(context).width * 0.2,
                                ),
                              ),
                              //customSizedText(text: '${viewModel.totalPrice.}'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //       image: AssetImage('assets/store.png'),
                      //       fit: BoxFit.cover,
                      //       opacity: 0.5),
                      //   borderRadius: BorderRadius.circular(5),
                      //   color: Colors.white,
                      //   boxShadow: [
                      //     BoxShadow(
                      //         color: Colors.grey.shade400,
                      //         spreadRadius: 1,
                      //         blurRadius: 5),
                      //   ],
                      // ),
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
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customSizedText(
                                    text: viewModel.productPriceList[index],
                                    fontWeight: FontWeight.w500,
                                    size: 16,
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
