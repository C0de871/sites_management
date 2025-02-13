import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_card.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_photo_picker.dart';
import 'package:sites_management/features/vist_form/presentation/widgets/custom_text_field.dart';

import '../cubit/post_visited_site_cubit.dart';

class SiteGeneralInfo extends StatelessWidget {
  const SiteGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<PostVisitedSiteCubit>();
    return CustomCard(
      title: 'General Information',
      children: [
        CustomTextField(
          'Site Name',
          icon: Icons.location_on,
          controller: visitFormCubit.siteNameController,
        ),
        CustomTextField(
          'Site Code',
          icon: Icons.code,
          controller: visitFormCubit.siteCodeController,
        ),
        CustomTextField(
          'Governorate',
          icon: Icons.location_city,
          controller: visitFormCubit.governorateController,
        ),
        CustomTextField(
          'Street',
          icon: Icons.add_road,
          controller: visitFormCubit.streetController,
        ),
        CustomTextField(
          'Area',
          icon: Icons.map,
          controller: visitFormCubit.areaController,
        ),
        CustomTextField(
          'City',
          icon: Icons.place,
          controller: visitFormCubit.cityController,
        ),
        CustomPhotoPicker(
          images: visitFormCubit.generalSitePhotos,
          title: "General Site Photos",
        ),
      ],
    );
  }
}
