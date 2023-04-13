import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/history_widget.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var now = DateTime.now();
    var formattedDate = DateFormat.yMMMd().format(now);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
            width: size.width,
            height: size.height,
            child: ListView.builder(
              itemBuilder: (_, i) => HistoryWidget(
                date: formattedDate,
              ),
              itemCount: 5,
            )),
      ),
    );
  }
}
