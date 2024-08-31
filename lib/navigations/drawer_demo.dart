import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Demo'),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Kyaw Kyaw'), 
                accountEmail: Text('kyawkyaw@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/miea.png'),
                ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/city.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ypi.gif'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/miea.png'),
                ),
              ],
            ),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting'),
                  ),
                  ListTile(
                    leading: Icon(Icons.password),
                    title: Text('Change Password'),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Forgot Password'),
                  ),

                ],
              ),
            )),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
