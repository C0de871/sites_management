import 'dart:developer';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:sites_management/core/databases/errors/error_model.dart';
import 'package:sites_management/core/databases/errors/expentions.dart';

import '../../helper/device_info.dart';
import '../../shared/enums/storage_exception_type.dart';

class ExternalStorageManager {
  late final DeviceInfo _deviceInfo;
  String? _baseDirPath;
  ExternalStorageManager({required DeviceInfo deviceInfo}) {
    _deviceInfo = deviceInfo;
  }
  Future<void> createAppStorageDir(String appName) async {
    if (await requestStoragePermission()) {
      final Directory baseDir = Directory('/storage/emulated/0/$appName/sites');
      if (!(await baseDir.exists())) {
        await baseDir.create(recursive: true);
      }
      _baseDirPath = baseDir.path;
      log('Directory created at: ${baseDir.path}');
    } else {
      throw (
        StorageException(
          StorageErrorModel(
            errorMessage: "Access denied to device storage",
            type: StorageExceptionType.externalStoragePermissionDenied,
          ),
        ),
      );
    }
  }

  Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      if (await _deviceInfo.isAndroid11OrAbove()) {
        return await Permission.manageExternalStorage.request().isGranted;
      } else {
        return await Permission.storage.request().isGranted;
      }
    }
    throw (
      StorageException(
        StorageErrorModel(
          errorMessage: "unspported device",
          type: StorageExceptionType.unspportedDevice,
        ),
      ),
    );
  }

  Future<File> createFile(String path) async {
    final File file = File(path);
    if (await file.exists()) {
      throw (
        StorageException(
          StorageErrorModel(
            errorMessage: "there is a file with the same name",
            type: StorageExceptionType.fileExist,
          ),
        ),
      );
    }
    await file.create(recursive: true);
    return file;
  }

  Future<bool> writeBytesOnFile(File file, List<int> bytes) async {
    await file.writeAsBytes(bytes);
    return true;
  }

  String? get baseDirPath => _baseDirPath;
}
