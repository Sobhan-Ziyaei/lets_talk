import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/bloc/grammer/grammer_event.dart';
import 'package:lets_talk/bloc/grammer/grammer_state.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/data/repository/grammer_repository.dart';

class GrammerBloc extends Bloc<GrammerEvent, GrammerState> {
  final IGrammerRepository repository = locator.get();
  GrammerBloc() : super(GrammerInitialState()) {
    on<GrammerTopicsEvent>((event, emit) async {
      emit(GrammerLoadingState());
      var response = await repository.getGrammerTopic(event.level);
      emit(GrammerTopicsResponseState(grammerTopicResponse: response));
    });

    on<GrammerContentEvent>((event, emit) async {
      emit(GrammerLoadingState());
      var response = await repository.getGrammerContent(event.id,event.level);
      emit(GrammerContentResponseState(grammerContentResponse: response));
    });
  }
}
