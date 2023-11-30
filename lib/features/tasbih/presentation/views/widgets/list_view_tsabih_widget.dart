import 'package:flutter/material.dart';
import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/item_widget.dart';

class ListViewTasabihWidget extends StatelessWidget {
  const ListViewTasabihWidget({super.key, required this.tasabih});
  final List<TasbihModel> tasabih;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemWidget(
            tsabih: tasabih[index],
            index: index,
          ),
        ),
        itemCount: tasabih.length,
      ),
    );
  }
}
