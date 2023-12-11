// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:typed_data';
import 'package:checkout/src/reuseable_widget/text/custome_text.dart';
import 'package:checkout/src/views/receipt/recepit_viewmodel.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Receipt extends StatelessWidget {
  final List productName;
  final List productPrice;
  final int totalPrice;
  const Receipt({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.totalPrice,
  });

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
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: customSizedText(
                            text: 'Price',
                            fontWeight: FontWeight.w500,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                    SizedBox(
                      height: 100,
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
                          text: 'Total Price:',
                          size: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        customSizedText(
                          text: totalPrice.toString(),
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
                    SizedBox(
                      height: 600,
                      width: 500,
                      child: PdfPreview(
                        build: (format) => generatePdf(
                            format: PdfPageFormat(612, 792, marginAll: 72),
                            productName: productName,
                            productPrice: productPrice,
                            totalPrice: totalPrice),
                      ),
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

Future<Uint8List> generatePdf(
    {required PdfPageFormat format,
    required int totalPrice,
    required List productName,
    required List productPrice}) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Column(
          children: [
            pw.Text('GROCERY',
                style: pw.TextStyle(
                  fontSize: 25,
                )),
            pw.SizedBox(
              height: 10,
            ),
            pw.Text('Address: B231, Nagan Chorangi, Karachi',
                style: pw.TextStyle(
                  fontSize: 14,
                )),
            pw.Text('Tel: +92 987654321',
                style: pw.TextStyle(
                  fontSize: 14,
                )),
            pw.Text('Web: www.GroceryStore.com',
                style: pw.TextStyle(
                  fontSize: 14,
                )),
            pw.SizedBox(
              height: 20,
            ),
            pw.Container(
              height: 1,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(style: pw.BorderStyle.dotted),
              ),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 16.0),
                  child: pw.Text('Item',
                      style: pw.TextStyle(
                        fontSize: 20,
                      )),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(right: 16.0),
                  child: pw.Text('Price',
                      style: pw.TextStyle(
                        fontSize: 14,
                      )),
                ),
              ],
            ),
            pw.ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Padding(
                      padding:
                          pw.EdgeInsets.only(left: 16.0, top: 4, bottom: 4),
                      child: pw.Text(productName[index],
                          style: pw.TextStyle(
                            fontSize: 16,
                          )),
                    ),
                    pw.Padding(
                      padding:
                          pw.EdgeInsets.only(right: 16.0, top: 4, bottom: 4),
                      child: pw.Text(productPrice[index],
                          style: pw.TextStyle(
                            fontSize: 16,
                          )),
                    ),
                  ],
                );
              },
            ),
            pw.SizedBox(
              height: 100,
            ),
            pw.Container(
              height: 1,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(style: pw.BorderStyle.dotted),
              ),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'Total Price:',
                  style: pw.TextStyle(fontSize: 24),
                ),
                pw.Text(totalPrice.toString(),
                    style: pw.TextStyle(fontSize: 24)),
              ],
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Container(
              height: 1,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  style: pw.BorderStyle.dotted,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}


// Future<Uint8List> generatePdf(
//     {required PdfPageFormat format,
//     required BuildContext context,
//     totalPrice,
//     productName,
//     productPrice}) async {
//   final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

//   // final svgImage = pw.SvgImage(
//   //   svg: 'assets/Cart.svg',
//   //   height: 120,
//   //   width: 80,
//   // );

//   pdf.addPage(
//     pw.Page(
//       pageFormat: format,
//       build: (context) {
//         return
           

//             pw.Center(
//           child: pw.Container(
//             padding: pw.EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//             decoration: pw.BoxDecoration(
//               borderRadius: pw.BorderRadius.circular(5),
//             ),
//             width: MediaQuery.sizeOf(context as BuildContext).height * 0.6,
//             child: pw.Column(
//               children: [
//                 // pw.SizedBox(child: svgImage),
//                 pw.SizedBox(
//                   height: 10,
//                 ),
//                 pw.Text('GROCERY',
//                     style: pw.TextStyle(
//                       fontSize: 25,
//                     )),
//                 pw.SizedBox(
//                   height: 10,
//                 ),
//                 pw.Text('Address: B231, Nagan Chorangi, Karachi',
//                     style: pw.TextStyle(
//                       fontSize: 14,
//                     )),
//                 pw.Text('Tel: +92 987654321',
//                     style: pw.TextStyle(
//                       fontSize: 14,
//                     )),
//                 pw.Text('Web: www.GroceryStore.com',
//                     style: pw.TextStyle(
//                       fontSize: 14,
//                     )),
//                 pw.SizedBox(
//                   height: 20,
//                 ),
//                 pw.Row(children: [
//                   pw.Text(
//                       '-------------------------------------------------------------------------------------------------')
//                 ]),
//                 pw.SizedBox(
//                   height: 20,
//                 ),
//                 pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                   children: [
//                     pw.Padding(
//                       padding: pw.EdgeInsets.only(left: 16.0),
//                       child: pw.Text('Item',
//                           style: pw.TextStyle(
//                             fontSize: 20,
//                           )),
//                     ),
//                     pw.Padding(
//                       padding: pw.EdgeInsets.only(right: 16.0),
//                       child: pw.Text('Price',
//                           style: pw.TextStyle(
//                             fontSize: 14,
//                           )),
//                     ),
//                   ],
//                 ),




//                 pw.ListView.builder(
//                   itemCount: productName,
//                   itemBuilder: (context, index) {
//                     return pw.Row(
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         pw.Padding(
//                           padding:
//                               pw.EdgeInsets.only(left: 16.0, top: 4, bottom: 4),
//                           child: pw.Text(productName[index],
//                               style: pw.TextStyle(
//                                 fontSize: 16,
//                               )),
//                         ),
//                         pw.Padding(
//                           padding: pw.EdgeInsets.only(
//                               right: 16.0, top: 4, bottom: 4),
//                           child: pw.Text(productPrice[index],
//                               style: pw.TextStyle(
//                                 fontSize: 16,
//                               )),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//                 pw.SizedBox(
//                   height: 100,
//                 ),
//                 pw.Row(children: [
//                   pw.Text(
//                       '-------------------------------------------------------------------------------------------------')
//                 ]),
//                 pw.SizedBox(
//                   height: 20,
//                 ),
//                 pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                   children: [
//                     pw.Text(
//                       'Total Price:',
//                       style: pw.TextStyle(fontSize: 24),
//                     ),
//                     pw.Text(totalPrice.toString(),
//                         style: pw.TextStyle(fontSize: 24)),
//                   ],
//                 ),
//                 pw.SizedBox(
//                   height: 10,
//                 ),
//                 pw.Row(children: [
//                   pw.Text(
//                       '-------------------------------------------------------------------------------------------------')
//                 ]),
//                 pw.SizedBox(
//                   height: 2,
//                 ),
//                 pw.Row(children: [
//                   pw.Text(
//                       '-------------------------------------------------------------------------------------------------')
//                 ]),
//               ],
//             ),
//           ),
//         );
//       },
//     ),
//   );

//   return pdf.save();
// }
