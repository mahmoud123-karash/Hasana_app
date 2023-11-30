import 'package:flutter/material.dart';
import 'package:quran_app/features/urls/data/models/url_model.dart';

import 'url_item_widget.dart';

class UrlListViewWidget extends StatelessWidget {
  const UrlListViewWidget({super.key, required this.urls});
  final List<UrlModel> urls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.separated(
        itemBuilder: (context, index) => UrlItemWidget(
          model: urls[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: urls.length,
      ),
    );
  }
}
