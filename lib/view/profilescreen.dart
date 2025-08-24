
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/view/authentication/loginscreen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {

  signout()async{
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                 const SizedBox(
                    width: 20,
                  ),
                  
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey),
                      width: 35,
                      height: 35,             
                      child: const Icon(
                        Icons.arrow_back_outlined, 
                        size: 25,
                        color: Colors.white,
                        )
                     ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  )    
                ],
              ), 
              SizedBox(
                height: 20,
              ),
               Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80, // this controls both height & width (diameter = 80)
                      backgroundImage: AssetImage("assets/profile1.png",),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width*0.02,
                    ),
                    Text("User",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),),
                    
                     const SizedBox(height: 16),

                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: Icon(Icons.card_giftcard_outlined, size: 21, color: Color.fromRGBO(0, 100, 210, 1),),
                  title:  Text("My Order", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromRGBO(37, 40, 49, 1) ),),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: Icon(Icons.headset_mic_outlined, size: 21, color: Color.fromRGBO(0, 100, 210, 1),),
                  title:  Text("Help Center", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromRGBO(37, 40, 49, 1) ),),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: Icon(Icons.settings, size: 21, color: Color.fromRGBO(0, 100, 210, 1),),
                  title:  Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromRGBO(37, 40, 49, 1) ),),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(),

                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: Icon(Icons.credit_card, size: 21, color: Color.fromRGBO(0, 100, 210, 1),),
                  title:  Text("Payment Methods", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromRGBO(37, 40, 49, 1) ),),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                Divider(),
               
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: Icon(Icons.person_add_alt_1_rounded, size: 21, color: Color.fromRGBO(0, 100, 210, 1),),
                  title:  Text("Invite Friends", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromRGBO(37, 40, 49, 1) ),),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async{
                    await signout();
                     Navigator.pushReplacement(
                     context,
                      MaterialPageRoute(builder: (context) => const Loginscreen()),
                    );
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(color: Colors.black87, width:3, strokeAlign: BorderSide.strokeAlignInside),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.login_outlined,size: 21, color: Color.fromRGBO(0, 100, 210, 1),),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 40, 49, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                  ],
                ),
                
              ),     
        ],
      ),

    );
  }
}