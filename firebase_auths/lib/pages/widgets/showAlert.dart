import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCustomAlert(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("$title"),
      content: Text("$message"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("ok"),
        ),
      ],
    ),
  );
}
