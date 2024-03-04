import 'package:flutter/material.dart';
import 'package:tipzy/widgets/tip.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Tip(),
        ],
      ),
    );
  }
}
