part of 'fetch_characters_bloc.dart';

abstract class FetchCharactersEvent extends Equatable {
  const FetchCharactersEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacters extends FetchCharactersEvent {
  const LoadCharacters();

  @override
  String toString() => 'LoadCharacters';
}
