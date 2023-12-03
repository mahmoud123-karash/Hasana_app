import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/search/presentation/manager/search_cubit.dart';
import 'package:quran_app/features/search/presentation/manager/search_states.dart';
import 'package:quran_app/features/search/presentation/views/widgets/search_loading_widget.dart';
import 'widgets/search_page_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600), () {
      SearchCubit.get(context).getVerses();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("البحث"),
      ),
      body: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          if (cubit.verses.length == 6236) {
            return SerachPageWidget(
              controller: controller,
              cubit: cubit,
              state: state,
            );
          } else {
            return const SearchLoadingWdget();
          }
        },
      ),
    );
  }
}
