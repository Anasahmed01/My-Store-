// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:checkout/src/reuseable_widget/text/custome_text.dart';
import 'package:checkout/src/views/receipt/recepit_viewmodel.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class Receipt extends StatelessWidget {
  final List productName;
  final List productPrice;
  const Receipt({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ReceiptViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        spreadRadius: 1,
                        blurRadius: 5),
                  ],
                ),
                height: MediaQuery.sizeOf(context).height * 0.8,
                width: MediaQuery.sizeOf(context).height * 0.6,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/Cart.svg',
                      height: 120,
                      width: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customSizedText(
                      text: 'GROCERY',
                      size: 25,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customSizedText(
                      text: 'Address: B231, Nagan Chorangi, Karachi',
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    customSizedText(
                      text: 'Tel: +92 987654321',
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    customSizedText(
                      text: 'Web: www.GroceryStore.com',
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DottedLine(
                      dashLength: 5,
                      dashGapLength: 2,
                      lineThickness: 1,
                      dashColor: Colors.black,
                      dashGapColor: Colors.white,
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: customSizedText(
                            text: 'Item',
                            fontWeight: FontWeight.w500,
                            size: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: customSizedText(
                            text: 'Price',
                            fontWeight: FontWeight.w500,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: productName.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0, top: 4, bottom: 4),
                                  child: customSizedText(
                                      text: productName[index],
                                      fontWeight: FontWeight.w500,
                                      size: 16,
                                      maxLine: 2),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 16.0, top: 4, bottom: 4),
                                  child: customSizedText(
                                    text: productPrice[index],
                                    fontWeight: FontWeight.w500,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    DottedLine(
                      dashLength: 5,
                      dashGapLength: 2,
                      lineThickness: 1,
                      dashColor: Colors.black,
                      dashGapColor: Colors.white,
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customSizedText(
                          text: 'Total Price: ',
                          size: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DottedLine(
                      dashLength: 5,
                      dashGapLength: 2,
                      lineThickness: 2,
                      dashColor: Colors.black,
                      dashGapColor: Colors.white,
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    DottedLine(
                      dashLength: 5,
                      dashGapLength: 2,
                      lineThickness: 2,
                      dashColor: Colors.black,
                      dashGapColor: Colors.white,
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
