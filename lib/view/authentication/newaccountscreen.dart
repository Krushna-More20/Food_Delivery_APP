
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/authentication/loginscreen.dart';
import 'package:food_delivery_app/view/bottomnavigation.dart';

class Newaccountscreen extends StatefulWidget {
  const Newaccountscreen({super.key});

  @override
  State<Newaccountscreen> createState() => _NewaccountscreenState();
}

class _NewaccountscreenState extends State<Newaccountscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
         backgroundColor: Colors.white,
      body: 
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
          
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
                "Create Your Account",
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
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: TextField(
                    
                    controller: nameController,
                    style: const TextStyle(
                    fontSize : 20,
                    ),
                   // obscureText: true,
                    decoration: const InputDecoration(
                     // suffixIcon: Icon(Icons.visibility),
                      hintText: "Name",
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
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: TextField(
                    
                    controller: emailcontroller,
                    style: const TextStyle(
                    fontSize : 20,
                    ),
                    //obscureText: true,
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
                  height: 25,
                ),
                Padding(
                  padding:const EdgeInsets.only(left: 30,right: 30),
                  child: TextField(
                    controller: passwordcontroller,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                      border: OutlineInputBorder(),
                    ),
          
                  ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                      controller: confirmpasswordcontroller,
                      style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      obscureText: true,
                      decoration:const InputDecoration(
                        hintText: "Confirm Password ",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async{
            
                        if (emailcontroller.text.trim().isNotEmpty &&
                            passwordcontroller.text.trim().isNotEmpty) {
                          try {
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailcontroller.text.trim(),
                              password: passwordcontroller.text.trim(),
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
                      
                     Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const Bottomnavigation(),
                          )
                        );             
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
                      "Sign up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                    ),
          
                      SizedBox(
                  height: MediaQuery.of(context).size.width*0.05
                ),
                Row(              
                  children: [
                    const SizedBox(
                      width: 100,
                    ),        
                const Text("have an account?",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                ),
                ),
                const SizedBox(
                  width: 2,
                ),
                TextButton(onPressed: () {
                  Navigator.pop(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const Loginscreen(),
                      ),
                   );
                }, 
                child: const Text("Sign In",
                  style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(14, 161, 125, 1),      
                  ),
                ),
               ),
             
            ],
          )
           
            ]
                  ),
        ),
      )
                
      );
  }
}