import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../resources/auth_methods.dart';
import '../screens/admin/index.dart';
import '../screens/index.dart';
import 'custom_position.dart';
import 'signup_widget.dart';
import 'third_party_auth.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSignUp = false;
  bool isShowLoading = false;
  bool isShowConfetti = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  void signIn(BuildContext context) async {
    setState(() {
      isShowLoading = true;
      // TODO: Show confetti a
    });
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          check.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () async {
              setState(() {
                isShowLoading = false;
              });
              // TODO: Fire confetti animation

              // TODO: Navigate to next screen
              if (_emailController.text == "test" &&
                  _passwordController.text == "1234") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdminIndex(),
                  ),
                );
              } else {
                String res = await AuthMethods().signInUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                );

                if (res == "Successful") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IndexScreen(),
                    ),
                  );
                } else {
                  error.fire();
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      setState(() {
                        isShowLoading = false;
                      });
                    },
                  );
                }
              }
            },
          );
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isSignUp
            ? const SignupWidget().animate().slideX().shimmer()
            : Form(
                key: _formKey,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please provide an e-mail";
                          }
                          return null;
                        },
                        onSaved: (email) {},
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SvgPicture.asset("assets/icons/email.svg"),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password field cannot be empty!";
                          }
                          return null;
                        },
                        onSaved: (password) {},
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child:
                                SvgPicture.asset("assets/icons/password.svg"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          signIn(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77D8E),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                          ),
                        ),
                        icon: const Icon(
                          CupertinoIcons.arrow_right,
                          color: Color(0xFFFE0037),
                        ),
                        label: const Text("Sign In"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isSignUp = true;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Sign Up",
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
                    const ThirdPartyAuth(),
                  ],
                ),
              ),

        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController? controller =
                        StateMachineController.fromArtboard(
                            artboard, "State Machine 1");
                    artboard.addController(controller!);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),

        // TODO: Confetti animation
      ],
    );
  }
}
