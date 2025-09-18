import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final schoolNameController = TextEditingController();
  final districtController = TextEditingController();
  final classCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final violet = Color(0xFF6A1B9A);
    final orange = Color(0xFFF57C00);

    return Scaffold(
      appBar: AppBar(title: Text('Register School'), backgroundColor: orange),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: schoolNameController,
                decoration: InputDecoration(
                  labelText: 'School Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter school name' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder(),
                ),
                // You can add dropdown for district instead
                validator: (value) =>
                    value == null || value.isEmpty ? 'Select district' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: classCountController,
                decoration: InputDecoration(
                  labelText: 'Number of Classes (5-10)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || int.tryParse(value) == null
                    ? 'Enter valid number'
                    : null,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Register', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Registration logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration submitted')),
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
