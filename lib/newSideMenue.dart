import 'package:fastudy/Categories.dart';
import 'package:fastudy/Profile.dart';
import 'package:fastudy/PromodoraTimer.dart';
import 'package:flutter/material.dart';

class newSideMenue extends StatefulWidget {
  const newSideMenue({super.key});

  @override
  State<newSideMenue> createState() => _newSideMenueState();
}

class _newSideMenueState extends State<newSideMenue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                margin: EdgeInsets.only(right: 170),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 80),
                child: Text(
                  "Hello User!",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF535461),
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Categories()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Search",
                        style: TextStyle(color: Colors.white, fontSize: 35))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: RawMaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            margin: EdgeInsets.only(left: 20),
                            height: 300,
                            width: 300,
                            child: Row(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 50,
                                        child: RawMaterialButton(
                                          fillColor: Color(0xffFBC2EB),
                                          elevation: 0.0,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PromodoraT()));
                                          },
                                          child: const Text(
                                            "Study",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17.92),
                                          ),
                                        ),
                                      ),
                          
                                    ],
                                  ),
                                ),
                                SizedBox(
                                        width: 20,
                                      ),
                                SizedBox(
                                        height: 270,
                                        width: 1,
                                        child: const ColoredBox(
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                        Icons.group,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 50,
                                        child: RawMaterialButton(
                                          fillColor: Color(0xffFBC2EB),
                                          elevation: 0.0,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          onPressed: () {
                                            
                                          },
                                          child: const Text(
                                            "Teach",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17.92),
                                          ),
                                        ),
                                      ),
                                          ],
                                        ),
                                      )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.content_copy,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(" Study\n Sessions",
                        style: TextStyle(color: Colors.white, fontSize: 35))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: RawMaterialButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.group,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(" Teamwork\n Meeting",
                        style: TextStyle(color: Colors.white, fontSize: 35))
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
