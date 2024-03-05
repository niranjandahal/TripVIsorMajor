import 'package:flutter/material.dart';

class userAgencyProvider extends ChangeNotifier {
  //same  instance of userAgencyProvider will be used throughout the app
  static final userAgencyProvider _instance = userAgencyProvider._internal();
  factory userAgencyProvider() => _instance;
  userAgencyProvider._internal();

  bool _isUserlogin = false;
  bool _isAgencylogin = false;
  bool _isanylogin = false;

  String _UserName = "";
  String _userid = "";
  String _agencyid = "";
  String _AgencyName = "";

  bool get isUserlogin => _isUserlogin;
  bool get isAgencylogin => _isAgencylogin;
  bool get isanylogin => _isanylogin;
  String get userid => _userid;
  String get agencyid => _agencyid;
  String get UserName => _UserName;
  String get AgencyName => _AgencyName;

  void setUserlogin(String name) {
    _isAgencylogin = false;
    _isUserlogin = true;
    _UserName = name;
    _isanylogin = true;
    print("user setted");
    notifyListeners();
  }

  void setuerid(String id) {
    _userid = id;
    print("uid setted");
    notifyListeners();
  }

  void setAgencyid(String id) {
    _agencyid = id;
    notifyListeners();
  }

  void setAgencylogin(String name) {
    _isUserlogin = false;
    _isAgencylogin = true;
    _AgencyName = name;
    _isanylogin = true;
    notifyListeners();
  }

  void setlogout() {
    _isUserlogin = false;
    _isAgencylogin = false;
    _isanylogin = false;
    _userid = "";
    _agencyid = "";
    notifyListeners();
  }
}
