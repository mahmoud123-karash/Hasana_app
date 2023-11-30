import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:badges/badges.dart' as badges;
import 'package:quran_app/features/notification/presentation/manager/notification_cubit.dart';
import 'package:quran_app/features/notification/presentation/manager/notification_states.dart';

import '../../../../../core/contants/constants.dart';
import '../../../../../core/shared/components.dart';
import '../../../../notification/presentation/views/notification_screen.dart';
import 'notification_icon_widget.dart';

class BadgeNotificationIconWidget extends StatefulWidget {
  const BadgeNotificationIconWidget({super.key});

  @override
  State<BadgeNotificationIconWidget> createState() =>
      _BadgeNotificationIconWidgetState();
}

class _BadgeNotificationIconWidgetState
    extends State<BadgeNotificationIconWidget> {
  late int badge;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationStates>(
      builder: (context, state) {
        int cachedCount = cache_helper.getData(key: 'count') ?? 0;
        int count = NotificationCubit.get(context).count;
        badge = count - cachedCount;
        return IconButton(
          onPressed: () {
            setState(() {
              badge = 0;
            });
            navigatorTo(context, const NotificationScreen());
          },
          icon: badge == 0
              ? const NotificationIconWidget()
              : Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: myColor!,
                    ),
                    badgeContent: Text(
                      badge > 0 ? '$badge' : '',
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    child: const NotificationIconWidget(),
                  ),
                ),
        );
      },
    );
  }
}
