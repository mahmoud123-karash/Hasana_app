import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class UrlErrorWidget extends StatelessWidget {
  const UrlErrorWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: myColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
