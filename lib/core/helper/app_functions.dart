import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness currentBrightness, BuildContext context) {
  return currentBrightness == Brightness.light
      ? SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Theme.of(context).colorScheme.surface,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
        )
      : SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Theme.of(context).colorScheme.inversePrimary,
          systemNavigationBarColor: Theme.of(context).colorScheme.surface,
          systemNavigationBarIconBrightness: Brightness.light,
        );
}

Future<XFile?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.gallery); // or ImageSource.camera
  return image;
}

Future uploadImageToApi(XFile? image) async {
  if (image == null) return null;
  return MultipartFile.fromFile(image.path, filename: image.path.split('/').last);
}

class RouteObserverService extends NavigatorObserver {
  final List<String> routeHistory = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('Pushed route: ${route.settings.name}');
    routeHistory.add(route.settings.name ?? 'Unknown');
    printRouteHistory();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('Popped route: ${route.settings.name}');
    routeHistory.removeLast();
    printRouteHistory();
  }

  void printRouteHistory() {
    log('Current navigation stack:');
    for (var route in routeHistory) {
      log(route);
    }
  }
}

bool isRtl(BuildContext context) {
  final textDirection = Directionality.of(context);
  final isRtl = textDirection == TextDirection.rtl;
  return isRtl;
}

Future<XFile?> compressImage(XFile? imageFile) async {
  if (imageFile == null) return null;
  final String dir = (await getTemporaryDirectory()).path;
  final String extension = getFileExtension(imageFile.path);  
  final String targetPath = '$dir/compressed_${DateTime.now().millisecondsSinceEpoch}.$extension';

  // Determine the correct compression format
  CompressFormat format;
  switch (extension) {
    case 'png':
      format = CompressFormat.png;
      break;
    case 'webp':
      format = CompressFormat.webp;
      break;
    case 'heic':
    case 'heif':
      format = CompressFormat.heic;
      break;
    default:
      format = CompressFormat.jpeg; // Default to JPEG
  }

  final XFile? compressedFile = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    targetPath,
    quality: 70,
    format: format,
  );
  if (compressedFile != null) {
    final compressedFileSize = await compressedFile.length(); // Get compressed file size in bytes
    log("Compressed file size: ${compressedFileSize / 1024} KB"); // Convert to KB
  }
  return compressedFile;
}

String getFileExtension(String path) {
  return path.split('.').last.toLowerCase();
}
