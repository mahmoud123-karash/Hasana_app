import 'package:flutter/material.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_item_widget.dart';

class AzkarListViewWIdget extends StatelessWidget {
  const AzkarListViewWIdget({super.key, required this.azkar});
  final Map azkar;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: azkarNames(context).length,
      itemBuilder: (context, index) => AzkarItemWidget(
        index: index,
        name: azkarNames(context)[index],
        data: azkar,
      ),
    );
  }
}
