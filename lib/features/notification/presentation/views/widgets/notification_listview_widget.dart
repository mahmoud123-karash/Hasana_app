import 'package:flutter/material.dart';
import 'package:quran_app/features/notification/data/models/notification_model.dart';
import 'package:quran_app/features/notification/presentation/views/widgets/notification_item_widget.dart';

class NotificationListViewWidget extends StatelessWidget {
  const NotificationListViewWidget({super.key, required this.list});
  final List<NotificationModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          NotificationItemWidget(text: list[index].text),
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
      itemCount: list.length,
    );
  }
}
