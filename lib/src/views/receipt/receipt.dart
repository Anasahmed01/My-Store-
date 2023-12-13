// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:typed_data';
import 'package:checkout/src/views/receipt/recepit_viewmodel.dart';
import 'package:flutter/material.dart';
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
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: Center(
            child: SizedBox(
              height: 700,
              width: 600,
              child: PdfPreview(
                build: (format) => generatePdf(
                    format: PdfPageFormat.standard
                        .copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
                    productName: productName,
                    productPrice: productPrice,
                    totalPrice: totalPrice,
                    viewModel: ReceiptViewModel()),
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
    required ReceiptViewModel viewModel,
    required List productPrice}) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Column(
          children: [
            pw.Text('Chagan Store',
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
            pw.Text('Web: www.ChaganStore.com',
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
              height: 50,
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
            pw.SizedBox(
              height: 20,
            ),
            pw.Text(
              'Thank You!',
              style: pw.TextStyle(fontSize: 22),
            ),
            pw.SizedBox(
              height: 15,
            ),
            pw.Text(
              viewModel.time.toString(),
              style: pw.TextStyle(fontSize: 22),
            ),
            pw.SizedBox(
              height: 20,
            ),
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text(
                textAlign: pw.TextAlign.center,
                'Note: Goods once soled will not be taken back or exchage',
                style: pw.TextStyle(
                  fontSize: 22,
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
