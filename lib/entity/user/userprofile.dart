import 'package:flutter/material.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';
import 'package:go_router/go_router.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final userAgencyProvider userProvider = userAgencyProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("data"),
          ElevatedButton(
            onPressed: () {
              userProvider.setlogout;
              context.go('/');
            },
            child: Text("logout"),
          )
        ],
      )),
    );
  }
}
