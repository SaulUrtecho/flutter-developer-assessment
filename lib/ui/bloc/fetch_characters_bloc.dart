import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';
import 'package:thrones_app/domain/use_cases/get_characters_use_case.dart';

part 'fetch_characters_event.dart';
part 'fetch_characters_state.dart';

class FetchCharactersBloc extends Bloc<FetchCharactersEvent, FetchCharactersState> {
  final GetCharactersUseCase _getCharactersUseCase;
  FetchCharactersBloc(this._getCharactersUseCase) : super(FetchCharactersState.initial()) {
    on<LoadCharacters>(_loadCharacters);
  }

  Future<void> _loadCharacters(LoadCharacters event, Emitter<FetchCharactersState> emit) async {
    final response = await _getCharactersUseCase.run();
    if (response.isRight) {
      emit(state.copyWith(appStatus: AppStatus.completed, characters: response.right));
    } else {
      emit(state.copyWith(appStatus: AppStatus.failure));
    }
  }
}
