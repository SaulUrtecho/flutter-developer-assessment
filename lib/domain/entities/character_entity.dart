import 'package:equatable/equatable.dart';
import 'package:thrones_app/data/models/character_model.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;

  const CharacterEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl,
  });

  String get fullName => firstName != null && lastName != null ? '$firstName $lastName' : '';

  @override
  List<Object?> get props => [id, firstName, lastName, title, family, image, imageUrl];

  factory CharacterEntity.fromModel(CharacterModel model) {
    return CharacterEntity(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
      title: model.title,
      family: model.family,
      image: model.image,
      imageUrl: model.imageUrl,
    );
  }
}
