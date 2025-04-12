part of 'visited_site_details_cubit.dart';

sealed class VisitedSiteDetailsState {
  const VisitedSiteDetailsState();
}

final class VisitedSiteDetailsInitial extends VisitedSiteDetailsState {}

final class VisitedSiteDetailsFailed extends VisitedSiteDetailsState {
  String msg;

  VisitedSiteDetailsFailed({required this.msg});
}

final class VisitedSiteDetailsSuccess extends VisitedSiteDetailsState {
  MessageEntity data;

  VisitedSiteDetailsSuccess({required this.data});
}

final class VisitedSiteDetailsLoading extends VisitedSiteDetailsState {}

class FormValidationChanged extends VisitedSiteDetailsState {}
