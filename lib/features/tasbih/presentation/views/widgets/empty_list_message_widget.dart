import 'package:flutter/material.dart';

class EmptyListMessageWidget extends StatelessWidget {
  const EmptyListMessageWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
