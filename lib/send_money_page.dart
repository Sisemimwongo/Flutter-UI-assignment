import 'package:flutter/material.dart';
import 'custom_button.dart'; // Import your custom button
import 'transaction_success_message.dart'; // Import the animated success message

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  String? recipientName;
  double? amount;
  String? selectedPaymentMethod;
  bool isFavorite = false;
  bool showSuccessMessage =
      false; // Variable to control visibility of success message

  final List<String> paymentMethods = [
    'Credit Card',
    'PayPal',
    'Bank Transfer'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Send Money', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient\'s Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipient\'s name';
                  }
                  return null;
                },
                onChanged: (value) => recipientName = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value) == null ||
                      double.parse(value)! <= 0) {
                    return 'Please enter a valid positive amount';
                  }
                  return null;
                },
                onChanged: (value) => amount = double.tryParse(value),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Payment Method'),
                value: selectedPaymentMethod,
                onChanged: (newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue;
                  });
                },
                items: paymentMethods
                    .map<DropdownMenuItem<String>>((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('Mark as Favorite'),
                value: isFavorite,
                onChanged: (value) {
                  setState(() {
                    isFavorite = value;
                  });
                },
              ),

              // Animated success message
              TransactionSuccessMessage(isVisible: showSuccessMessage),

              SizedBox(height: 20),

              // CustomButton for sending money
              CustomButton(
                text: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the transaction
                    setState(() {
                      showSuccessMessage =
                          true; // Show success message when transaction is processed
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Transaction Successful!')));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
