import 'package:fastudy/Screanmain.dart';
import 'package:fastudy/Pages/login_screan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context , snapshot){
            if(snapshot.hasData){
              return const Screanmain();
            }else{
              return const login_Screan();
            }
          }),
      
    );
  }
}