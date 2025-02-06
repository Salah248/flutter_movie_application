import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_application/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie_application/presentation/resources/app_colores.dart';
import 'package:flutter_movie_application/presentation/signin_page/sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignUpView> {

  final TextEditingController _emailController = TextEditingController();

   final TextEditingController _passwordController = TextEditingController();

  
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
      'Sign Up',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
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
            text: 'Do have an account?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: ' Sign In',
            style: TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignInView());
              },
          ),
          
        ],
      ),
    );
  }
}