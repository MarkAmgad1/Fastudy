// ignore: file_names

import 'package:fastudy/Profile.dart';
import 'package:fastudy/SummryPage.dart';
import 'package:fastudy/newSideMenue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class Screanmain extends StatefulWidget {
  const Screanmain({super.key});

  @override
  State<Screanmain> createState() => _ScreanmainState();
}

class _ScreanmainState extends State<Screanmain> {
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  List<Widget> _buttonList = []; // Initialize empty list to store buttons
  int _buttonCount = 0;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: sideMenuKey,
      background: Color(0xffDDACE5),
      menu: newSideMenue(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                if (sideMenuKey.currentState!.isOpened)
                  sideMenuKey.currentState!.closeSideMenu(); // close side menu
                else
                  sideMenuKey.currentState!.openSideMenu();
              },
              icon: Icon(
                Icons.sort,
                size: 32,
                color: Colors.black,
              )),
          title: Row(children: [
            SizedBox(
              width: 80,
            ),
            ShaderMask(
                shaderCallback: (Rect bounds) => LinearGradient(
                      colors: [
                        Color(0xFF9C3FE4),
                        Color(0xFFB5D9E4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      //transform: GradientRotation(3.14159265359/ 4),
                    ).createShader(bounds),
                child: Text("Fastudy",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32))),
            SizedBox(
              width: 63,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("images/profile.png"),
              ),
            )
          ]),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                right: 10,
                child: Column(children: [
                  Image(
                    image: AssetImage(
                      "images/decoration.png",
                    ),
                    height: 220,
                    width: 276,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 130),
                      child: Text(
                        user!.email!,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF535461),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]),
              ),
              Positioned(
                  top: 350,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/Sammury-1.jpg"),
                          fit: BoxFit.cover,
                        ),
                        color: Color.fromARGB(31, 156, 150, 150),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Color(0xffDDACE5),
                                Color(0xFF9C3FE4)
                              ])),
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Row(children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Upload Summaries :",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white , fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            IconButton(
                                onPressed: () async {
                                  final path = await FlutterDocumentPicker
                                      .openDocument();
                                  print(path);
                                  File file = File(path!);
                                  firebase_storage.UploadTask? task =
                                      await uploadFile(file);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 100,
                                            width: 150,
                                            child: Column(
                                              children: [
                                                Text(
                                                    "You have succeeded Upload file Go to your SummryPage"),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      SummryP()));
                                                    },
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF9C3FE4),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
                                ))
                          ]),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            child: RawMaterialButton(
                              fillColor: Colors.white,
                              elevation: 0.0,
                              padding: EdgeInsets.symmetric(vertical: 11.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: ((context) => SummryP())));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                 begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                Color(0xFFFBC2EB),
                                Color(0xFFA6C1EE)
                              ])),
                                    height: 54,
                                    width: 54,
                                    child: Center(
                                      child: Text(
                                        "SU",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18 , fontWeight:FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "My Summry",
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        user!.email!,
                                        style: TextStyle(
                                            color: Color(0xFF858585),
                                            fontSize: 14),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ]),
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }

  Future<firebase_storage.UploadTask?> uploadFile(File file) async {
    if (file == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: 100,
                width: 150,
                child: Column(
                  children: [
                    Text("Unable to Upload"),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(
                            color: Color(0xFF9C3FE4),
                          ),
                        ))
                  ],
                ),
              ),
            );
          });
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('files')
        .child('/some-file.pdf');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = ref.putData(await file.readAsBytes(), metadata);

    print("done..!");
    return Future.value(uploadTask);
  }
}
