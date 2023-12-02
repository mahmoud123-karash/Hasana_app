import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/utils/firebase_messging.dart';

class FirebaseNotificationSwitchWIdget extends StatefulWidget {
  const FirebaseNotificationSwitchWIdget({super.key});

  @override
  State<FirebaseNotificationSwitchWIdget> createState() =>
      _FirebaseNotificationSwitchWIdgetState();
}

class _FirebaseNotificationSwitchWIdgetState
    extends State<FirebaseNotificationSwitchWIdget> {
  late bool isSub;
  @override
  void initState() {
    isSub = cache_helper.getData(key: 'issub') ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondColor,
          border: Border.all(
            color: gColor!,
            width: 0.2,
          ),
        ),
        child: SwitchListTile(
          secondary: Icon(
            Icons.notifications_on_outlined,
            color: blackColor,
          ),
          title: Text(
            'الإشعارات',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
          ),
          value: isSub,
          onChanged: (value) {
            setState(() {
              isSub = value;
              saveSub(value);
              if (value) {
                subscribeToTopic();
              } else {
                unSubscribeToTopic();
              }
            });
          },
        ),
      ),
    );
  }
}
