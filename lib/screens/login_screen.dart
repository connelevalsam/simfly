import 'package:flutter/material.dart';
import 'package:simfly/screens/admin/index.dart';

import '../widgets/textfield_widget.dart';
import 'index.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Flexible(
                child: Container(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ),
              txtField(
                "E-mail",
                _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              txtField(
                "Password",
                _passwordController,
                isPassword: true,
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    // fixedSize: Size.fromWidth(size.width * .4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    if (_emailController.text == "test" &&
                        _passwordController.text == "1234") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AdminIndex()));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => IndexScreen()));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignupScreen()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
