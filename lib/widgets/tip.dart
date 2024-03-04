import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tip extends StatelessWidget {
  const Tip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.lightbulb),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tip",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
                  child: Text(
                    "This is a tip for you!",
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
