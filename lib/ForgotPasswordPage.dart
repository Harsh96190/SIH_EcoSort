import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with green color and 20% transparency
          Container(
            color: Colors.green.withOpacity(0.2),
          ),
          // Foreground content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _getHorizontalPadding(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 80.0),
                  _buildLogo(),
                  SizedBox(height: 48.0),
                  _buildTextField('Email', false),
                  SizedBox(height: 24.0),
                  _buildResetPasswordButton(context),
                  SizedBox(height: 40.0),
                  _buildBackToLoginLink(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getHorizontalPadding(BuildContext context) {
    return MediaQuery.of(context).size.width > 600 ? 48.0 : 24.0;
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Icon(
          Icons.eco,
          color: Colors.green,
          size: 80.0,
        ),
        SizedBox(height: 16.0),
        Text(
          'EcoSort',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String labelText, bool isPassword) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.green.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildResetPasswordButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle reset password logic here
      },
      child: Text('Reset Password'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        textStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5.0,
      ),
    );
  }

  Widget _buildBackToLoginLink(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context); // Go back to the previous page (login page)
        },
        child: Text(
          'Back to Log In',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
