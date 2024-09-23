import 'package:dashboard/ForgotPasswordPage.dart';
import 'package:dashboard/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'DashboardPage.dart'; // Import the dashboard page
// Import the forgot password page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    _buildTextField(
                        'Email', false, _emailController, _emailValidator),
                    SizedBox(height: 16.0),
                    _buildTextField(
                        'Password', true, _passwordController, null),
                    SizedBox(height: 24.0),
                    _buildLoginButton(context),
                    SizedBox(height: 16.0),
                    _buildForgotPasswordButton(context),
                    SizedBox(height: 40.0),
                    _buildCreateAccountLink(context),
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

  Widget _buildTextField(String labelText, bool isPassword,
      TextEditingController controller, String? Function(String?)? validator) {
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
      validator: validator,
    );
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        }
      },
      child: Text('Log In'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Button background color
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

  Widget _buildForgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
        );
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildCreateAccountLink(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
        child: Text(
          'Create New Account',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
