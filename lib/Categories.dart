import 'package:fastudy/Search.dart';
import 'package:fastudy/SubCategories/DataS.dart';
import 'package:fastudy/SubCategories/IntroAi.dart';
import 'package:fastudy/SubCategories/LinearA.dart';
import 'package:fastudy/SubCategories/Programming.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Search(),
                          ),
                        );
              },
              icon: Icon(
                Icons.search,
                color: Color(0xFF9C3FE4),
                size: 30,
              ),
            )
          ],
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
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            Container(
                margin: const EdgeInsets.only(right: 200),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(60, 107, 106, 106),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>LinearP()));
                        
                      },
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list,
                                color: Color(0xFF9C3FE4),
                                size: 60,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Linear Algebra",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(60, 107, 106, 106),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DataSP()));
                      },
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.data_array,
                                color: Color(0xFF9C3FE4),
                                size: 60,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Data Structure",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(60, 107, 106, 106),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProgramingP()));
                      },
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.terminal,
                                color: Color(0xFF9C3FE4),
                                size: 60,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Programming",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(60, 107, 106, 106),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>IntriAiP()));
                      },
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.smart_toy,
                                color: Color(0xFF9C3FE4),
                                size: 60,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Intro to AI",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}

