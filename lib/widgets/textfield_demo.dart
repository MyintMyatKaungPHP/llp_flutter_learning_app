import 'package:flutter/material.dart';

class TextfieldDemo extends StatefulWidget {
  const TextfieldDemo({super.key});

  @override
  State<TextfieldDemo> createState() => _TextfieldDemoState();
}

class _TextfieldDemoState extends State<TextfieldDemo> {
  bool showPwd = true;
  var mailController = TextEditingController();
  var passwordController = TextEditingController();

  void showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
  FocusScopeNode focusScopeNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            if(!focusScopeNode.hasPrimaryFocus){
              focusScopeNode.unfocus();
            }
          },
          child: Column(
            children: [
              Icon(Icons.account_circle,size: 100,),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  label: Text('Name'),
                  icon: Icon(Icons.person),
                  helperText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person),
                  helperText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  label: Text('Name'),
                  suffixIcon: Icon(Icons.person),
                  helperText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: mailController,
                decoration: InputDecoration(
                  label: Text('Email'),
                  icon: Icon(Icons.mail),
                  helperText: 'Enter your email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value){
                  showSnackBar('on change: $value');
                },
                onSubmitted: (String value){
                  showSnackBar('on submitted: $value');
                },
              ),
              SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  label: Text('Password'),
                  icon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: showPwd ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          showPwd = !showPwd;
                        });
                      },
                  ),
                  helperText: 'Enter password',
                ),
                keyboardType: TextInputType.text,
                obscureText: showPwd,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  ),
                  onPressed: (){
                    String mail = mailController.text;
                    String pwd = passwordController.text;
                    if(mail == 'user@gmail.com' && pwd == '12345'){
                      showSnackBar('Login Successful');
                    }else{
                      mailController.clear();
                      passwordController.clear();
                      showSnackBar('Login Failed');
                    }
                  },
                  child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
