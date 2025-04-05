import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/get_visited_site_images/image_data_entity.dart';

class ImageDataModel extends ImageDataEntity with EquatableMixin {
  const ImageDataModel({
    required super.id,
    required super.url,
  });

  static const String idKey = "id";

  static const String urlKey = "url";

  @override
  ImageDataModel copyWith({
    int? id,
    String? url,
  }) {
    return ImageDataModel(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  factory ImageDataModel.fromJson(Map<String, dynamic> json) {
    return ImageDataModel(
      id: json[idKey],
      url: json[urlKey],
    );
  }

  Map<String, dynamic> toJson() => {
        idKey: id,
        urlKey: url,
      };

  @override
  List<Object?> get props => [
        id,
        url,
      ];
}
