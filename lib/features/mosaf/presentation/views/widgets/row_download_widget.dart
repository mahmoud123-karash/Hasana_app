import 'package:flutter/material.dart';

import 'text_loading_number_widget.dart';

class RowDownloadWidget extends StatelessWidget {
  const RowDownloadWidget({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextLoadingNumberWidget(
          text: count.toString(),
        ),
        const SizedBox(
          width: 10,
        ),
        const TextLoadingNumberWidget(text: 'من'),
        const SizedBox(
          width: 10,
        ),
        const TextLoadingNumberWidget(text: '604'),
      ],
    );
  }
}
