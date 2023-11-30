// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/features/salah/presetation/manager/salah_cubit/salah_cubit.dart';

class UpdateLocationButtonWidget extends StatelessWidget {
  const UpdateLocationButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await handleLocationPermission(context)) {
          SalahCubit.get(context).updatePosition(context);
        }
      },
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 15,
          ),
          Text(
            'تحديث',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: myColor,
            ),
          ),
        ],
      ),
    );
  }
}
