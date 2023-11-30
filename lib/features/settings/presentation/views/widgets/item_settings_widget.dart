import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class ItemSettingsWidget extends StatelessWidget {
  const ItemSettingsWidget(
      {super.key, required this.text, required this.icon, required this.ontap});
  final String text;
  final IconData icon;
  final VoidCallback ontap;

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
          onTap: ontap,
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: Icon(
            icon,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
          ),
        ),
      ),
    );
  }
}
