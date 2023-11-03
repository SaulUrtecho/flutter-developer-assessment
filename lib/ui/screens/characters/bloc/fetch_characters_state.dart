part of 'fetch_characters_bloc.dart';

class FetchCharactersState extends Equatable {
  final AppStatus appStatus;
  final List<CharacterEntity> characters;
  const FetchCharactersState({required this.appStatus, required this.characters});

  @override
  List<Object> get props => [appStatus, characters];

  FetchCharactersState copyWith({AppStatus? appStatus, List<CharacterEntity>? characters}) {
    return FetchCharactersState(
      appStatus: appStatus ?? this.appStatus,
      characters: characters ?? this.characters,
    );
  }

  factory FetchCharactersState.initial() {
    return const FetchCharactersState(appStatus: AppStatus.loading, characters: []);
  }
}

enum AppStatus {
  loading,
  completed,
  failure,
}
