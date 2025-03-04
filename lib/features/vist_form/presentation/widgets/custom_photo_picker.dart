import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sites_management/core/utils/constants/app_numbers.dart';

import '../../../../core/helper/app_functions.dart';
import '../cubit/post_visited_site_cubit.dart';
import '../screens/add_visited_site.dart';

class CustomPhotoPicker extends StatelessWidget {
  const CustomPhotoPicker({super.key, required this.title, required this.images});
  final String title;
  final List<XFile> images;

  @override
  Widget build(BuildContext context) {
    final visitedFormCubit = context.read<PostVisitedSiteCubit>();
    return SizedBox(
      height: 100,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
        ),
        child: BlocBuilder<PostVisitedSiteCubit, PostVisitedSiteState>(
          builder: (context, state) {
            log("rebuild phootos");
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(images.length, (index) {
                  return imageBuilder(
                    images,
                    index,
                    visitedFormCubit,
                  );
                }),
                AddNewPhoto(
                  images: images,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class AddNewPhoto extends StatelessWidget {
  const AddNewPhoto({
    super.key,
    required this.images,
  });
  final List<XFile> images;

  Future<void> _showImageSourceSheet(BuildContext parentContext) async {
    final visitFormCubit = parentContext.read<PostVisitedSiteCubit>();

    showModalBottomSheet(
      context: parentContext,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: mtnDarkYellow.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: mtnDarkYellow,
                  ),
                ),
                title: const Text(
                  'Take Photo',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await ImagePicker().pickImage(source: ImageSource.camera);
                  if (image != null) {
                    final compressedImage = await compressImage(image);
                    if (parentContext.mounted) {
                      visitFormCubit.addRemoveImage(() {
                        if (compressedImage != null) {
                          images.add(compressedImage);
                        }
                      });
                    }
                  }
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: mtnDarkYellow.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.photo_library,
                    color: mtnDarkYellow,
                  ),
                ),
                title: const Text(
                  'Choose from Gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    log("image not empty");
                    final compressedImage = await compressImage(image);
                    if (parentContext.mounted) {
                      log("context is mounted");
                      visitFormCubit.addRemoveImage(() {
                        if (compressedImage != null) {
                          images.add(compressedImage);
                        }
                      });
                    }
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
      backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showImageSourceSheet(context),
      child: Container(
        width: 84,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: mtnDarkYellow.withOpacity(0.1),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate,
              color: mtnDarkYellow,
            )
          ],
        ),
      ),
    );
  }
}

Row imageBuilder(List<XFile> images, int index, PostVisitedSiteCubit visitFormCubit) {
  return Row(
    children: [
      Stack(
        children: [
          Container(
            width: 84,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                fit: BoxFit.cover,
                File(
                  images[index].path,
                ),
              ),
            ),
          ),
          Positioned(
            left: padding4 * 1,
            top: padding4 * 1,
            child: GestureDetector(
              onTap: () {
                visitFormCubit.addRemoveImage(() {
                  images.removeAt(index);
                });
              },
              child: const Icon(
                Icons.delete,
                size: 20,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(width: 8)
    ],
  );
}
