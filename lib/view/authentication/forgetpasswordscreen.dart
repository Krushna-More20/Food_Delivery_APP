

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/authentication/loginscreen.dart';

class Forgetpasswordscreen extends StatefulWidget {
  const Forgetpasswordscreen({super.key});

  @override
  State<Forgetpasswordscreen> createState() => _ForgetpasswordscreenState();
}
 TextEditingController emailcontroller = TextEditingController();

class _ForgetpasswordscreenState extends State<Forgetpasswordscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
              "Forget Password",
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
              GestureDetector(
                onTap: () async{
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(
                  email: emailcontroller.text.trim(),
                   );
                   ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text("Reset link sent to your email"),
                   backgroundColor: Colors.green),
                  );
                  Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                        builder: (context) => const Loginscreen(),
                        )
                  );
                } on FirebaseAuthException catch (e) {
                   ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text(e.message ?? "An error occurred"),
                   backgroundColor: Colors.red),
                   );
                  }               
                },             
               child: Container(                
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(14, 161, 125, 1), 
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Send link",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),       
          ]
        )
      ),

    );
  }
}