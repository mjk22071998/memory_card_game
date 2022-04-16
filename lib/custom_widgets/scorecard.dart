import 'package:flutter/material.dart';

Widget scorecard(String title, String info) {
  return Container(
    margin: const EdgeInsets.all(26.0),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
    color: Colors.white,
    child: Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
