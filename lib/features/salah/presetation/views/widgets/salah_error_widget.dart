// ignore_for_file: use_build_context_synchronously

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/features/salah/presetation/manager/salah_cubit/salah_cubit.dart';

class SalahErrorWidget extends StatelessWidget {
  const SalahErrorWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    int num = cache_helper.getData(key: 'num');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            num == 1
                ? Icons.network_check_rounded
                : num == 2
                    ? Icons.location_off_outlined
                    : Icons.add_location_alt_outlined,
            size: 100,
            color: Colors.black54,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: size(context).height / 4,
          ),
          GestureDetector(
            onTap: () async {
              if (await handleLocationPermission(context)) {
                SalahCubit.get(context).updatePosition(context);
              }
              if (num == 2) {
                AppSettings.openAppSettings(
                  type: AppSettingsType.location,
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 0.1),
                  color: myColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'حاول مرة ثانية',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
