import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/custom_photo_picker.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/add_visited_site_cubit.dart';
import '../add_visited_site.dart';

class PhotoSection extends StatelessWidget {
  const PhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<AddVisitedSiteCubit>();
    log(visitFormCubit.hashCode.toString());

    return SiteInfoForm(
      formType: FormType.additionalPhotoInfo,
      formKey: visitFormCubit.siteAdditionalPhotoInfoKey,
      routeName: AppRoutes.formHubScreen,
      formSection: FormContainer(
        title: "Other photos:",
        children: [
          CustomPhotoPicker(
            images: visitFormCubit.transmissionPhotos,
            title: "Transmission photos:",
          ),
          const SizedBox(height: 16),
          CustomPhotoPicker(
            images: visitFormCubit.rBSImages,
            title: "RBS photos:",
          ),
          const SizedBox(height: 16),
          CustomPhotoPicker(
            images: visitFormCubit.additionalPhotos,
            title: "Additional photos:",
          ),
          const SizedBox(height: 16),
          CustomPhotoPicker(
            images: visitFormCubit.fuelCageImages,
            title: "fuel cage photos:",
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
