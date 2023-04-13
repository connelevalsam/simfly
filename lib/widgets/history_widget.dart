import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final date;
  const HistoryWidget({Key? key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$date",
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  '\u{20A6} 3,000.00',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "30 Regina, Awka",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Line B, Ngozika, Awka",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/banner02.jpg"),
                  radius: 26,
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 6,
              runSpacing: 6,
              children: [
                Text(
                  'Hand bag',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'School bag',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Traveling bag',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Nike Runner shoes',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
