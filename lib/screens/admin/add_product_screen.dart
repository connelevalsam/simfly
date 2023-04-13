import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simfly/utilities/utilities.dart';

import '../../widgets/textfield_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Uint8List? _file;
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtBrand = TextEditingController();
  final TextEditingController _txtCategory = TextEditingController();
  final TextEditingController _txtQuantity = TextEditingController();
  final TextEditingController _txtPrice = TextEditingController();
  bool _isLoading = false;

  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Add product'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: Text('Take a photo'),
            onPressed: () async {
              Navigator.pop(context);
              var file = await pickImage(ImageSource.camera);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: Text('Select from gallery'),
            onPressed: () async {
              Navigator.pop(context);
              var file = await pickImage(ImageSource.gallery);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Cancel'),
            onPressed: () async {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: txtField(
            "Name",
            _txtName,
          ),
        ),
        txtField(
          "Brand",
          _txtBrand,
        ),
        txtField(
          "Category",
          _txtCategory,
        ),
        txtField(
          "Quantity",
          _txtQuantity,
        ),
        txtField(
          "Price",
          _txtPrice,
        ),
        IconButton(
          onPressed: () => _selectImage(context),
          icon: const Icon(
            Icons.upload,
            size: 40,
          ),
        ),
        SizedBox(
          width: 45,
          height: 45,
          child: AspectRatio(
            aspectRatio: 487 / 451,
            child: Container(
              decoration: BoxDecoration(
                image: _file == null
                    ? const DecorationImage(
                        image: AssetImage(
                            "assets/images/avatar.png"), //: MemoryImage(_file!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      )
                    : DecorationImage(
                        image: MemoryImage(_file!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
