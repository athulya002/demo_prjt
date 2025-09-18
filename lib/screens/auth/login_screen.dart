import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  final List<String> roles = ['RDD', 'Principal', 'Teacher'];

  @override
  Widget build(BuildContext context) {
    final violet = Color(0xFF6A1B9A);
    final orange = Color(0xFFF57C00);

    return Scaffold(
      appBar: AppBar(title: Text('Login'), backgroundColor: orange),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedRole,
                hint: Text('Select User Role'),
                items: roles
                    .map(
                      (role) =>
                          DropdownMenuItem(value: role, child: Text(role)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => selectedRole = value!),
                validator: (value) =>
                    value == null ? 'Please select role' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter email';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                    return 'Invalid email';
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        setState(() => obscurePassword = !obscurePassword),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter password' : null,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Login', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle login, for now just show message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged in as $selectedRole')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
