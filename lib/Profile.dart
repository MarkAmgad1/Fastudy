import 'package:fastudy/Pages/ForgetPass.dart';
import 'package:fastudy/Pages/SignAppScrean.dart';
import 'package:fastudy/Pages/login_screan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/proappbar.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF9C3FE4),
              )),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/probackground.jpg"),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                user!.email!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                  ),
                  Icon(
                    Icons.edit_square,
                    color: Color(0xFF535461),
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "3",
                    style: TextStyle(fontSize: 30, color: Color(0xFF535461)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(right: 90),
                child: RawMaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(right: 90),
                child: RawMaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.question_mark_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "About Us",
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(right: 90),
                child: RawMaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.dark_mode,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Dark Mode",
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Switch(
                          value: _switchValue,
                          onChanged: (newValue) {
                            setState(() {
                              _switchValue = newValue;
                            });
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(right: 90),
                child: RawMaterialButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => login_Screan()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.output,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.white, fontSize: 34),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
