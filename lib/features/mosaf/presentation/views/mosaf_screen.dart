import 'package:flutter/material.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';
import 'package:quran_app/features/mosaf/presentation/views/mosaf_drawer_widget.dart';
import 'package:quran_app/features/mosaf/presentation/views/widgets/page_view_widget.dart';

class MosafScreen extends StatelessWidget {
  const MosafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PageCubit.get(context).mosafKey,
      drawer: const MosafDrawerWidget(),
      body: const PageViewWidget(),
    );
  }
}
