import 'package:business_tracker/config/theme/bloc/theme_bloc.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_bloc.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_event.dart';
import 'package:business_tracker/features/auth/presentation/blocs/login/auth_state.dart'; // Import the state
import 'package:business_tracker/features/auth/presentation/pages/register_page.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  static const String routeName = 'authentication_page';
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final TextEditingController _usernameTextController =
      TextEditingController(text: 'username2');

  final TextEditingController _passwordTextController =
      TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.of(context).pushReplacementNamed(
                Dashboard.routeName,
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an Account?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _usernameTextController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'username1',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '**************',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_usernameTextController.text.isNotEmpty ||
                          _passwordTextController.text.isNotEmpty) {
                        context.read<AuthBloc>().add(
                              AuthSubmitted(
                                userIdentifier: _usernameTextController.text,
                                password: _passwordTextController.text,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 5,
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.login),
                    label: const Text('Google Login'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterPage.routeName);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).indicatorColor,
                    ),
                    child: const Text('New user? Register Now'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
