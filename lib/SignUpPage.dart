import 'package:dashboard/DashboardPage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green.withOpacity(0.2),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _getHorizontalPadding(context)),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 80.0),
                    _buildLogo(),
                    SizedBox(height: 48.0),
                    _buildTextField('Name', false, _nameController),
                    SizedBox(height: 16.0),
                    _buildTextField('Email', false, _emailController),
                    SizedBox(height: 16.0),
                    _buildTextField('Password', true, _passwordController),
                    SizedBox(height: 24.0),
                    _buildSignUpButton(context),
                    SizedBox(height: 40.0),
                    _buildLoginLink(context),
                  ],
                ),
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

  Widget _buildTextField(
      String labelText, bool isPassword, TextEditingController controller) {
    return TextFormField(
      controller: controller,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $labelText';
        }
        if (labelText == 'Email' &&
            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        }
      },
      child: Text('Sign Up'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white, // Text color
        padding: EdgeInsets.symmetric(vertical: 16.0),
        textStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5.0,
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to the login page
        },
        child: Text(
          'Already have an account? Log In',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
