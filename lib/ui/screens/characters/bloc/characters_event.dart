part of 'characters_bloc.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class LoadCharacters extends CharactersEvent {
  const LoadCharacters();

  @override
  String toString() => 'LoadCharacters';
}
