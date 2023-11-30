import 'package:flutter/material.dart';
import 'package:quran_app/features/qibla/presentation/views/widgets/compass_data_widget.dart';
import 'package:quran_app/features/qibla/presentation/views/widgets/offset_widget.dart';
import 'stack_compass_widget.dart';

class CompassWidget extends StatelessWidget {
  const CompassWidget(
      {super.key,
      required this.direction,
      required this.qiblah,
      required this.offset,
      required this.connectionState});
  final double direction;
  final double qiblah;
  final double offset;
  final ConnectionState connectionState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CompassDataWidget(
            direction: direction,
            qiblah: qiblah,
          ),
          const Spacer(),
          StackCompassWidget(
            qiblah: qiblah,
            direction: direction,
          ),
          const Spacer(),
          connectionState != ConnectionState.active
              ? const CircularProgressIndicator()
              : OffsetWidget(
                  offset: offset,
                )
        ],
      ),
    );
  }
}
