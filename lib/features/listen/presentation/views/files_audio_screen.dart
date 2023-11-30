import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/get_it.dart';
import 'package:quran_app/features/listen/domain/use_cases/download_use_case.dart';
import 'package:quran_app/features/listen/presentation/manager/audio_cubit/audio_cubit.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/list_view_builder_widget.dart';
import 'package:quran_app/features/listen/presentation/views/widgets/reciter_image_widget.dart';

class FilesAudioScreen extends StatelessWidget {
  const FilesAudioScreen({
    super.key,
    required this.id,
    required this.reciterName,
    required this.image,
    required this.style,
  });
  final int id;
  final String reciterName;
  final String image;
  final String style;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(
        getIt.get<DownloadUseCase>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            reciterName,
          ),
          centerTitle: true,
          actions: [
            ReciterImageWidget(image: image),
          ],
        ),
        body: ListViewBuilderWidget(
          image: image,
          name: reciterName,
          id: id,
        ),
      ),
    );
  }
}
