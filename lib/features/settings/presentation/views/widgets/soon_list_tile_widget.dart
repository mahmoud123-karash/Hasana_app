import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class SoonListTileWidget extends StatelessWidget {
  const SoonListTileWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

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
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: gColor,
            ),
          ),
          leading: Icon(
            icon,
            color: gColor,
          ),
          trailing: Text(
            'قريبا',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: myColor,
            ),
          ),
        ),
      ),
    );
  }
}
