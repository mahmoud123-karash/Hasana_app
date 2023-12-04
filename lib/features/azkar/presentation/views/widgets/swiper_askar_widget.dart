import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/presentation/manager/swiper_cubit/swiper_cubit.dart';
import 'package:quran_app/features/azkar/presentation/views/widgets/azkar_text_widget.dart';

class SwiperAzkarWidget extends StatefulWidget {
  const SwiperAzkarWidget({
    super.key,
    required this.azkar,
    required this.swiperController,
  });
  final List<AzkarModel> azkar;
  final SwiperController swiperController;

  @override
  State<SwiperAzkarWidget> createState() => _SwiperAzkarWidgetState();
}

class _SwiperAzkarWidgetState extends State<SwiperAzkarWidget> {
  int cIndex = 0;
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
          index: cIndex,
          loop: false,
          physics: const BouncingScrollPhysics(),
          onIndexChanged: (value) {
            setState(() {
              cIndex = value;
            });
            SwiperCubit.get(context).saveAzkarCIndex(value);
          },
          controller: widget.swiperController,
          itemCount: widget.azkar.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) => AzkarTextWidget(
                index: index,
                content: widget.azkar[index].content!,
                count: widget.azkar[index].count!,
              ),
              itemCount: 1,
            ),
          ),
        ),
      ),
    );
  }
}
