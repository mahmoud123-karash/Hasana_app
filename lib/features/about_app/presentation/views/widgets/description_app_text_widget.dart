import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';

import '../../../../../core/contants/constants.dart';

class DescriptionAppTextWidget extends StatelessWidget {
  const DescriptionAppTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'تطبيق حسنة الإسلامي هو تطبيق مصمم خصيصًا لتلبية احتياجات المسلمين وتقديم مجموعة واسعة من الموارد والخدمات المتعلقة بالإسلام. يهدف هذا التطبيق إلى تمكين المستخدمين من ممارسة دينهم بشكل أفضل وتعزيز فهمهم للتعاليم الإسلامية.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: cache_helper.getData(key: 'isdark') ? whiteColor : blackColor,
        ),
      ),
    );
  }
}
