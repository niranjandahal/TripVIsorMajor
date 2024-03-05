import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisormajor/Views/destinationpage/destinationpage.dart';
import 'package:tripvisormajor/Views/landingpage/landingscreen.dart';
import 'package:tripvisormajor/Views/loginRegister/Agency.dart';
import 'package:tripvisormajor/Views/loginRegister/User.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/Views/packagedetails/packagedetails.dart';
import 'package:tripvisormajor/Views/packagespage.dart/packagespage.dart';
import 'package:tripvisormajor/Widgets/searchpage.dart';
import 'package:tripvisormajor/entity/Admin/adminlogin.dart';
import 'package:tripvisormajor/entity/user/packages/bookpackage.dart';
import 'package:tripvisormajor/provider/geminichatprovider.dart';
import 'package:tripvisormajor/provider/packagedetailprovider.dart';
import 'package:tripvisormajor/provider/tagprovider.dart';
import 'package:tripvisormajor/provider/offersectionprovider.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyAt8Rm7cQm2sBm6a4NjWZ7_Zm8SgUuL5bs');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GeminiChatProvider()),
      ChangeNotifierProvider(create: (context) => Tagprovider()),
      ChangeNotifierProvider(create: (context) => offersectionprovider()),
      ChangeNotifierProvider(create: (context) => PackageDetailsProvider()),
      ChangeNotifierProvider(create: (context) => userAgencyProvider()),
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
        path: '/UserSignIn',
        builder: (context, state) => UserSignIn(),
      ),
      GoRoute(
        path: '/AgencySignIn',
        builder: (context, state) => AgencySignIn(),
      ),
      GoRoute(
        path: '/packagedetails/:pid',
        builder: (context, state) =>
            PackageDetails(pid: state.pathParameters['pid'] ?? ''),
      ),
      //bookpackage
      // GoRoute(
      //   path: '/bookpackage/:pid',
      //   builder: (context, state) => BookPackages(
      //       pid: int.tryParse(state.pathParameters['pid'] ?? '0') ?? 0),
      // ),
      GoRoute(
        path: '/Destinations',
        builder: (context, state) => DestinationPage(),
      ),
      GoRoute(
        path: '/Packages',
        builder: (context, state) => PackagesPage(),
      ),
      GoRoute(
        path: '/adminlogin',
        builder: (context, state) => AdminLogin(),
      )
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
