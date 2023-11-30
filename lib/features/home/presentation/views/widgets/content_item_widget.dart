import 'package:flutter/material.dart';

class ContentItemWidget extends StatelessWidget {
  const ContentItemWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.color,
      required this.ontap});
  final String image;
  final String text;
  final Color color;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(image),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
