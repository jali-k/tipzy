import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tipzy/providers/user_provider.dart';
import 'package:tipzy/widgets/tip.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(
      "NotificationsScreen: ${ref.watch(userProvider)!.providerData?.toString() ?? "No user logged in!"}",
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text("You are, ${ref.watch(userProvider)?.email.toString()}"),
          SizedBox(height: 20),
          Tip(),
        ],
      ),
    );
  }
}
