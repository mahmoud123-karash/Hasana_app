import 'package:flutter/material.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/grid_view_item_widget.dart';

class AzkarGridViewWidget extends StatelessWidget {
  const AzkarGridViewWidget({super.key, required this.azkar});
  final Map azkar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 5 / 8,
        ),
        itemBuilder: (context, index) {
          return GridViewItemWidget(
            data: azkar,
            index: index,
            image: azkatIamges[index],
            name: azkarNames(context)[index],
          );
        },
        itemCount: azkarNames(context).length,
      ),
    );
  }
}
