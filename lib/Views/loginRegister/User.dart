import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';
import 'package:tripvisormajor/Views/landingpage/landingscreen.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
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
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            primary: Colors.blue,
            onPrimary: Colors.white,
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
        onLogin: (loginData) {
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => LandingScreen()));
        },
        onSignup: (signupData) {
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => LandingScreen()));
        },
        onForgotPassword: (recoverData) {
          return Navigator.push(context,
              MaterialPageRoute(builder: (context) => LandingScreen()));
        },
        backgroundImage: "asset/images/icon.png",
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
