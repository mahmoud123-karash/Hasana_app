import 'package:flutter/material.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/text_load_pages_widget.dart';
import 'row_download_widget.dart';
import 'stack_download_widget.dart';

class ProgressLoadingPagesWidget extends StatelessWidget {
  const ProgressLoadingPagesWidget({
    super.key,
    required this.count,
  });
  final int count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextLoadPagesWidgets(),
          const SizedBox(
            height: 20,
          ),
          StackDownloadWidget(count: count),
          const SizedBox(
            height: 20,
          ),
          RowDownloadWidget(count: count),
        ],
      ),
    );
  }
}
