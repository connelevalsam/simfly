import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../resources/auth_methods.dart';
import '../screens/index.dart';
import 'custom_position.dart';
import 'signin_widget.dart';
import 'third_party_auth.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSignIn = false;
  bool isShowLoading = false;
  bool isShowConfetti = false;

  final _txtEmail = TextEditingController();
  final _txtName = TextEditingController();
  final _txtPassword = TextEditingController();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  void signUp(BuildContext context) async {
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
              print(
                  "Values\n\n${_txtEmail.text}\n${_txtPassword.text}\n${_txtName.text}\n\n");
              setState(() {
                isShowLoading = false;
              });
              // TODO: Fire confetti animation

              if (_txtName != null ||
                  _txtPassword != null ||
                  _txtEmail != null) {
                String res = await AuthMethods().signUp(
                  email: _txtEmail.text,
                  password: _txtPassword.text,
                  name: _txtName.text,
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
        _isSignIn == true
            ? const SignInForm().animate().slideX()
            : Form(
                key: _formKey,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Full Name",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                        controller: _txtName,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SvgPicture.asset("assets/icons/User.svg"),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                        controller: _txtEmail,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                        controller: _txtPassword,
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
                      padding: const EdgeInsets.only(top: 8, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          signUp(context);
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
                        label: const Text("Sign Up"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isSignIn = true;
                            });
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
