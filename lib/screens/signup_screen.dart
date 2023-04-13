import 'package:flutter/material.dart';
import 'package:simfly/resources/auth_methods.dart';
import 'package:simfly/screens/home.dart';
import 'package:simfly/screens/login_screen.dart';

import '../widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              Image.asset("assets/images/banner02.jpg"),
              const SizedBox(
                height: 24,
              ),
              txtField(
                "Full name",
                _fullnameController,
              ),
              txtField(
                "E-mail",
                _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              txtField(
                "Phone",
                _phoneController,
                keyboardType: TextInputType.phone,
              ),
              txtField(
                "Password",
                _passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 38,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  // fixedSize: Size.fromWidth(size.width * .4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () async {
                  var res = await AuthMethods().signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                    name: _fullnameController.text,
                  );
                  if (res != "Success") {
                    print(res);
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Create account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Login",
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
            ],
          ),
        ),
      ),
    );
  }
}
