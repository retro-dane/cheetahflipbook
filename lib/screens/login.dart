import 'package:cheetahflipbook/screens/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:   [
          const SizedBox(
            height: 100,
          ),

          SizedBox(
            height: 150,
            child: Image.asset(
              "assets/images/CHEETAH Logo (Chasing and Capturing Your Dreams.jpg",
            ),
          ),

            const SizedBox(
              height: 10,
            ),

            const Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),
            ),

          const SizedBox(
            height: 15,
          ),

          const LoginForm(),

          const SizedBox(
            height: 15,
          ),

           ElevatedButton(
             style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  shape:const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold),
             ),
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
              child: const Text(
                "GO",
              ),
          ),

          const SizedBox(
            height:20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Dont Have an account yet?",
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.blue
                ),
              ),
            ],
          ),
          const SizedBox(
            height:20,
          ),

          Expanded(
            child: Image.asset(
                "assets/images/clipart.png",
            ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                decoration:  InputDecoration(
                  labelText: "KerryAnn123",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 1.5,color:Colors.red),
                  )
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            SizedBox(
              width:300,
              child: TextFormField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "**********",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1.5,color:Colors.red),
                    )
                ),
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            const Padding(
              padding: EdgeInsets.only(left:150),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize:15,
                    color: Colors.black,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
