import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:thrones_app/di/dependency_injection.dart';
import 'package:thrones_app/ui/blocs/authentication/authentication_bloc.dart';
import 'package:thrones_app/ui/design/theme.dart';
import 'package:thrones_app/ui/screens/characters/characters_screen.dart';
import 'package:thrones_app/ui/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const App());
}

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<AuthenticationBloc>()..add(const OnStarted()),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Thrones app',
        theme: appTheme(),
        home: Container(),
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.authStatus) {
                case AuthStatus.authenticated:
                  navigatorKey.currentState!.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const ItemsScreen()),
                    (route) => false,
                  );
                  break;
                case AuthStatus.unauthenticated:
                  navigatorKey.currentState!.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                  break;
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
