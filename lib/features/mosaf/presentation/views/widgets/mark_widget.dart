import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';
import 'package:quran_app/generated/l10n.dart';

class MarkWidget extends StatelessWidget {
  const MarkWidget({super.key, required this.mark});
  final int mark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size(context).width / 1.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black54,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).mark,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.bookmark,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${S.of(context).page} $mark",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        PageCubit.get(context).goToPage(page: mark - 1);
                        PageCubit.get(context).closeDrawer();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Text(
                            S.of(context).follow,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
