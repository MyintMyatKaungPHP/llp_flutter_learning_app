import 'package:flutter/material.dart';

class TextformfieldDemo extends StatefulWidget {
  const TextformfieldDemo({super.key});

  @override
  State<TextformfieldDemo> createState() => _TextformfieldDemoState();
}

class _TextformfieldDemoState extends State<TextformfieldDemo> {
  bool showPwd = true;
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 100,),
            CircleAvatar(
              radius: 60,
              child: Icon(Icons.account_circle,size: 100,),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: mailController,
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return 'Email required!';
                }else if (!value.contains('@gmail.com')){
                  return 'Please enter valid mail!';
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                label: Text('Email'),
                hintText: 'Eneter your email',
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return 'Password required!';
                }else if (value.length < 8){
                  return 'Passwrod must have at least 8 characters!';
                }else{
                  return null;
                }
              },
              obscureText: showPwd,
              decoration: InputDecoration(
                label: Text('Password'),
                hintText: 'Eneter your password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: showPwd ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      showPwd = !showPwd;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  shadowColor: Colors.black,
                  elevation: 5,
              ),
              onPressed: (){
                  if(formKey.currentState!.validate()){
                    showSnackBar('All data are validate');
                  }
              },
              child: Text('Sign In',style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
