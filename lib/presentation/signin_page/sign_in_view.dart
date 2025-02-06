import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie_application/presentation/resources/app_colores.dart';
import 'package:flutter_movie_application/presentation/sign_up_page/sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  // final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _passwordController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  Widget getContent() {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        minimum: EdgeInsets.only(
          top: 100,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildAppBar(),
            SizedBox(
              height: 20,
            ),
            _buildEmailField(),
            SizedBox(
              height: 20,
            ),
            _buildPasswordField(),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 10,
            ),
            _buildTextButton(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Text(
      'Sign In',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }


  Widget _buildTextButton() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignUpView());
              },
          ),
          
        ],
      ),
    );
  }
}
