import 'package:blogger_dot/NetworkHandler.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  bool vis = true;
  final _globalKey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late String errorText;
  bool validate = false;
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
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
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign Up with email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              ),
              SizedBox(height: 20,),
              userNameTextField(),
              emailTextField(),
              passwordTextField(),
        
              SizedBox(height: 20,),
              InkWell(
                onTap: ()async {
                  setState(() {
                    circular = true;
                  });
                  await checkUser();
                  if(_globalKey.currentState!.validate() && validate){
                    // if validation is successfull then we will send the data to the server
                    Map<String,String>data = {
                      "Username": _usernameController.text,
                      "email" : _emailController.text,
                      "password" : _passwordController.text
                    };
                    print(data);
                   networkHandler.post("/user/register",data);
                  }else{
                    setState(() {
                    circular = false;
                  });
                  }
                },
                child: circular ?CircularProgressIndicator() : Container(
                  width: 150,
                  height: 50,
                  decoration:  BoxDecoration(
                    color: Color(0xff00A86B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:const Center(
                    child: Text("Sign Up",
                    style: TextStyle(color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkUser()async{
    if(_usernameController.text.length == 0){
      setState(() {
        circular = false;
        validate = false;
        errorText = "Username cant be empty";
      });
    }else{
      var response = await networkHandler.get("/user/checkusername/${
        _usernameController.text
      }");
      if(response['status']){
         setState(() {
        //circular = false;
        validate = false;
        errorText = "Username already taken";
      });
      }
      else{
         setState(() {
        //circular = false;
        validate = true;
       
      });
      }
    }
  }

  Widget userNameTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical : 10.0),
      child: Column(
        children: [
          Text("Username"),
          TextFormField(
            controller: _usernameController,
            validator: (value){
              if(value!.isEmpty)
              return "Username can't be empty";

              return null;
            },
            decoration:const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                )
              )
            ),
          )
        ],
      ),
    );
  }

   Widget emailTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical : 10.0),
      child: Column(
        children: [
          const Text("Email"),
          TextFormField(
            controller: _emailController,
             validator: (value){
              if(value!.isEmpty)
              return "Email can't be empty";
              if(!value.contains("@"))
              return "Email is invalid";
              return null;
            },
            decoration:const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                )
              )
            ),
          )
        ],
      ),
    );
  }

   Widget passwordTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical : 10.0),
      child: Column(
        children: [
          Text("Password"),
          TextFormField(
            controller: _passwordController,
             validator: (value){
              if(value!.isEmpty)
              return "Password can't be empty";
              if(value.length < 8)
              return "Password should not be less than 8";
              return null;
            },
            obscureText: vis,
            decoration: InputDecoration(
              suffixIcon: IconButton(
              
                 icon:Icon(vis ? Icons.visibility_off : Icons.visibility),
                   onPressed: () {
                  setState(() {
                    vis = !vis;
                  });
                },
                 ),
              helperText: "Password should not be less than 8",
              helperStyle: TextStyle(
                fontSize: 12
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                )
              )
            ),
          )
        ],
      ),
    );
  }
}