import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/qibla/presentation/views/widgets/compass_widget.dart';

class QiblahCompassStreamBuilderWidget extends StatelessWidget {
  const QiblahCompassStreamBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, AsyncSnapshot<QiblahDirection> snapshot) {
        if (kDebugMode) {
          print(snapshot.connectionState);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          var data = snapshot.data ?? const QiblahDirection(0.0, .0, .0);
          saveDirection(data.direction);
          saveOffset(data.offset);
          saveQibla(data.qiblah);
          return CompassWidget(
            direction: data.direction,
            qiblah: data.qiblah,
            offset: data.offset,
            connectionState: snapshot.connectionState,
          );
        } else {
          double direction = cache_helper.getData(key: 'direction') ?? 0.0;
          double qiblah = cache_helper.getData(key: 'qiplah') ?? 0.0;
          double offset = cache_helper.getData(key: 'offset') ?? 0.0;
          return CompassWidget(
            direction: direction,
            qiblah: qiblah,
            offset: offset,
            connectionState: snapshot.connectionState,
          );
        }
      },
    );
  }
}
