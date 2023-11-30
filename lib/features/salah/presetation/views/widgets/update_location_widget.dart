import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';

import 'update_location_button_widget.dart';

class UpdateLocationWidget extends StatelessWidget {
  const UpdateLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String address = cache_helper.getData(key: 'address') ?? 'address';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: size(context).width - 100,
            ),
            child: Text(
              'موقعك الحالي: $address',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: !cache_helper.getData(key: 'isdark')
                    ? blackColor
                    : whiteColor,
              ),
              maxLines: 1,
            ),
          ),
          const Spacer(),
          const UpdateLocationButtonWidget()
        ],
      ),
    );
  }
}
