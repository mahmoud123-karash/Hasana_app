import 'package:flutter/material.dart';
import 'package:quran_app/features/qibla/presentation/views/widgets/qibla_compass_stream_builder_widget.dart';
import '../../../../generated/l10n.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).qibla,
        ),
      ),
      body: const QiblahCompassStreamBuilderWidget(),
    );
  }
}
