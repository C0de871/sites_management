import 'dart:async';

import '../../domain/entities/get_visited_sites/get_visited_sites_entity.dart';

class VisitedSitesEventBus {
  final _controller = StreamController<VisitedSiteEvent>.broadcast();

  Stream<VisitedSiteEvent> get events => _controller.stream;

  void emit(VisitedSiteEvent event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}

sealed class VisitedSiteEvent {}

class VisitedSiteAddedEvent extends VisitedSiteEvent {
  final GetVisitedSitesEntity site;
  VisitedSiteAddedEvent(this.site);
}

class VisitedSiteUpdatedEvent extends VisitedSiteEvent {
  final GetVisitedSitesEntity site;
  VisitedSiteUpdatedEvent(this.site);
}

class VisitedSiteDeletedEvent extends VisitedSiteEvent {
  final int siteId;
  VisitedSiteDeletedEvent(this.siteId);
}
