import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import 'custom_photo_picker.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../cubit/visited_site_details_cubit.dart';
import '../add_visited_site.dart';

class PhotoSection extends StatelessWidget {
  const PhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    log(visitFormCubit.hashCode.toString());

    return SiteInfoForm(
      formType: FormType.additionalPhotoInfo,
      formKey: visitFormCubit.siteAdditionalPhotoInfoKey,
      routeName: AppRoutes.addFormHubScreen,
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
