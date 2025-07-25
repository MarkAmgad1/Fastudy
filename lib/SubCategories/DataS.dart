import 'package:fastudy/Subject/DS.dart';
import 'package:flutter/material.dart';

class DataSP extends StatefulWidget {
  const DataSP({super.key});

  @override
  State<DataSP> createState() => _DataSPState();
}

class _DataSPState extends State<DataSP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            image: AssetImage("images/search background.png"),
            fit: BoxFit.fill,
          )),
          child: Center(
              child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 80,

              //padding: EdgeInsets.symmetric(vertical: 11.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xffDDACE5),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DS()));
                },
                child: Row(
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFFBC2EB), Color(0xFFA6C1EE)])),
                      child: Center(
                        child: Text(
                          "DS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lab1",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Oliver",
                              style: TextStyle(
                                  color: Color(0xFF858585), fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            
          ])),
        ));
  }
}