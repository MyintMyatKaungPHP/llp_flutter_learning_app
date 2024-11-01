import 'package:flutter/material.dart';

class KeyExample extends StatefulWidget {
  const KeyExample({super.key});

  @override
  State<KeyExample> createState() => _KeyExampleState();
}

class _KeyExampleState extends State<KeyExample> {
  //globalkeys are used in stateful widgets
  //declare a global key and depending on the need of use
  //add the proper T argument
  //for our case we need a Formstate
  //Others include FormFieldState etc
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        //assign the globalkey to the key value of the form widget
        key: formKey,
        child: ListView(
          children: [
            TextFormField(
              validator: ((value) {
                if (value == null) {
                  return 'Invalid value';
                }
                if (value.isEmpty) {
                  return 'Empty value';
                }
                return null;
              }),
            ),
            TextFormField(
              validator: ((value) {
                if (value == null) {
                  return 'Invalid value';
                }
                if (value.isEmpty) {
                  return 'Empty value';
                }
                return null;
              }),
            ),
            TextButton(
                onPressed: () {
                  //access the Form widgets variables and functions
                  //in this case we use the validate() method
                  if (!formKey.currentState!.validate()) {
                    print('error in the form');
                    return;
                  }
                },
                child: Text('Validate'))
          ],
        ),
      ),
    ));
  }
}
