import 'package:flutter/material.dart';
import 'package:tripvisormajor/backend/urlapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class offersectionprovider extends ChangeNotifier {
  //only one instance of provider class
  static offersectionprovider? _instance;
  offersectionprovider._() {
    _instance = this;
  }
  factory offersectionprovider() {
    if (_instance == null) {
      return offersectionprovider._();
    }
    return _instance!;
  }

  //
  Future<void> loadOfferList1() async {
    if (offerlist1loaded == true) {
      return;
    } else {
      String url = offerlist1url;
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          print(response.body);
          List<dynamic> responseData = jsonDecode(response.body);
          offerlist1.clear();
          offerlist1.addAll(responseData.map((item) =>
              item as Map<String, dynamic>)); // Convert each item to Map
          offerlist1loaded = true;
          notifyListeners();
        } else {
          print("Invalid status code: ${response.statusCode}");
        }
      } catch (error) {
        print('Error: $error');
      }
    }
  }

  Future<void> loadOfferList2() async {
    if (offerlist2loaded == true) {
      return;
    } else {
      String url = offerlist1ur2;
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          print(response.body);
          List<dynamic> responseData = jsonDecode(response.body);
          offerlist2.clear();
          offerlist2.addAll(responseData.map((item) =>
              item as Map<String, dynamic>)); // Convert each item to Map
          offerlist2loaded = true;
          notifyListeners();
        } else {
          print("Invalid status code: ${response.statusCode}");
        }
      } catch (error) {
        print('Error: $error');
      }
    }
  }

  Future<void> loadOfferList3() async {
    if (offerlist3loaded == true) {
      return;
    } else {
      String url = offerlist1ur3;
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          print(response.body);
          List<dynamic> responseData = jsonDecode(response.body);
          offerlist3.clear();
          offerlist3.addAll(responseData.map((item) =>
              item as Map<String, dynamic>)); // Convert each item to Map
          offerlist3loaded = true;
          notifyListeners();
        } else {
          print("Invalid status code: ${response.statusCode}");
        }
      } catch (error) {
        print('Error: $error');
      }
    }
  }

  // Future<void> loadofferlist2() async {
  //   if (offerlist2loaded == true) {
  //     return;
  //   } else {
  //     String url = offerlist1ur2;
  //     try {
  //       final response = await http.get(Uri.parse(url));
  //       if (response.statusCode == 200) {
  //         Map<String, dynamic> responseData = jsonDecode(response.body);
  //         offerlist2.clear();
  //         for (var i = 0; i < responseData['data'].length; i++) {
  //           offerlist2.add(responseData['data'][i]);
  //         }
  //         offerlist2loaded = true;
  //         notifyListeners();
  //       } else {
  //         print("Invalid status code: ${response.statusCode}");
  //       }
  //     } catch (error) {
  //       print('Error: $error');
  //     }
  //   }
  // }

  // Future<void> loadofferlist3() async {
  //   if (offerlist3loaded == true) {
  //     return;
  //   } else {
  //     String url = offerlist1ur3;
  //     try {
  //       final response = await http.get(Uri.parse(url));
  //       if (response.statusCode == 200) {
  //         Map<String, dynamic> responseData = jsonDecode(response.body);
  //         offerlist3.clear();
  //         for (var i = 0; i < responseData['data'].length; i++) {
  //           offerlist3.add(responseData['data'][i]);
  //         }
  //         offerlist3loaded = true;
  //         notifyListeners();
  //       } else {
  //         print("Invalid status code: ${response.statusCode}");
  //       }
  //     } catch (error) {
  //       print('Error: $error');
  //     }
  //   }
  // }

  int datacount = 0;

  final List<Map<String, dynamic>> offerlist1 = [];

  bool offerlist1loaded = false;

  List<Map<String, dynamic>> offerlist2 = [];

  bool offerlist2loaded = false;

  List<Map<String, dynamic>> offerlist3 = [];

  bool offerlist3loaded = false;

  int getcounts(int index) {
    if (index == 1) {
      datacount = offerlist1.length;
    } else if (index == 2) {
      datacount = offerlist2.length;
    } else if (index == 3) {
      datacount = offerlist3.length;
    }
    return datacount;
  }
}
