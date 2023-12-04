import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/listen/presentation/manager/audio_cubit/audio_cubit.dart';
import 'package:quran_app/features/listen/presentation/manager/audio_cubit/audio_states.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/list_view_surah_widget.dart';

class ListViewBuilderWidget extends StatefulWidget {
  const ListViewBuilderWidget({
    super.key,
    required this.image,
    required this.name,
    required this.id,
  });
  final String image;
  final String name;
  final int id;

  @override
  State<ListViewBuilderWidget> createState() => _ListViewBuilderWidgetState();
}

class _ListViewBuilderWidgetState extends State<ListViewBuilderWidget> {
  @override
  void initState() {
    AudioCubit.get(context).getFilePath(
      id: widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioStates>(
      builder: (context, state) {
        return ListViewSurahWidget(
          image: widget.image,
          name: widget.name,
          id: widget.id,
        );
      },
    );
  }
}
