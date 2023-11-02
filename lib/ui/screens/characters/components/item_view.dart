import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrones_app/ui/bloc/fetch_characters_bloc.dart';
import 'package:thrones_app/ui/design/body_builder.dart';
import 'package:thrones_app/ui/screens/characters/components/character_card.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game of throne characters')),
      body: BlocBuilder<FetchCharactersBloc, FetchCharactersState>(
        builder: (context, state) {
          return BodyBuilder(
            appStatus: state.appStatus,
            onCompleted: (context) {
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (_, index) => CharacterCard(character: state.characters[index]),
              );
            },
          );
        },
      ),
    );
  }
}
