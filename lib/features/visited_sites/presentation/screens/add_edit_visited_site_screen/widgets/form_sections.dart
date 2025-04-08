import 'package:flutter/material.dart';
import 'package:sites_management/core/utils/constants/constant.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/ampere_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/environment_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/fiber_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/generator_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/gsm_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/lte_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/lvdp_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/photo_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/rectifier_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_additional_info.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_configuration.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_general_info.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_type.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/solar_and_wind_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/tcu_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/three_g_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/tower_setion.dart';

class FormSections extends StatelessWidget {
  const FormSections({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SiteGeneralInfo(),
          SizedBox(height: 16),
          SiteType(),
          SizedBox(height: 16),
          SiteConfiguration(),
          SizedBox(height: 16),
          SiteAdditionalInfo(),
          SizedBox(height: 16),
          AmpereSection(),
          SizedBox(height: 16),
          TcuSection(),
          SizedBox(height: 16),
          FiberSection(),
          SizedBox(height: 16),
          GsmSection(band: MapKeys.gsm900),
          SizedBox(height: 16),
          GsmSection(band: MapKeys.gsm1800),
          SizedBox(height: 16),
          ThreeGSection(),
          SizedBox(height: 16),
          LteSection(),
          SizedBox(height: 16),
          RectifierSection(),
          SizedBox(height: 16),
          EnvironmentSection(),
          SizedBox(height: 16),
          TowerSection(),
          SizedBox(height: 16),
          SolarAndWindSection(),
          SizedBox(height: 16),
          GeneratorSection(),
          SizedBox(height: 16),
          LvdpSection(),
          SizedBox(height: 16),
          PhotoSection(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
