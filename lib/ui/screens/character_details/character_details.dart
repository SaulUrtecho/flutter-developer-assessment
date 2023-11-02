import 'package:flutter/material.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';
import 'package:thrones_app/ui/design/profile_avatar.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character details'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 250,
            color: Theme.of(context).primaryColor,
            child: ProfileAvatar(character: character, radius: 100),
          ),
          const Spacer(),
          Text('Id: ${character.id}', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          Text('First Name: ${character.firstName}', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          Text('Last Name: ${character.lastName}', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          Text('Title: ${character.title}', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          Text('Family: ${character.family}', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          Text('Image: ${character.image}', style: const TextStyle(fontSize: 20)),
          const Spacer(),
          SizedBox(
            height: 40,
            width: 250,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Back'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
