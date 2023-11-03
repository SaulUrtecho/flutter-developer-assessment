/*  This is the Character model where all the API properties are placed
 and transform them in a CharacterModel */
class CharacterModel {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;

  const CharacterModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      title: json['title'],
      family: json['family'],
      image: json['image'],
      imageUrl: json['imageUrl'],
    );
  }
}
