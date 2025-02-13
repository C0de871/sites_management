import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/app_functions.dart';
import '../cubit/post_visited_site_cubit.dart';
import '../visit_form.dart';

class CustomPhotoPicker extends StatelessWidget {
  const CustomPhotoPicker({super.key, required this.title, required this.images});
  final String title;
  final List<XFile> images;

  @override
  Widget build(BuildContext context) {
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
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(images.length, (index) {
                  return imageBuilder(images, index);
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

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return InkWell(
      onTap: () {
        pickImage().then((value) {
          if (context.mounted) {
            visitFormCubit.addImage(() {
              if (value != null) {
                images.add(value);
              }
            });
          }
        });
      },
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

Row imageBuilder(List<XFile> images, int index) {
  return Row(
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
      const SizedBox(width: 8)
    ],
  );
}
