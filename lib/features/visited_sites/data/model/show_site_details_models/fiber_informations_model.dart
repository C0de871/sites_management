import 'package:equatable/equatable.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details_entities/fiber_informations_entity.dart';

class FiberInformationsModel extends FiberInformationsEntity with EquatableMixin {
  const FiberInformationsModel({
    required super.destination,
    required super.remarks,
  });

  static const String destinationKey = "destination";

  static const String remarksKey = "remarks";

  @override
  FiberInformationsModel copyWith({
    String? destination,
    String? remarks,
  }) {
    return FiberInformationsModel(
      destination: destination ?? this.destination,
      remarks: remarks ?? this.remarks,
    );
  }

  factory FiberInformationsModel.fromJson(Map<String, dynamic> json) {
    return FiberInformationsModel(
      destination: json[destinationKey],
      remarks: json[remarksKey],
    );
  }

  Map<String, dynamic> toJson() => {
        destinationKey: destination,
        remarksKey: remarks,
      };

  @override
  List<Object?> get props => [
        destination,
        remarks,
      ];
}
