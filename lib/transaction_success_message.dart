import 'package:flutter/material.dart';

class TransactionSuccessMessage extends StatelessWidget {
  final bool isVisible;

  const TransactionSuccessMessage({Key? key, required this.isVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: isVisible
          ? Text(
              'Transaction Successful!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            )
          : Container(),
    );
  }
}
