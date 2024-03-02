import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisormajor/Views/landingpage/landingscree.dart';
import 'package:tripvisormajor/Views/loginRegister/Agency.dart';
import 'package:tripvisormajor/Views/oneclickplan/oneclickplan.dart';
import 'package:tripvisormajor/Views/packagedetails/packagedetails.dart';
import 'package:tripvisormajor/Views/loginRegister/User.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/packagedetailprovider.dart';
import 'package:tripvisormajor/provider/tagprovider.dart';
import 'package:tripvisormajor/provider/offersectionprovider.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyAt8Rm7cQm2sBm6a4NjWZ7_Zm8SgUuL5bs');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Tagprovider()),
      ChangeNotifierProvider(create: (context) => offersectionprovider()),
      ChangeNotifierProvider(create: (context) => PackageDetailsProvider()),
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
      GoRoute(
        path: '/Register',
        builder: (context, state) => UserSignIn(),
      ),
      GoRoute(
        path: '/Login',
        builder: (context, state) => AgencySignIn(),
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
