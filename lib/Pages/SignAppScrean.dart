
import 'package:fastudy/Pages/login_screan.dart';
import 'package:fastudy/Screanmain.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignAppScrean extends StatefulWidget {
  const SignAppScrean({super.key});
  @override
  State<SignAppScrean> createState() => _SignAppScreanState();
}

class _SignAppScreanState extends State<SignAppScrean> {
  
  final email = TextEditingController();
  final pass = TextEditingController();
  final confirmPass = TextEditingController();
  bool isHeddenPassword = true;

  
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/appbar.jpg"),
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
                  image: AssetImage("images/Background3-1.png"),
                  fit: BoxFit.cover,
                )),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                    ),
                    Text(
                      "Create Account,,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "to get start now!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 35),
                      child: Container(
                        width: 339,
                        height: 62,
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(61, 255, 255, 255),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                      child: Container(
                        width: 339,
                        height: 62,
                        child: TextField(
                          controller: pass,
                          obscureText: isHeddenPassword,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(61, 255, 255, 255),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHeddenPassword = !isHeddenPassword;
                                });
                              },
                              child: Icon(
                                isHeddenPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                      child: Container(
                        width: 339,
                        height: 62,
                        child: TextField(
                          controller: confirmPass,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(61, 255, 255, 255),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 314,
                      height: 50,
                      child: RawMaterialButton(
                        fillColor: Color(0xFF9C3FE4),
                        elevation: 0.0,
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          setState(() {
                            signup(email, pass);
                          });
                        },
                        child: Text(
                          "Sign up",
                          style:
                              TextStyle(color: Colors.white, fontSize: 17.92),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Divider(
                            color: Colors.black,
                            indent: 50,
                            endIndent: 20,
                            thickness: 1,
                          ),
                        ),
                        Text(
                          "Or Sign up with",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Divider(
                            color: Colors.black,
                            endIndent: 50,
                            indent: 20,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 58.1,
                          height: 44,
                          child: RawMaterialButton(
                            elevation: 0.0,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset("images/google.png"),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 58.1,
                          height: 44,
                          child: RawMaterialButton(
                            elevation: 0.0,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset("images/facebook.png"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account!",
                      style: TextStyle(fontSize: 16, color: Color(0xFF000000))),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> login_Screan()));
                     
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xFF9C3FE4),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              )
                  ],
                )))));
  }


  Future<void> signup(emailText, passText) async {
  if(passwordConfirmed()){
    try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailText.text,
      password: passText.text,
    );
    Navigator.push(context , MaterialPageRoute(builder: (context)=> Screanmain()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  }
}

bool passwordConfirmed(){
  if(pass.text.trim() == confirmPass.text.trim()){
    return true;
  }else{
    return false;
  }
}


}


