import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_text_widget.dart';
import '../../../../../core/cache/save_data.dart';

class SwiperAzkarWidget extends StatelessWidget {
  const SwiperAzkarWidget(
      {super.key, required this.azkar, required this.swiperController});
  final List<AzkarModel> azkar;
  final SwiperController swiperController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.black)),
      child: SizedBox(
        height: size.height - 300,
        child: Swiper(
          loop: false,
          physics: const NeverScrollableScrollPhysics(),
          onIndexChanged: (value) {
            saveAzkarIndex(value);
          },
          controller: swiperController,
          itemCount: azkar.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) => AzkarTextWidget(
                index: index,
                content: azkar[index].content!,
                count: azkar[index].count!,
              ),
              itemCount: 1,
            ),
          ),
        ),
      ),
    );
  }
}
