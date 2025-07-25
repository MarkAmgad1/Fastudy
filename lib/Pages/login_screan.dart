// ignore_for_file: unnecessary_cast
import 'package:fastudy/Pages/ForgetPass.dart';
import 'package:fastudy/Screanmain.dart';
import 'package:fastudy/Pages/SignAppScrean.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class login_Screan extends StatefulWidget {
  //final VoidCallback showSignupPage;
  const login_Screan({super.key });
  
  @override
  State<login_Screan> createState() => _login_ScreanState();
}
final emailText = TextEditingController();
  final passText = TextEditingController();
class _login_ScreanState extends State<login_Screan> {
  bool isHeddenPassword = true;
  
  
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  @override
  void dispose(){
    emailText.dispose();
    passText.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/Background2-1.png"),
            fit: BoxFit.fill,
          )),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: double.infinity,
                height: 270,
              ),
              Text(
                "Welcome,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Nice to see you!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: Container(
                  width: 339,
                  height: 62,
                  child: TextField(
                    controller: emailText,
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
                        Icons.person,
                        color: Colors.white,
                      ),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                width: 339,
                height: 62,
                child: TextField(
                  controller: passText,
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
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 250),
                  width: 112,
                  height: 16,
                  child: RawMaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPass()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ))),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 314,
                height: 50,
                child: RawMaterialButton(
                  fillColor: const Color(0xFF9C3FE4),
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    
                       signin(emailText, passText) ;
                  
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 17.92),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                    "Or Sign in with",
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
                      onPressed: ()async {
                       await signInWithGoogle();
                      },
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
                      onPressed: () async {
                       // await signInWithFacebook();

                      },
                      
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
                  Text("Don’t have an account?",
                      style: TextStyle(fontSize: 16, color: Color(0xFF000000))),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignAppScrean()));
                     
                    },
                    child: Text(
                      "Sign up",
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
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> signin(emailAddress, password) async {
    

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress.text, password: password.text);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Screanmain()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  /*Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }*/

  
 Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
 



}

/*
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}





*/