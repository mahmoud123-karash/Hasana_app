import 'package:flutter/widgets.dart';
import 'package:quran_app/core/contants/constants.dart';

class ErrorMoasfWidget extends StatelessWidget {
  const ErrorMoasfWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          color: myColor,
        ),
      ),
    );
  }
}
