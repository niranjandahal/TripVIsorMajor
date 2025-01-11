import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:tripvisormajor/Views/landingpage/landingscreen.dart';
import 'package:tripvisormajor/backend/urlapi.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  //same instance of userAgencyProvider will be used throughout the app
  final userAgencyProvider userProvider = userAgencyProvider();

  Future<void> loginUser(String Email, String Password) async {
    // Your backend API login endpoint
    String apiUrl = UserLoginUrl;
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
        userProvider.setUserlogin(jsonDecode(data)['user']['name']);
        userProvider.setuerid(jsonDecode(data)['user']['userId']);
      } else {
        // Handle other status codes (e.g., 400, 401) accordingly
        print('Login Failed');
      }
    } catch (error) {
      // Handle errors such as connection issues
      print('Error: $error');
    }
  }

  Future<void> RegisterUser(String Name, String Email, String Password) async {
    // Your backend API register endpoint
    String apiUrl = UserRegisterUrl;
    print(Name);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': Name,
          'email': Email,
          'password': Password,
        }),
      );

      if (response.statusCode == 201) {
        // Successfully registered
        // You can handle the response here, like displaying a success message
        print('Registration Successful');
      } else {
        // Handle other status codes (e.g., 400 for bad request) accordingly
        print('Registration Failed');
      }
    } catch (error) {
      // Handle errors such as connection issues
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //animated login

      body: AnimatedLogin(
        loginTexts: LoginTexts(
            welcome: "Welcome to Tripvisor",
            login: "Login",
            welcomeBack: "Welcome Back",
            welcomeBackDescription: "Please enter your credentials to continue",
            welcomeDescription: "Please enter your credentials to continue",
            loginFormTitle: " User Login",
            signUpFormTitle: "User Sign Up",
            signUp: "SignUp Now"),
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
          loadingButtonColor: Colors.white,
          loadingSocialButtonColor: Colors.blue,
          formFieldHoverColor: Colors.grey[100],
          formFieldBackgroundColor: Colors.white,
          formFieldShadowColor: Colors.grey[300],
          socialHighlightColor: Colors.blue,
          changeLangContentColor: Colors.blue,
        ),
        signUpMode: SignUpModes.name,
        onLogin: (loginData) async {
          await loginUser(loginData.email, loginData.password);
          print(loginData);

          context.go('/');
        },
        onSignup: (signupData) async {
          print(signupData);
          await RegisterUser(
              signupData.name, signupData.email, signupData.password);
          print(signupData);
          context.go('/');
        },
        onForgotPassword: (recoverData) {
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => LandingScreen()));
        },
        // backgroundImage: "asset/images/icon.png",
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
