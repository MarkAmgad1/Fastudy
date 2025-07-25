import 'package:fastudy/Pages/SignAppScrean.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final email = TextEditingController();
  @override
  void despose(){
    email.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/forgetpassBackgroung.png"),
                fit: BoxFit.fill,
              )),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 130 ,left: 20),
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 200,left: 1),
                      child: Text(
                        "Enter email address",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
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
                          resetPassword();
                        },
                        child: Text(
                          "Reset Password",
                          style:
                              TextStyle(color: Colors.white, fontSize: 17.92),
                        ),
                      ),
                    ),
                    SizedBox(height: 330,),
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
                ],)
                  ],
                ),
              ),
            )));

      
  }
  Future resetPassword() async{

        try{
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());
        showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                content: Container(
                  height: 100,
                  width: 150,
                  child: Column(
                    children: [
                      Text("Password reset link sent! Check your email"),
                      SizedBox(height: 10,),
                      TextButton(onPressed: (){
                         Navigator.of(context).popUntil((route) => route.isFirst);
                      }, child: Text("OK" ,style: TextStyle(color: Color(0xFF9C3FE4),),))
                    ],
                  ),
                ),
              );
            });
        }on FirebaseAuthException catch (e){
          print(e);
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                content: Text(e.message.toString()),
              );
            });
        }
      }
}
