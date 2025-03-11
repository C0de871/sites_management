import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site_screen/widgets/custom_photo_picker.dart';

import '../../../cubit/post_visited_site_cubit.dart';
import 'custom_card.dart';

class PhotoSection extends StatelessWidget {
  const PhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: "Other photos:",
      children: [
        CustomPhotoPicker(
          images: visitFormCubit.transmissionPhotos,
          title: "Transmission photos:",
        ),
        const SizedBox(height: 16),
        CustomPhotoPicker(
          images:visitFormCubit.rBSImages,
          title: "RBS photos:",
        ),
        const SizedBox(height: 16),
        CustomPhotoPicker(
          images:visitFormCubit.additionalPhotos,
          title: "Additional photos:",
        ),
        const SizedBox(height: 16),
        CustomPhotoPicker(
          images:visitFormCubit.fuelCageImages,
          title: "fuel cage photos:",
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
