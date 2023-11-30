import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/assets.dart';
import 'widgets/description_app_text_widget.dart';
import 'widgets/version_text_widget.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('حول التطبيق'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: Image.asset(Assets.imagesIcon),
          ),
          Text(
            'حسنة',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: myColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const DescriptionAppTextWidget(),
          const Spacer(),
          const VersionTextWidget(),
        ],
      ),
    );
  }
}
