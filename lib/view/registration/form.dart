import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _fullName;
  String? _email;
  String? _phoneNumber;
  String? _position;
  String? _reason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _fullName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _email = value;
                },
              ),
              IntlPhoneField(
                flagsButtonPadding: const EdgeInsets.all(8),
                dropdownIconPosition: IconPosition.trailing,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'TN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Position'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Position';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _position = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'reason'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the reason why you want to participate';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _reason = value;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    print('Full Name: $_fullName');
                    print('Email: $_email');
                    print('Email: $_phoneNumber');
                    print('Email: $_position');
                    print('Email: $_reason');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
