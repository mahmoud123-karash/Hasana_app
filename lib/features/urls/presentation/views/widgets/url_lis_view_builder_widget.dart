import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/urls/presentation/manager/url_cubit.dart';
import 'package:quran_app/features/urls/presentation/manager/url_states.dart';
import 'package:quran_app/features/urls/presentation/views/widgets/url_error_widget.dart';
import 'package:quran_app/features/urls/presentation/views/widgets/url_list_view_widget.dart';
import 'package:quran_app/features/urls/presentation/views/widgets/url_loading_widget.dart';

class UrlListViewBuilderWidget extends StatelessWidget {
  const UrlListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UrlCubit, UrlStates>(
      builder: (context, state) {
        if (state is SuccessGetUrlState) {
          return UrlListViewWidget(urls: state.urls);
        } else if (state is ErrorGetUrlState) {
          return UrlErrorWidget(text: state.error);
        } else {
          return const UrlLoadingWidget();
        }
      },
    );
  }
}
