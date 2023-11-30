import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/features/notification/presentation/manager/notification_cubit.dart';
import 'package:quran_app/features/notification/presentation/manager/notification_states.dart';
import 'package:quran_app/features/notification/presentation/views/widgets/message_notification_widget.dart';
import 'widgets/notification_listview_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الإشعارات'),
      ),
      body: BlocBuilder<NotificationCubit, NotificationStates>(
        builder: (context, state) {
          if (state is SuccessGetNotificationStates) {
            if (state.notifications.isEmpty) {
              return const MessageNotificationWidget(
                message: 'لا يوجد إشعارات',
              );
            } else {
              saveCount(state.notifications.length);
              return NotificationListViewWidget(
                list: state.notifications,
              );
            }
          } else if (state is ErrorGetNotificationStates) {
            return MessageNotificationWidget(message: state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
