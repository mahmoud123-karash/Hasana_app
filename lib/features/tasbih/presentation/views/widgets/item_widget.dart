import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import '../../manager/tasbih_cubit/tasbih_cubit.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.tsabih, required this.index});
  final TasbihModel tsabih;
  final int index;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        TasbihCubit.get(context)
            .deleteTasbih(index: widget.index, context: context);
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.pop(context);
            saveIndex(widget.index);
            TasbihCubit.get(context).cIndex = widget.index;
            TasbihCubit.get(context).getTasabih();
          });
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(boxShadow: boxShadow),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    widget.tsabih.name!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 70,
              decoration: BoxDecoration(boxShadow: boxShadow),
              child: Center(
                child: Text(
                  widget.tsabih.count!.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
