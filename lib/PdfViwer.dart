import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';

class pdfViewr extends StatefulWidget {
  const pdfViewr({Key? key}) : super(key: key);

  @override
  State<pdfViewr> createState() => _pdfViewrState();
}

class _pdfViewrState extends State<pdfViewr> {
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  double rating = 0;

  Future<void> listExample() async {  
  firebase_storage.ListResult result =  
  await firebase_storage.FirebaseStorage.instance.ref().child('files').listAll();  
  
  result.items.forEach((firebase_storage.Reference ref) {  
    print('Found file: $ref');  
  });  
  
  result.prefixes.forEach((firebase_storage.Reference ref) {  
    print('Found directory: $ref');  
  });  
}

  Future<void> downloadURLExample() async {  
  String downloadURL = await firebase_storage.FirebaseStorage.instance  
  .ref('files/some-file.pdf')  
      .getDownloadURL();  
  print(downloadURL);  
  PDFDocument doc = await PDFDocument.fromURL(downloadURL);  
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPDF(doc)));  //Notice the Push Route once this is done.
}

  @override  
void initState() {  
  // TODO: implement initState  
  super.initState();    
  listExample();  
  downloadURLExample();  
  print("All done!");  
}


  @override
  Widget build(BuildContext context) {
    return Center(  
    child: CircularProgressIndicator(  
    ),  
  );  

  }
  
  
}

class ViewPDF extends StatefulWidget {  
  
  PDFDocument document;  
  ViewPDF(this.document);  
  @override  
  _ViewPDFState createState() => _ViewPDFState();  
}  
  
class _ViewPDFState extends State<ViewPDF> {  
  @override  
  Widget build(BuildContext context) {  
    return Center(  
        child: PDFViewer(document: widget.document));  
  }  
}