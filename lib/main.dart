import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisormajor/Views/landingscree.dart';
import 'package:tripvisormajor/Views/oneclickplan.dart';
import 'package:tripvisormajor/Views/packagedetails.dart';
import 'package:tripvisormajor/Widgets/searchbar.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/tagprovider.dart';
import 'package:tripvisormajor/provider/offersectionprovider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => tagprovider()),
      ChangeNotifierProvider(create: (context) => offersectionprovider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LandingScreen(),
      ),
      GoRoute(
        path: '/packagedetails',
        builder: (context, state) => PackageDetails(),
      ),
      GoRoute(
        path: '/oneclickplan',
        builder: (context, state) => oneclick(),
      ),
    ],
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Tripvisor',
    );
  }
}
