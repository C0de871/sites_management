import 'package:equatable/equatable.dart';

class FiberInformationsEntity extends Equatable {
  const FiberInformationsEntity({
    required this.destination,
    required this.remarks,
  });

  final String? destination;
  final String? remarks;

  FiberInformationsEntity copyWith({
    String? destination,
    String? remarks,
  }) {
    return FiberInformationsEntity(
      destination: destination ?? this.destination,
      remarks: remarks ?? this.remarks,
    );
  }

  @override
  List<Object?> get props => [
        destination,
        remarks,
      ];
}
