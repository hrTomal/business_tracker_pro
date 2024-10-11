import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_bloc.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_event.dart';
import 'package:business_tracker/features/auth/presentation/blocs/register/register_state.dart';
import 'package:business_tracker/features/auth/presentation/pages/auth_page.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = 'register_page';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userNameController =
      TextEditingController(text: 'userName1');
  final TextEditingController _firstNameController =
      TextEditingController(text: 'f Name');
  final TextEditingController _lastNameController =
      TextEditingController(text: 'L Name');
  final TextEditingController _emailController =
      TextEditingController(text: 'email@email.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '1');
  final TextEditingController _retypePasswordController =
      TextEditingController(text: '1');

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dimensions = AppDimensions(context);
    double gap = 10;
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
          } else if (state is RegisterFailure) {
          } else if (state is RegisterLoading) {}
        },
        child: SafeArea(
          child: Scaffold(
            // appBar: const CustomAppBar(
            //   title: 'Register',
            // ),

            body: Padding(
              padding: dimensions.pagePaddingGlobal,
              child: Center(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: const Text(
                          'You are making life simple...',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildTextField(_userNameController, 'User Name'),
                      SizedBox(height: gap),
                      _buildTextField(_firstNameController, 'First Name'),
                      SizedBox(height: gap),
                      _buildTextField(_lastNameController, 'Last Name'),
                      SizedBox(height: gap),
                      _buildTextField(_emailController, 'Email',
                          hintText: 'example@email.com'),
                      SizedBox(height: gap),
                      _buildTextField(_passwordController, 'Password',
                          obscureText: true),
                      SizedBox(height: gap),
                      _buildTextField(
                          _retypePasswordController, 'Retype Password',
                          obscureText: true),
                      SizedBox(height: gap),
                      CustomButtonPrimary(
                        text: 'Register',
                        // height: pageHeight,
                        // width: pageWidth,
                        onPressed: () {
                          // Navigator.of(context).pushNamed(Dashboard.routeName);
                          if (_passwordController.text ==
                              _retypePasswordController.text) {
                            context.read<RegisterBloc>().add(RegisterSubmitted(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  userName: _userNameController.text,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                ));
                          } else {
                            print('Error');
                          }
                        },
                      ),
                      SizedBox(height: gap),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AuthenticationPage.routeName);
                            },
                            child: const Text('Back To Login'),
                          ),
                          const VerticalDivider(
                            width: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Google login'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField _buildTextField(TextEditingController controller, String labelText,
      {bool obscureText = false, String? hintText}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
