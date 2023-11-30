import 'package:flutter/material.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget(
      {super.key, required this.ontap, required this.ispaly});
  final VoidCallback ontap;
  final bool ispaly;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      child: IconButton(
        onPressed: ontap,
        icon: Icon(
          ispaly ? Icons.pause : Icons.play_arrow,
          size: 50,
        ),
      ),
    );
  }
}
