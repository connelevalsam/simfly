import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Image.asset("assets/images/bg1.png"),
          SizedBox(
            height: size.height * 0.05,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              // fixedSize: Size.fromWidth(size.width * .4),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue.shade200),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              // fixedSize: Size.fromWidth(size.width * .4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignupScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Signup",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
        ],
      ),
    ));
  }
}
