import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/urls/data/data_sources/url_remote_data_source.dart';
import 'package:quran_app/features/urls/data/repo/url_repo_impl.dart';
import 'package:quran_app/features/urls/presentation/manager/url_cubit.dart';
import '../../../../generated/l10n.dart';
import 'widgets/url_lis_view_builder_widget.dart';

class UrisScreen extends StatelessWidget {
  const UrisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UrlCubit(
        UrlRepoImpl(
          UrlRemoteDataSourceImpl(),
        ),
      )..getUrls(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            S.of(context).url,
          ),
        ),
        body: const UrlListViewBuilderWidget(),
      ),
    );
  }
}
