import 'package:flutter/material.dart';
import 'package:simfly/screens/admin/add_product_screen.dart';

import '../screens/favorite_screen.dart';
import '../screens/history_screen.dart';
import '../screens/home.dart';

const pages = <Widget>[
  HomeScreen(),
  TransactionHistory(),
  FovoriteScreen(),
  Center(
    child: Text("Settings"),
  ),
];

const adminPages = <Widget>[
  AddProduct(),
  Center(
    child: Text("Transaction"),
  ),
  Center(
    child: Text("Settings"),
  ),
];

String postImage = "";
