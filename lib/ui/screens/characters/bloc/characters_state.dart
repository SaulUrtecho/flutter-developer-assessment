part of 'characters_bloc.dart';

class CharactersState extends Equatable {
  final AppStatus appStatus;
  final List<CharacterEntity> characters;
  const CharactersState({required this.appStatus, required this.characters});

  @override
  List<Object> get props => [appStatus, characters];

  CharactersState copyWith({AppStatus? appStatus, List<CharacterEntity>? characters}) {
    return CharactersState(
      appStatus: appStatus ?? this.appStatus,
      characters: characters ?? this.characters,
    );
  }

  factory CharactersState.initial() {
    return const CharactersState(appStatus: AppStatus.loading, characters: []);
  }
}

enum AppStatus {
  loading,
  completed,
  failure,
}
