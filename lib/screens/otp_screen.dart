import 'package:flutter/material.dart';

import '../widgets/textfield_widget.dart';
import 'index.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _txt1 = TextEditingController();
  final _txt2 = TextEditingController();
  final _txt3 = TextEditingController();
  final _txt4 = TextEditingController();

  final FocusNode _txt1Node = FocusNode();
  final FocusNode _txt2Node = FocusNode();
  final FocusNode _txt3Node = FocusNode();
  final FocusNode _txt4Node = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _txt1.dispose();
    _txt2.dispose();
    _txt3.dispose();
    _txt4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Text('We just sent a code to you'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                txtOTP(
                  context,
                  _txt1,
                  focusNode: _txt1Node,
                  nextNode: _txt2Node,
                ),
                txtOTP(
                  context,
                  _txt2,
                  focusNode: _txt2Node,
                  nextNode: _txt3Node,
                ),
                txtOTP(
                  context,
                  _txt3,
                  focusNode: _txt3Node,
                  nextNode: _txt4Node,
                ),
                txtOTP(
                  context,
                  _txt4,
                  focusNode: _txt4Node,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Resend code in ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  TextSpan(
                    text: "53s",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 50,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => IndexScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
