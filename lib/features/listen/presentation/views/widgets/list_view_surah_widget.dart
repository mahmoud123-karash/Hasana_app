import 'package:flutter/material.dart';
import 'item_surah_builder_widget.dart';

class ListViewSurahWidget extends StatelessWidget {
  const ListViewSurahWidget({
    super.key,
    required this.image,
    required this.name,
    required this.id,
  });
  final String image;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemBuilder: (context, index) => ItemSurahBuilderWidget(
          index: index,
          image: image,
          name: name,
          id: id,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: 114,
      ),
    );
  }
}
