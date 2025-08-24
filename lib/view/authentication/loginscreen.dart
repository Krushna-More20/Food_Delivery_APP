

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/authentication/forgetpasswordscreen.dart';
import 'package:food_delivery_app/view/authentication/newaccountscreen.dart';
import 'package:food_delivery_app/view/bottomnavigation.dart';
import 'package:food_delivery_app/view/homescreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const Loginscreen());
}

class Loginscreen extends StatefulWidget{
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState () => _LoginscreenState ();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

bool _obscureText = true;

  Widget build(BuildContext context){
    return  Scaffold(

      backgroundColor: Colors.white,
      body: 
      SingleChildScrollView(
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.start,
        //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(
              height: 70,
              width: 400,
            ), 
            Image.asset("assets/food-logo.jpg",    
               height: 100,
            ),
            
            const SizedBox(
              height: 50,      
            ),
           const  Row(
              children: [
                SizedBox(
                  width: 30,
                ),
            const Text(
              "Login to your Account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),         
            ),
              ],
            ),
             const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left:30,right: 30),
              
                child: TextField(
                  
                  controller: emailcontroller,
                  style: const TextStyle(
                  fontSize : 20,
                  ),
                 // obscureText: true,
                  decoration: const InputDecoration(
                   // suffixIcon: Icon(Icons.visibility),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(0, 0, 0, 0.4), 
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField(        
                  controller: passwordcontroller,
                  style: const TextStyle(
                  fontSize : 20,
                  ),
                  obscureText: _obscureText,
                  decoration:  InputDecoration(
                    suffixIcon: IconButton(
                     icon: Icon(
                      _obscureText? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                     },
                   ),
                    hintText: "Password",
                    hintStyle:const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(0, 0, 0, 0.4), 
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: [
                 const SizedBox(
                    width: 240,
                  ),
                  GestureDetector(
                    onTap: () {
                     
                  Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const Forgetpasswordscreen(),
                    ),
                 );
              }, 
                  child: 
                  const Text("Forget Password",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(56, 112, 56, 1),
                  ),
                  ),
                  ),
                  
                ],
              ),
        
              const SizedBox(
                height: 30,
              ),
        
        
              GestureDetector(
                onTap: () async{
                  Map<String, dynamic> Userdata = {
                        "Email": emailcontroller.text,
                        "Password" : passwordcontroller.text,
                      };
        
                    if (emailcontroller.text.trim().isNotEmpty &&
                        passwordcontroller.text.trim().isNotEmpty) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailcontroller.text.trim(),
                          password: passwordcontroller.text.trim(),
                        );
                        Navigator.push(
                        context, 
                        MaterialPageRoute(
                        builder: (context) => const Bottomnavigation(),
                        )
                    );   
                        //Navigator.of(context).pop();
                      } on FirebaseAuthException catch (authobj) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authobj.message ?? "Error"),
                          backgroundColor: Colors.red,),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Enter the data first"),
                        backgroundColor: Colors.red,
                        ),
                      );
                    }                  
                    emailcontroller.clear();
                    passwordcontroller.clear();
                               
                },
                child: Container(
                  
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(14, 161, 125, 1), 
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
        
              const SizedBox(
                height: 50,
              ),
            const Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),  // <-- added horizontal padding
              child: Row(
               children: [
                const Expanded(
                 child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                 ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                     "OR",
                      style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                     ),
                   ),
                ),
               const Expanded(
                  child: Divider(
                   thickness: 1,
                   color: Colors.grey,
                  ),
                ),
              ],
             ),
           ),


              GestureDetector(
                onTap: () async{
                 final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                 final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

                 final credential = GoogleAuthProvider.credential(
                  accessToken: googleAuth?.accessToken,
                  idToken: googleAuth?.idToken,
                 );
                 await FirebaseAuth.instance.signInWithCredential(credential);

                 Navigator.pushReplacement(
                    context, MaterialPageRoute(
                    builder: (context) => Bottomnavigation(),
                    )
                 );
                },
                
                child: Container(
                  
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:const Color.fromARGB(255, 255, 255, 255), 
                    border: Border.all(width: 2,color:const Color.fromRGBO(0, 0, 0, 1),)
                  ),
                  alignment: Alignment.center,
                  child: 
                   Row(
                     children: [
                       Image.asset("assets/google1.png",
                        fit: BoxFit.cover,
                       ),
                       const SizedBox(width: 10,),
                       const Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                       )
                     ],
                   ),
                ),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.width*0.08,
              ),
        
              Row(              
                children: [
                   SizedBox(
                   width: MediaQuery.of(context).size.width * 0.04  , 
                  ),
                       
              const Text("Don't have an account?",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
              ),
              const SizedBox(
                width: 1,
              ),
              TextButton(onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const Newaccountscreen(),
                    ),
                 );
              }, 
              child: const Text("Create an Account",
                style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(14, 161, 125, 1),      
                ),
              ),
             ),
           
          ],
        )
          ],
        ),
      ),
    );
  }
}