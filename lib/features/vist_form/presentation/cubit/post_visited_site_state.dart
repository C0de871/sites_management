part of 'post_visited_site_cubit.dart';

sealed class PostVisitedSiteState {
  const PostVisitedSiteState();
}

final class PostVisitedSiteInitial extends PostVisitedSiteState {}

final class PostVisitedSiteFailed extends PostVisitedSiteState {
  String msg;

  PostVisitedSiteFailed({required this.msg});
}

final class PostVisitedSiteSuccess extends PostVisitedSiteState {
  PostVisitedSiteEntity data;

  PostVisitedSiteSuccess({required this.data});
}

final class PostVisitedSiteLoading extends PostVisitedSiteState {}
