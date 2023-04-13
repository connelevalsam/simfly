import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget txtField(
  // BuildContext context,
  String title,
  TextEditingController controller, {
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: title,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        fillColor: Colors.white,
        focusColor: Colors.grey,
        filled: true,
      ),
    ),
  );
}

Widget txtOTP(
  BuildContext context,
  // String title,
  TextEditingController controller, {
  TextInputType keyboardType = TextInputType.phone,
  FocusNode? focusNode,
  FocusNode? nextNode,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    width: MediaQuery.of(context).size.width * .15,
    child: TextField(
      keyboardType: keyboardType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
      ],
      onChanged: (value) {
        if (value.isNotEmpty) {
          FocusScope.of(context).requestFocus(nextNode);
        }
      },
      textInputAction: TextInputAction.next,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 3, color: Colors.purple),
      )),
    ),
  );
}
