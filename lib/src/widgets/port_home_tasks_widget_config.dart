import 'dart:io';
import 'dart:typed_data';

import '../widgets/port_home_tasks_widget.dart';
import 'package:davinci/davinci.dart';
//import 'package:davinci/core/davinci_capture.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:path_provider/path_provider.dart';


class PortHomeTasksWidgetConfig {
  static Future<void> update(context, PortHomeTasksWidget widget) async {
    widget.themeBrightness = Theme.of(context).brightness;
    Uint8List bytes = await DavinciCapture.offStage(widget,
      context: context,
      returnImageUint8List: true,
      wait: const Duration(seconds: 1),
      openFilePreview: true,
    );
    final directory = await getApplicationSupportDirectory();
    File tempFile = File("${directory.path}/${DateTime.now().toIso8601String()}.png");
    await tempFile.writeAsBytes(bytes);

    await HomeWidget.saveWidgetData('filename', tempFile.path);
    await HomeWidget.updateWidget(iOSName: 'home_tasks_widget', androidName: 'PortHomeTasksWidget');
  }

  static Future<void> initialize() async {
    await HomeWidget.setAppGroupId('group.brainace_home_tasks_widget');
  }
}
