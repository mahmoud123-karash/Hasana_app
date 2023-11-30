import 'package:flutter/material.dart';
import 'package:quran_app/features/urls/data/models/url_model.dart';
import 'package:quran_app/features/urls/presentation/views/widgets/url_image_widget.dart';
import '../../../../../core/services/services.dart';
import 'url_title_widget.dart';

class UrlItemWidget extends StatelessWidget {
  const UrlItemWidget({super.key, required this.model});
  final UrlModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openUrl(url: model.url!);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UrlImageWidget(image: model.image!),
              UrlTitleWidget(
                title: model.name!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
