import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tripvisormajor/backend/urlapi.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';

class BookPackages extends StatefulWidget {
  final String pid;
  final String uid;

  const BookPackages({Key? key, required this.pid, required this.uid})
      : super(key: key);

  @override
  State<BookPackages> createState() => _BookPackagesState();
}

class _BookPackagesState extends State<BookPackages> {
  final userAgencyProvider userProvider = userAgencyProvider();
  Future<void> _confirmPayment() async {
    //post request to your backend to create a payment method
    String url = bookpageurl;
    //post request to your backend to create a payment method
    try {
      print(userProvider.UserName);
      print(widget.uid);
      print(widget.pid);
      final response = await http.post(
        Uri.parse(bookpageurl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': userProvider.UserName,
          'userId': widget.uid,
          'packageId': widget.pid,
        }),
      );
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("Invalid status code: ${response.statusCode}");
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Stripe publishable key
  final String _stripePublishableKey = 'your_stripe_publishable_key';

  @override
  void initState() {
    super.initState();
    Stripe.publishableKey = _stripePublishableKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Package'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.pid),
                      Text(widget.uid),
                      const Text(
                        'Selected Package Description',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Package ID: ${widget.pid}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Package Details: Insert package details here.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _confirmPayment();
                        }
                      },
                      child: const Text('Confirm Payment'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
