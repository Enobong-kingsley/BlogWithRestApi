import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.green,
            ],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          child: Column(
            children:  [
             const Text("DevStack", 
              style: TextStyle(
                fontSize: 38,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/6,),

              const Text("Great stories for great people", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              letterSpacing: 2
              ),
              ),
              SizedBox(height: 20,),
              boxContainer("assets/google.png", "Sign up with Google"),
              SizedBox(height: 20,),
              boxContainer("assets/facebook.png", "Sign up with Facebook"),
              SizedBox(height: 20,),
              boxContainer("assets/apple.png", "Sign up with Email"),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13
                  ),),
                  SizedBox(width: 20,),
                   Text("SignIN", style: TextStyle(
                    color: Colors.green,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }

  Widget boxContainer(String path, String text){
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width-120,
      child: Card(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal :20.0, vertical: 10),
            child: Row(
              children: [
                 Image.asset(path,height: 25,width: 25,),
                 SizedBox(width: 16,),
                 Text(text,style: TextStyle(fontSize: 12, color: Colors.black87), 
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}