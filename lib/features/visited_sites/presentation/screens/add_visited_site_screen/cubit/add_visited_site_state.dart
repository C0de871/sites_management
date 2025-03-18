part of 'add_visited_site_cubit.dart';

sealed class AddVisitedSiteState {
  const AddVisitedSiteState();
}

final class AddVisitedSiteInitial extends AddVisitedSiteState {}

final class AddVisitedSiteFailed extends AddVisitedSiteState {
  String msg;

  AddVisitedSiteFailed({required this.msg});
}

final class AddVisitedSiteSuccess extends AddVisitedSiteState {
  AddVisitedSiteEntity data;

  AddVisitedSiteSuccess({required this.data});
}

final class AddVisitedSiteLoading extends AddVisitedSiteState {}

class FormValidationChanged extends AddVisitedSiteState {}
