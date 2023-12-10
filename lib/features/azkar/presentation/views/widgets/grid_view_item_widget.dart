import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/azkar/presentation/views/azkar_details_screen.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkare_item_image_widget.dart';

import 'azkar_item_text_widget.dart';

class GridViewItemWidget extends StatelessWidget {
  const GridViewItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.index,
    required this.data,
  });
  final String image;
  final String name;
  final int index;
  final Map data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      hoverColor: gColor,
      onTap: () {
        navigatorTo(
          context,
          AzkarDetailsScreen(index: index, data: data),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AzkarItemImageWidget(image: image),
                SizedBox(
                  height: name.length < 18 ? 25 : 20,
                ),
                AzkarItemTextWidget(name: name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
