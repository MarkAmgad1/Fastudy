import 'package:fastudy/PdfViwer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';

class SummryP extends StatefulWidget {
 // final String 
  const SummryP({Key? key}) : super(key: key);

  @override
  State<SummryP> createState() => _SummryPState();
}

class _SummryPState extends State<SummryP> {
  double rating = 0;
  final user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Color(0xFF9C3FE4),
              )),
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/pdfbackground2.png"),
              fit: BoxFit.fill,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 74,
                        width: 74,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFBC2EB),
                                  Color(0xFFA6C1EE)
                                ])),
                        child: Center(
                          child: Text(
                            "SU",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "PDF1",
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                user!.email!,
                                style: TextStyle(
                                    color: Color(0xFF858585), fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                     
                    ],
                  ),
                  
                   Column(
                        children: [
                          
                          Text(
                            "$rating",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RatingBar.builder(
                            minRating: 1,
                            itemSize: 30,
                            updateOnDrag: true,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) => setState(() {
                              this.rating = rating;
                            }),
                          )
                        ],
                      ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "The Content:",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                      ),
                      
                      
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(right: 170),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                            borderRadius: BorderRadius.circular(20), ),
                    child: RawMaterialButton(
                      onPressed: () { 
                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      pdfViewr()));
                       },
                      child: Row(
                        children: [
                          SizedBox(width: 15,),
                          Icon(Icons.picture_as_pdf , color: Colors.red, size: 40,),
                          SizedBox(width: 15,),
                          Text("Open Here" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold), )
                        ],
                      ),
                    ),
                  )
                  
                ],

              ),
            )),
      ),
    );
    
  }
  
  
}

