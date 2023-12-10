import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String message;

  const ErrorIndicator({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
