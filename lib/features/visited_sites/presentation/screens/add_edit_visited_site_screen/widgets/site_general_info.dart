import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/shared/enums/form_type.dart';
import '../../../../../../core/helper/extensions.dart';
import '../../../../../../core/shared/widgets/form_container.dart';
import '../../../../../../core/utils/constants/app_numbers.dart';
import 'custom_photo_picker.dart';
import '../../../../../../core/shared/widgets/custom_text_field.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../../../../core/Routes/app_routes.dart';
import '../../../../../../core/utils/constants/site_code_name.dart';
import '../cubit/visited_site_details_cubit.dart';
import '../add_visited_site.dart';

class SiteGeneralInfo extends StatelessWidget {
  const SiteGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final visitFormCubit = context.read<VisitedSiteDetailsCubit>();
    return SiteInfoForm(
      formType: FormType.generalInfo,
      formKey: visitFormCubit.siteGeneralInfoKey,
      routeName: AppRoutes.siteTypeAndConfig,
      formSection: FormContainer(
        title: 'General Information',
        children: [
          BlocBuilder<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
            builder: (context, state) {
              return DropdownSearch<String>(
                // value: visitFormCubit.selectedCode,
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: "Site Code",
                    hintText: "Select a code",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
                selectedItem: visitFormCubit.selectedCode,
                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  title: Container(
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Site codes:',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                  ),
                  dialogProps: DialogProps(
                    surfaceTintColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                    clipBehavior: Clip.antiAlias,
                    shape: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                items: (f, cs) => siteData.keys.toList(),
                onChanged: (value) {
                  visitFormCubit.changeSwitchStatus(() {
                    visitFormCubit.selectedCode = value;
                    visitFormCubit.selectedName = siteData[value];
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a site code';
                  }
                  return null;
                },
              );
            },
          ),
          const SizedBox(
            height: padding4 * 4,
          ),
          BlocBuilder<VisitedSiteDetailsCubit, VisitedSiteDetailsState>(
            builder: (context, state) {
              return DropdownSearch<String>(
                // value: visitFormCubit.selectedCode,
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: "Site Name",
                    hintText: "Select a name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
                selectedItem: visitFormCubit.selectedName,
                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Sites name:',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                  ),
                  dialogProps: DialogProps(
                    surfaceTintColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                    clipBehavior: Clip.antiAlias,
                    shape: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                items: (f, cs) => siteData.values.toList(),
                onChanged: (value) {
                  visitFormCubit.changeSwitchStatus(() {
                    visitFormCubit.selectedName = value;
                    visitFormCubit.selectedCode = siteData.entries.firstWhere((entry) => entry.value == value).key;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a site name';
                  }
                  return null;
                },
              );
            },
          ),
          const SizedBox(
            height: padding4 * 4,
          ),
          CustomTextField(
            'Governorate',
            icon: Icons.location_city,
            controller: visitFormCubit.governorateController,
            validator: (value) {
              if (value.isEmptyOrWhitespace) {
                return "Governorate is required";
              }
              return null;
            },
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
          if(visitFormCubit.visitedSiteId==null)
          CustomPhotoPicker(
            images: visitFormCubit.generalSitePhotos,
            title: "General Site Photos",
          ),
        ],
      ),
    );
  }
}
