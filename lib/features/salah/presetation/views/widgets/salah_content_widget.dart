import 'package:flutter/material.dart';
import 'package:quran_app/features/salah/presetation/views/widgets/next_salah_widget.dart';
import 'list_view_salah_widget.dart';
import 'update_location_widget.dart';

class SalahContentWidget extends StatelessWidget {
  const SalahContentWidget({super.key, required this.times});
  final List<String> times;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UpdateLocationWidget(),
        NextSalahWidget(
          times: times,
        ),
        Expanded(
          child: ListViewSalahWidget(
            times: times,
          ),
        )
      ],
    );
  }
}
