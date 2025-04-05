import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/get_visited_site_images/get_visited_site_images_entity.dart';

import 'image_data_model.dart';

class GetVisitedSiteImagesModel extends GetVisitedSiteImagesEntity with EquatableMixin {
  const GetVisitedSiteImagesModel({
    required super.data,
  });

  static const String dataKey = "data";

  factory GetVisitedSiteImagesModel.fromJson(Map<String, dynamic> json) {
    return GetVisitedSiteImagesModel(
      data: json[dataKey] == null
          ? []
          : List<ImageDataModel>.from(
              (json[dataKey]! as List).map((x) => ImageDataModel.fromJson(x)),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        dataKey: data.map((x) => (x as ImageDataModel).toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        data,
      ];
}
