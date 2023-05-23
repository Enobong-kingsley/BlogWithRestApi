import 'package:blogger_dot/pages/SignUpPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin{
  late AnimationController  _controller1;
  late Animation<Offset> animation1;

   late AnimationController  _controller2;
  late Animation<Offset> animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Animation 1
    _controller1 = AnimationController(duration: Duration(milliseconds: 1000), vsync: this,);
    animation1 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),);

    // Animation 2
    _controller2 = AnimationController(duration: Duration(milliseconds: 2000), vsync: this,);
    animation2 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.elasticInOut),);

    _controller1.forward();
    
    _controller2.forward();
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }

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
              
             SlideTransition(
              position: animation1,
               child: const Text("DevStack", 
                style: TextStyle(
                  fontSize: 28,
                         fontWeight: FontWeight.w600,
                         letterSpacing: 2,),
                ),
             ),
              SizedBox(height: MediaQuery.of(context).size.height/6,),
              
              SlideTransition(
                position: animation1,
                child: const Text("Great stories for great people", 
                textAlign: TextAlign.center,
                style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                letterSpacing: 2
                ),
                ),
              ),
              SizedBox(height: 20,),
              boxContainer("assets/google.png", "Sign up with Google", null ),
              SizedBox(height: 20,),
              boxContainer("assets/facebook.png", "Sign up with Facebook", null ),
              SizedBox(height: 20,),
              boxContainer("assets/apple.png", "Sign up with Email", onEmailClicked),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: animation2,
                    child: Text("Already have an account?", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                    ),),
                  ),
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

 onEmailClicked(){
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
    // const SingUpPage()));
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingUpPage()));
  }
  Widget boxContainer(String path, String text, onClick ){
    return SlideTransition(
      position: animation2,
      child: InkWell(
        onTap: onClick,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width-110,
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
        ),
      ),
    );
  }
}