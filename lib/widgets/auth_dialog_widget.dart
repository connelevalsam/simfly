import 'package:flutter/material.dart';
import 'package:simfly/widgets/signin_widget.dart';

class AuthDialog {
  Future<Object?> customSignInDialog(BuildContext context,
      {required ValueChanged onCLosed}) {
    var size = MediaQuery.of(context).size;
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign In",
      context: context,
      // TODO: Custom transition
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: size.height * .8,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: const [
                    Text(
                      "Simfly",
                      style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                    ),

                    Expanded(
                      child: SignInForm(),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: const Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: Text(
                    //         "Forgot password?",
                    //         style: TextStyle(
                    //           color: Colors.orange,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    /*Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),*/
                  ],
                ),
                // TODO: Close button
              ],
            ),
          ),
        ),
      ),
    ).then(onCLosed);
  }
}
