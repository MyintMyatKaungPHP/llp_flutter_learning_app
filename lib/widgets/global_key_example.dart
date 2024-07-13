import 'package:flutter/material.dart';

class GlobalKeyExample extends StatefulWidget {
  const GlobalKeyExample({super.key});

  @override
  State<GlobalKeyExample> createState() => _GlobalKeyExampleState();
}

class _GlobalKeyExampleState extends State<GlobalKeyExample> {
  final GlobalKey<FormFieldState<String>> _passwordKey =
      GlobalKey<FormFieldState<String>>();

  //nullable
  String? _name;
  String? _phoneNumber;
  String? _email;
  String? _password;

  //validator function or method
  String? _validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Name is required.';
    }

    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value!)) {
      return 'Please enter only alphabetical characters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),
            //"name" form
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              onSaved: (String? value) {
                _name = value;
                print('name=$_name');
              },
              validator: _validateName,
            ),
          ],
        ),
      ),
    );
  }
}
