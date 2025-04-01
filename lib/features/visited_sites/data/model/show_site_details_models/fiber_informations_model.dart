import 'package:equatable/equatable.dart';

class FiberInformationsModel extends Equatable {
  const FiberInformationsModel({
    required this.destination,
    required this.remarks,
  });

  final String? destination;
  static const String destinationKey = "destination";

  final String? remarks;
  static const String remarksKey = "remarks";

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
