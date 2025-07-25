import 'package:fastudy/Subject/AI.dart';
import 'package:flutter/material.dart';

class IntriAiP extends StatefulWidget {
  const IntriAiP({super.key});

  @override
  State<IntriAiP> createState() => _IntriAiPState();
}

class _IntriAiPState extends State<IntriAiP> {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AI1()));
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
                          "AI",
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
                              "Sheet4",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Berth",
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AI2()));

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
                          "AI",
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
                              "Sheet5",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Smith",
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AI3()));

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
                          "AI",
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
                              "Sheet6",
                              style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Ostridge",
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