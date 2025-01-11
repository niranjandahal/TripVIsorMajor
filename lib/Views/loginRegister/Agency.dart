import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:tripvisormajor/Views/landingpage/landingscreen.dart';
import 'package:tripvisormajor/entity/Agency/agencypanel.dart';
import 'package:tripvisormajor/backend/urlapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';
import 'package:go_router/go_router.dart';

class AgencySignIn extends StatefulWidget {
  const AgencySignIn({super.key});

  @override
  State<AgencySignIn> createState() => _AgencySignInState();
}

class _AgencySignInState extends State<AgencySignIn> {
  final userAgencyProvider userProvider = userAgencyProvider();

  Future<void> AgencyLogin(String Email, String Password) async {
    // Your backend API login endpoint
    String apiUrl = AgencyLoginUrl;
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': Email,
          'password': Password,
        }),
      );

      if (response.statusCode == 200) {
        var data = response.body;
        print(jsonDecode(data)['user']['name']);
        userProvider.setAgencylogin(jsonDecode(data)['user']['name']);
        userProvider.setAgencyid(jsonDecode(data)['user']['userId']);
      } else {
        // Handle other status codes (e.g., 400, 401) accordingly
        print('Login Failed');
      }
    } catch (error) {
      // Handle errors such as connection issues
      print('Error: $error');
    }
  }

  Future<void> AgencyRegister() async {
    String url = AgencyRegisterUrl;
    var response = await http.post(Uri.parse(url), body: {
      "email": "email",
      "password": "password",
    });
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedLogin(
        signUpMode: SignUpModes.both,
        loginTexts: LoginTexts(
          welcome: "Welcome to Tripvisor",
          login: "Login",
          welcomeBack: "Welcome Back",
          welcomeBackDescription: "Please enter your credentials to continue",
          welcomeDescription: "Please enter your credentials to continue",
          loginFormTitle: " Agency Login",
          signUpFormTitle: "Agency Sign Up",
        ),
        loginDesktopTheme: LoginViewTheme(
          changeActionButtonStyle: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),

          actionButtonStyle: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue, textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          forgotPasswordStyle: TextStyle(
            color: Colors.blue,
            fontSize: 12,
          ),
          formTitleStyle: TextStyle(
            color: Colors.blue,
            fontSize: 30,
          ),

          formFieldBorderRadius: BorderRadius.circular(20),
          backgroundColor: Colors.blue.shade400,
          // Adjusting colors for desktop view
          borderColor: Colors.white,
          fillColor: Colors.white,
          socialLoginHoverColor: Colors.blueGrey[100],
          focusedBorderColor: Colors.grey[400],
          checkColor: Colors.blue,
          // backgroundColor: Colors.blue,
          errorBorderColor: Colors.red,
          enabledBorderColor: Colors.grey[400],
          focusedErrorBorderColor: Colors.red,
          loadingButtonColor: Colors.blue,
          loadingSocialButtonColor: Colors.blue,
          formFieldHoverColor: Colors.grey[100],
          formFieldBackgroundColor: Colors.white,
          formFieldShadowColor: Colors.grey[300],
          socialHighlightColor: Colors.blue,
          changeLangContentColor: Colors.blue,
        ),
        onSignup: (SignUpData) {
          print("hello");
          print(SignUpData);
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => LandingScreen()));
        },
        onLogin: (loginData) async {
          print(loginData);
          await AgencyLogin(loginData.email, loginData.password);
          context.go('/');
        },
        onForgotPassword: (recoverData) {
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => LandingScreen()));
        },
        privacyPolicyChild: Text(
          "By signing up, you agree to our Terms of Use and Privacy Policy",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
