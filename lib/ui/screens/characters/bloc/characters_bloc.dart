import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';
import 'package:thrones_app/domain/use_cases/get_characters_use_case.dart';

part 'characters_event.dart';
part 'characters_state.dart';

// This is the bloc for get all the characters and based
// in the method's result the state is change through the copyWith
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUseCase _getCharactersUseCase;
  CharactersBloc(this._getCharactersUseCase) : super(CharactersState.initial()) {
    on<LoadCharacters>(_loadCharacters);
  }

  Future<void> _loadCharacters(LoadCharacters event, Emitter<CharactersState> emit) async {
    final response = await _getCharactersUseCase.run();
    if (response.isRight) {
      emit(state.copyWith(appStatus: AppStatus.completed, characters: response.right));
    } else {
      emit(state.copyWith(appStatus: AppStatus.failure));
    }
  }
}
