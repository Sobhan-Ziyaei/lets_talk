import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/bloc/environment/environment_event.dart';
import 'package:lets_talk/bloc/environment/environment_state.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/data/models/environment.dart';
import 'package:lets_talk/data/repository/environment_repository.dart';

class EnvironmentBloc extends Bloc<EnvironmentEvent, EnvironmentState> {
  final IEnvironmentRepository repository = locator.get();
  EnvironmentBloc() : super(EnvironmentInitialState()) {
    on<EnvironmentTopicEvent>(
      (event, emit) async {
        emit(EnvironmentLoadingState());
        var response = await repository.getEnvironmentTopic(event.id);
        emit(EnvironmentTopicResponseState(
            environmentTopicListResponse: response));
      },
    );
    on<EnvironmentRoleEvent>(
      (event, emit) async {
        emit(EnvironmentLoadingState());
        var response = await repository.getEnvironmentRole(event.id);
        emit(EnvironmentRoleResponseStata(
            environmentRoleListResponse: response));
      },
    );

    on<EnvironmentChatEvent>(
      (event, emit) async {
        emit(EnvironmentLoadingState());
        var response = await repository.getEnvironmentChat(
            event.roleIdUser, event.roleIdAi);
        emit(EnvironmentChatResponseState(environmentChatResponse: response));
      },
    );
  }
}

class ChatBloc extends Cubit<List<EnvironmentChat>> {
  final IEnvironmentRepository repository = locator.get();
  final _allChats = [];
  final _meChats = [];
  final _youChats = [];
  int currentIndex = 0;
  int _meIndex = 0;
  int _youIndex = 0;

  ChatBloc() : super([]);

  Future<void> loadChats(int roleIdUser, int roleIdAi) async {
    try {
      _allChats.clear();
      state.clear();

      _allChats
          .addAll(await repository.getEnvironmentChat(roleIdUser, roleIdAi));

      if (_allChats.isNotEmpty) {
        _meChats.addAll(_allChats.where((element) => element.type == 'user'));
        _youChats.addAll(_allChats.where((element) => element.type == 'ai'));

        state.add(_meChats.first);
        _meIndex++;
      }
    } catch (ex) {/**/}

    emit([...state]);
  }

  void nextChat() {
    if (currentIndex >= _allChats.length - 1) {
      return;
    }

    currentIndex++;

    if (currentIndex % 2 == 0) {
      state.add(_meChats[_meIndex]);
      _meIndex++;
    } else {
      state.add(_youChats[_youIndex]);
      _youIndex++;
    }

    emit([...state]);
  }
}
