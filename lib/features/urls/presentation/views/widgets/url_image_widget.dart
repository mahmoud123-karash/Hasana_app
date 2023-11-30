import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/contants/constants.dart';

class UrlImageWidget extends StatelessWidget {
  const UrlImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size(context).width,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          repeat: ImageRepeat.repeatX,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Container(
            color: secondColor,
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error_outline,
          ),
        ),
      ),
    );
  }
}
