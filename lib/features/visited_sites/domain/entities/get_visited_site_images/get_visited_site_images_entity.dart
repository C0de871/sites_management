import 'package:equatable/equatable.dart';

import 'image_data_entity.dart';

class GetVisitedSiteImagesEntity extends Equatable {
  const GetVisitedSiteImagesEntity({
    required this.data,
  });

  final List<ImageDataEntity> data;

  GetVisitedSiteImagesEntity copyWith({
    List<ImageDataEntity>? data,
  }) {
    return GetVisitedSiteImagesEntity(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}
