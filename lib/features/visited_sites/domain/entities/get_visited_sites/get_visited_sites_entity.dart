class GetVisitedSitesEntity {
  final String? name;
  final String? code;
  final String? area;
  final String? street;
  final String? city;
  final int? id;

  const GetVisitedSitesEntity({
    this.name,
    this.code,
    this.area,
    this.street,
    this.city,
    required this.id,
  });
}
