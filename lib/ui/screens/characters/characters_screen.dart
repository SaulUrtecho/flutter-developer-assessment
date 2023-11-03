import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:thrones_app/ui/screens/characters/bloc/characters_bloc.dart';
import 'package:thrones_app/ui/screens/characters/components/characters_view.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharactersBloc>()..add(const LoadCharacters()),
      child: const CharactersView(),
    );
  }
}
