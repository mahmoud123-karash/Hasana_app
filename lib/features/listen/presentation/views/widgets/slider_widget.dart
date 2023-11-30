import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget(
      {super.key,
      required this.value,
      required this.max,
      required this.onChange});
  final double value;
  final double max;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: 'play',
      value: value,
      max: max,
      min: 0,
      onChanged: onChange,
    );
  }
}
