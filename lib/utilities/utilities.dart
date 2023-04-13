import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
}

_selectImage(BuildContext context, VoidCallback callback) async {
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: Text("Select image"),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(10),
                child: Text("From Camera"),
                // onPressed: () async {
                //   Navigator.of(context).pop();
                //   var file = await pickImage(ImageSource.camera);
                //   setState(() {
                //     _file = file;
                //   });
                // },
                onPressed: callback,
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(10),
                child: Text("From Gallery"),
                onPressed: callback,
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(10),
                child: Text("Cancel"),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}
