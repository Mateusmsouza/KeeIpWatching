import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalData {
  bool canRead = false;
  String filePath;

  LocalData({filePath});

  requestWritePermission() async {

    bool permissionStorage = await Permission.storage.isGranted;
    print(permissionStorage);
    if (permissionStorage == false){
      await Permission.storage.request();
    }
  }

  Future<File> write(String content) async {
    final file = await _localFile;

    return file.writeAsString('$content');
  }

  Future<String> read() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$filePath');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
}
