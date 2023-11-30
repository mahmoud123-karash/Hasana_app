// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/home/presentation/views/widgets/content_item_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/location_qibla_dialog_widget.dart';

class ContentItemListviewWidget extends StatelessWidget {
  const ContentItemListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size(context).height / 3.8,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => ContentItemWidget(
          ontap: () async {
            bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
            if (index == 3) {
              if (serviceEnabled) {
                navigatorTo(context, contentScreens[3]);
              } else {
                showDialog(
                  context: context,
                  builder: (context) => const LocationQiblaDialogWidget(),
                );
              }
            } else {
              navigatorTo(context, contentScreens[index]);
            }
          },
          color: thirdColor!,
          image: contentImages[index],
          text: contentTexts(context)[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
