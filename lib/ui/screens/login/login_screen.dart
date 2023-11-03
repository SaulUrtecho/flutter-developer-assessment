import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrones_app/ui/blocs/authentication/authentication_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Thrones app')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 5),
                  height: 250,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/img/got.jpg'))),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: 'Enter your name'),
                  validator: (value) {
                    final text = value ?? '';
                    if (text.isEmpty) {
                      return 'please enter your name';
                    } else if (text.length > 15) {
                      return 'The name cannot be longer than 15 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), hintText: 'Enter your password'),
                  validator: (value) {
                    final text = value ?? '';
                    if (text.isEmpty) {
                      return 'please enter your password';
                    } else if (text.length > 8) {
                      return 'The password cannot be longer than 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 100),
                SizedBox(
                  height: 55,
                  width: 360,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthenticationBloc>().add(const Login());
                      }
                    },
                    style: ElevatedButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
                    child: const Text('Log in'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
