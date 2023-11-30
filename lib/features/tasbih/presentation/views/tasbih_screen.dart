import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/tasbih/presentation/manager/tasbih_cubit/tasbih_cubit.dart';
import 'package:quran_app/features/tasbih/presentation/manager/tasbih_cubit/tasbih_states.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/dialog_widget.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/reset_counter_widget.dart';
import 'package:quran_app/features/tasbih/presentation/views/widgets/tasbih_text_widget.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/generated/l10n.dart';
import '../../data/models/tasbih_model.dart';
import 'widgets/circular_percent_indicator_widget.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int? cachedIndex;
  @override
  void initState() {
    cachedIndex = cache_helper.getData(key: 'tasindex') ?? 100000000000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasbihCubit, TasbihStates>(
      builder: (context, state) {
        var cubit = TasbihCubit.get(context);
        int index = cubit.cIndex ?? cachedIndex!;
        TasbihModel model = cubit.model(index);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).tasbih,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TasbihTextWidget(tasName: model.name!),
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (model.name == S.of(context).choocetas) {
                              mysnackbar(
                                  context: context,
                                  text: S.of(context).pleasechooset);
                            } else {
                              cubit.updateCount(index: index, count: 1);
                            }
                          },
                        );
                      },
                      child: CircularPercentIndicatorWidget(
                        color: myColor!,
                        percent: 1,
                        text: '${model.count!}',
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ResetCounterWidget(
                      resetTap: () {
                        if (model.name == S.of(context).choocetas) {
                          mysnackbar(
                              context: context,
                              text: S.of(context).pleasechooset);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => DialogWidget(
                              title: S.of(context).reset,
                              body: Text(
                                S.of(context).did,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: !cache_helper.getData(key: 'isdark')
                                      ? blackColor
                                      : whiteColor,
                                ),
                              ),
                              onpressed: () {
                                setState(() {
                                  cubit.updateCount(index: index, count: 0);
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
