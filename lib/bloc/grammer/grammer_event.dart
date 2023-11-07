abstract class GrammerEvent {}

class GrammerTopicsEvent extends GrammerEvent {
  String level ;
  GrammerTopicsEvent({required this.level});
}

class GrammerContentEvent extends GrammerEvent{
  String id ;
  String level ;
  GrammerContentEvent({required this.id,required this.level});
}