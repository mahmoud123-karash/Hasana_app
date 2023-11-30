import 'package:flutter/material.dart';
import 'package:quran_app/core/shared/lists.dart';
import 'package:quran_app/features/salah/presetation/views/widgets/item_salah_widget.dart';

class ListViewSalahWidget extends StatelessWidget {
  const ListViewSalahWidget({super.key, required this.times});
  final List<String> times;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => ItemSalahWidget(
          icon: salahIcons[index],
          textName: salatNames(context)[index],
          textTime: times[index],
          index: index,
          cIndex: times[8] == '0' ? 7 : int.parse(times[8]),
        ),
        itemCount: 7,
      ),
    );
  }
}
