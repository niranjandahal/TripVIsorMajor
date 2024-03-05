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
      final response = await http.post(Uri.parse(url), body: {
        'name': userProvider.UserName,
        'userId': widget.uid,
        'packageId': widget.pid,
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

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
        title: Text('Book Package'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.pid),
                      Text(widget.uid),
                      Text(
                        'Selected Package Description',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Package ID: ${widget.pid ?? ""}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Package Details: Insert package details here.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _cardNumberController,
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter card number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter expiry date';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter CVV';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _confirmPayment();
                        }
                      },
                      child: Text('Confirm Payment'),
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
