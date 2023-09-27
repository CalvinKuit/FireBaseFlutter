import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  Map<String, bool> interests = {
    'Academics': false,
    'Extracurricular Activities': false,
    'Hobbies and Creative Pursuits': false,
    'Technology and Gaming': false,
    'Outdoor Activities': false,
    'Cultural and Social Interests': false,
    'Health and Wellness': false,
    'Entrepreneurship and Business': false,
    'Science and Innovation': false,
    'Personal Development': false,
  };
  String? _selectedCommunity;

  String? _selectedRole; // New state variable for storing selected role
  final List<String> roles = ['Student', 'Tutor', 'Student & Tutor'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Register', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0, // Remove shadow
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(label: 'Name'),
                SizedBox(height: 20.0),
                _buildTextField(label: 'Email'),
                SizedBox(height: 20.0),
                _buildTextField(label: 'Password', isPassword: true),
                SizedBox(height: 20.0),

                //dropdown button
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  value: _selectedRole,
                  items: roles.map((String role) {
                    return DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRole = newValue;
                    });
                  },
                  decoration: InputDecoration(labelText: 'User Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your user type';
                    }
                    return null;
                  },
                ),

                Text(
                  'Select Interests',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                ..._buildInterestCheckboxes(),
                SizedBox(height: 20.0),
                _buildDropdownField(
                  label: 'Communities',
                  items: [
                    'Academic Clubs and Societies',
                    'Student Government',
                    'Sports Teams and Athletics',
                    'Arts and Creative Clubs',
                    'Cultural and International Student Associations',
                    'Volunteer and Service Organizations',
                    'Entrepreneurship and Start-up Networks',
                    'Outdoor and Adventure Groups',
                    'Social Justice and Advocacy Groups',
                    'Wellness and Mental Health Support Groups'
                  ],
                  selectedValue: _selectedCommunity,
                  onChanged: (value) {
                    setState(() {
                      _selectedCommunity = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),

                _buildTextField(label: 'Bio', maxLines: 4),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Register'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform register action
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                    onPrimary: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextField(
      {required String label, int maxLines = 1, bool isPassword = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
      maxLines: maxLines,
      obscureText: isPassword,
    );
  }

  List<Widget> _buildInterestCheckboxes() {
    return interests.keys.map((interest) {
      return CheckboxListTile(
        title: Text(interest),
        value: interests[interest],
        onChanged: (bool? value) {
          setState(() {
            interests[interest] = value!;
          });
        },
      );
    }).toList();
  }

  DropdownButtonFormField<String> _buildDropdownField({
    required String label,
    required List<String> items,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
      ),
      value: selectedValue,
      items: items.map((item) {
        return DropdownMenuItem(
          child: Text(item),
          value: item,
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
