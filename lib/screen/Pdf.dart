import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;


import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {

  bool _isLoading = false;

  double? per1;
  String? filePath="";

  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(

            children: [
              SizedBox(
                height: 60,
              ),
              ElevatedButton(onPressed: (){
                downloaddata();
              }, child: Text("done"))
            ],
          ),
        )

    );
  }
  Future<void> downloaddata() async {
    setState(() {
      _isLoading = true;
    });

    final pdf = pw.Document();
    final imageProvider = await loadImageFromAsset('img/chat.png');
    final imageProvider1 = await loadImageFromAsset('img/whatsapp.png');

    final imageUrl ="";
    final imageBytes = await fetchImage(imageUrl);
    final pdfWidget = pw.Stack(children: [
      pw.Container(
          width: double.infinity,
          height: double.infinity,
          decoration: pw.BoxDecoration(
            image: pw.DecorationImage(
              image: imageProvider,
              fit: pw.BoxFit.cover,
            ),
          ),
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 10),
                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 15),
                  child: pw.Image(imageProvider1, width: 60, height: 34),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.all(15),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Container(
                        height: 150,
                        // width: 80.w,
                        alignment: pw.Alignment.center,
                        child: pw.Text(
                                    "gfghfcghfgh",
                        ),
                      ),
                      pw.SizedBox(
                        width: 15,
                      ),
                      pw.ClipOval(
                        child: pw.Container(
                          width: 80,
                          height: 80,
                          decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              image: pw.DecorationImage(
                                  image: pw.MemoryImage(
                                      Uint8List.fromList(imageBytes)))),
                        ),
                      ),
                    ],
                  ),
                ),
                // pw.SizedBox(
                //   height:10.h
                // ),
                pw.Opacity(
                  opacity: 0.7,
                  child: pw.Container(
                    padding: pw.EdgeInsets.all(20),
                    margin: pw.EdgeInsets.only(left: 40),
                    decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.only(
                            topLeft: pw.Radius.circular(30),
                            bottomLeft: pw.Radius.circular(30))),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "heloo",
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 30,
                            font: await yourFont(),
                            // font:pw.Font.helvetica(),

                            // fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(
                          height: 7,
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.only(left: 25),
                          child: pw.Row(
                            children: [
                              pw.Text(
                                "heloo",
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 20,
                                  font: await yourFont(),
                                ),
                              ),
                              pw.Text(
                                 "heloo",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 40,
                                    font: await yourFont(),
                                  )),
                              pw.Text("helooo",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 25,
                                    font: await yourFont(),
                                  )),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.only(left: 1),
                          child: pw.Row(
                            children: [
                              pw.Text("heloo",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 20,
                                    font: await yourFont(),
                                  )),
                              pw.Text(
                                "ghdsgg",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 60,
                                    font: await yourFont(),
                                  )),
                              pw.Text("helooo",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 20,
                                    font: await yourFont(),
                                  )),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          height: 4,
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.only(left: 15),
                          child: pw.Row(
                            children: [
                              pw.Text("heloo",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 20,
                                    font: await yourFont(),
                                  )),
                              pw.Text(
                                "hjd",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 55,
                                    font: await yourFont(),
                                  )),
                              pw.Text("helooo",
                                  style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 20,
                                    font: await yourFont(),
                                  )),
                            ],
                          ),
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Text(" helooo",
                            style: pw.TextStyle(
                              color: PdfColors.white,
                              fontSize: 20,
                              font: await yourFont(),
                            )),
                      ],
                    ),
                  ),
                ),
                pw.SizedBox(
                  height: 8,
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 15),
                  child: pw.Text(
                    "hwloooi",
                    style: pw.TextStyle(
                      color: PdfColors.white,
                      fontSize: 17,
                      font: await yourFont(),
                      // fontFamily: "simsan",
                    ),
                  ),
                ),
                // pw.SizedBox(
                //   height: 5.h,
                // ),
                pw.Opacity(
                  opacity: 0.77,
                  child: pw.Container(
                    // height:160.h,
                      padding: pw.EdgeInsets.all(15),
                      margin: pw.EdgeInsets.only(right: 25),
                      decoration: pw.BoxDecoration(
                        // color: Colors.white.withOpacity(0.77),
                          color: PdfColors.white,
                          borderRadius: pw.BorderRadius.only(
                              topRight: pw.Radius.circular(30),
                              bottomRight: pw.Radius.circular(30))),
                      child: pw.Column(children: [
                        for (int index = 0;
                        index <
                           5;
                        index++) ...[
                          pw.Row(
                            crossAxisAlignment:
                            pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                            pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                (index + 1).toString() + " . ",
                                style: pw.TextStyle(
                                  // color: Color(0xffb333333),
                                  fontSize: 20,
                                  font: await yourFont(),
                                ),
                              ),
                              pw.Expanded(
                                child: pw.Text(
                                  "helooo",
                                  maxLines: 2,
                                  // Maximum number of lines before truncating
                                  // Allow text to wrap

                                  style: pw.TextStyle(
                                    color: PdfColors.black,
                                    fontSize: 20,
                                    font: await yourFont(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]
                      ])),
                ),


                ]))
    ]);
    pdf.addPage(pw.Page(
      build: (pw.Context context) => pdfWidget,
    ));
    // final Directory? directory = await getDownloadsDirectory();
    // final String filePath = '${directory?.path}/my_pdf.pdf';
    const downloadsFolderPath = '/storage/emulated/0/Download';
    Directory dir = Directory(downloadsFolderPath);
    final String filePath = '${dir?.path}/suppchat.pdf';
    print(filePath);
    final File file = File(
        filePath!);
    try {
      await file.writeAsBytes(await pdf.save());
      setState(() {
        _isLoading = false;

      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<pw.Font> yourFont() async {
    final fontData = await rootBundle.load(
        'assets/fonts/chinese.msyh.ttf'); // Replace with your font file path
    final fontUint8List = fontData.buffer.asUint8List();
    final fontByteData = ByteData.sublistView(fontUint8List);
    final font = pw.Font.ttf(fontByteData);
    return font;
  }

  Future<pw.MemoryImage> loadImageFromAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();
    return pw.MemoryImage(Uint8List.fromList(bytes));
  }

  Future<List<int>> fetchImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    return response.bodyBytes;
  }
}
