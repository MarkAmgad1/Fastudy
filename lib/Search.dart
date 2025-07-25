import 'package:fastudy/Subject/AI.dart';
import 'package:fastudy/Subject/DS.dart';
import 'package:fastudy/Subject/LA.dart';
import 'package:fastudy/Subject/PR.dart';

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Map<String, dynamic>> _allUser = [
    {"SU": "DA", "Name": "Lab1", "Teacher": "Oliver", "page": DS()},
    {"SU": "PR", "Name": "Lab5", "Teacher": "Evelyn", "page": PR1()},
    {"SU": "PR", "Name": "Lab6", "Teacher": "Rowlstone", "page": PR2()},
    {"SU": "AI", "Name": "Sheet4", "Teacher": "Berth", "page": AI1()},
    {"SU": "AI", "Name": "Sheet5", "Teacher": " ", "page": AI2()},
    {"SU": "AI", "Name": "Sheet6", "Teacher": "Ostridge", "page": AI3()},
    {"SU": "LA", "Name": "Tut1", "Teacher": "Tolworthie", "page": LA1()},
    {"SU": "LA", "Name": "Tut2", "Teacher": "Wilson", "page": LA2()},
    {"SU": "LA", "Name": "Tut3", "Teacher": "Leedal", "page": LA3()},
    {"SU": "PR", "Name": "Lab7", "Teacher": "Goward", "page": PR3()}
  ];

  List<Map<String, dynamic>> _founfUser = [];
  @override
  void initState() {
    _founfUser = _allUser;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUser;
    } else {
      results = _allUser
          .where((user) =>
              user["Name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _founfUser = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 347,
            height: 62,
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(59, 167, 165, 165),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color.fromARGB(59, 167, 165, 165),
                      width: 1,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color.fromARGB(59, 167, 165, 165),
                      width: 1,
                    )),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF9C3FE4),
                ),
                hintText: "Search",
                hintStyle: TextStyle(color: Color(0xff3C3C43)),
              ),
              autocorrect: true,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: _founfUser.isNotEmpty
                  ? ListView.builder(
                      itemCount: _founfUser.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_founfUser[index]["SU"]),
                        //color: Colors.white10,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          //set border radius more than 50% of height and width to make circle
                        ),
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 11),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        _founfUser[index]["page"]));
                          },
                          child: ListTile(
                            title: Row(
                              children: [
                                Container(
                                  height: 54,
                                  width: 54,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFFBC2EB),
                                            Color(0xFFA6C1EE)
                                          ])),
                                  child: Center(
                                    child: Text(
                                      _founfUser[index]["SU"].toString(),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          _founfUser[index]["Name"],
                                          style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          _founfUser[index]["Teacher"],
                                          style: TextStyle(
                                              color: Color(0xFF858585),
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      "No Result Found",
                      style: TextStyle(fontSize: 25),
                    ))
        ]),
      ),
    ));
  }
}
