import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/azkar/presentation/views/azkar_details_screen.dart';
import 'package:quran_app/core/shared/components.dart';

class AzkarItemWidget extends StatelessWidget {
  const AzkarItemWidget({
    super.key,
    required this.name,
    required this.index,
    required this.data,
  });
  final String name;
  final int index;
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          navigatorTo(
            context,
            AzkarDetailsScreen(
              index: index,
              data: data,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
