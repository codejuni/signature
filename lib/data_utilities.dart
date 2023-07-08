// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

abstract class DataUtilities {
  static Future<void> saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);

    await Share.shareFiles([image.path]);
  }

  static Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    String name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }
}
