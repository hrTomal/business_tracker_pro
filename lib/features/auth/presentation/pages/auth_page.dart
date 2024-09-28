import 'package:business_tracker/features/auth/presentation/pages/register_page.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_buttons.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  static const String routeName = 'authentication_page';
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Center(
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
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'example@email.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
              // CustomButtonPrimary(
              //   text: '',
              //   height: pageHeight,
              //   width: pageWidth,
              //   onPressed: () {
              //     Navigator.of(context).pushNamed(Dashboard.routeName);
              //   },
              // ),
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
    ));
  }
}
