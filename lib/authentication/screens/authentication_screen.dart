import 'package:flutter/material.dart';
import 'package:wayanad_gate/widgets/common_widgets/custom_button.dart';
import 'package:wayanad_gate/widgets/common_widgets/input_field.dart';
import 'package:wayanad_gate/authentication/services/auth_service.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InputField(
              controller: _emailController,
              labelText: 'Email',
            ),
            InputField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              text: 'Log In',
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                String? errorMessage = await _authService
                    .signInWithEmailAndPassword(email, password);
                if (errorMessage == null) {
                  // Authentication successful, navigate to the next screen
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorMessage)),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
