import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class BookPackages extends StatefulWidget {
  final int id;

  const BookPackages({Key? key, required this.id}) : super(key: key);

  @override
  State<BookPackages> createState() => _BookPackagesState();
}

class _BookPackagesState extends State<BookPackages> {
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
                      Text(
                        'Selected Package Description',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Package ID: ${widget.id}',
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // _confirmPayment();
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

//   Future<void> _confirmPayment() async {
//     // Get card details
//     final CreditCard testCard = CreditCard(
//       number: _cardNumberController.text,
//       expMonth: int.parse(_expiryDateController.text.split('/')[0]),
//       expYear: int.parse(_expiryDateController.text.split('/')[1]),
//       cvc: _cvvController.text,
//     );

//     // Create payment method
//     final paymentMethod = await Stripe.instance.createPaymentMethod(
//       PaymentMethodParams.card(testCard),
//     );

//     // Handle the payment method response and process further
//     // Here, you can make a call to your backend server to confirm the payment

//     // For testing purposes, print payment method id
//     print(paymentMethod.id);
//   }
// }
}
