import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrones_app/ui/blocs/authentication/authentication_bloc.dart';
import 'package:thrones_app/ui/screens/characters/bloc/characters_bloc.dart';
import 'package:thrones_app/ui/screens/characters/components/character_card.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of throne characters'),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthenticationBloc>().add(const Logout()),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          switch (state.appStatus) {
            case AppStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case AppStatus.failure:
              return const Center(child: Text('Error loading characters'));
            case AppStatus.completed:
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (_, index) => CharacterCard(character: state.characters[index]),
              );
          }
        },
      ),
    );
  }
}
