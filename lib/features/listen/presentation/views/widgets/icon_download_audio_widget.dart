import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class IconDownloadAudioWidget extends StatelessWidget {
  const IconDownloadAudioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.file_download_outlined,
      size: 30,
      color: blackColor,
    );
  }
}
