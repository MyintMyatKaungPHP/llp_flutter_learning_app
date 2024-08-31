import 'package:flutter/material.dart';

class User {
  String name, message, image, time;
  int unseenCount;
  User(
      {required this.name,
      required this.message,
      required this.unseenCount,
      required this.image,
      required this.time});
}

List<User> users = [
  User(
      name: 'Aung Aung',
      message: 'ဘာလုပ်နေလဲ...',
      unseenCount: 5,
      time: '11:45 am',
      image:
          'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg'),
  User(
      name: 'Kyaw Kyaw',
      message: '၀ယ်ပြီးပြီလား...',
      unseenCount: 3,
      time: '10:00 pm',
      image:
          'https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.jpg'),
  User(
      name: 'Tun Tun',
      message: 'စားပြီးပြီလား...',
      unseenCount: 2,
      time: '1:30 am',
      image:
          'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=800'),
  User(
      name: 'Aye Aye',
      message: 'အားလုံးနေကောင်းကြပါတယ်...',
      unseenCount: 4,
      time: '2:45 am',
      image:
          'https://play-lh.googleusercontent.com/LeX880ebGwSM8Ai_zukSE83vLsyUEUePcPVsMJr2p8H3TUYwNg-2J_dVMdaVhfv1cHg'),
  User(
      name: 'James',
      message: 'Everything is going great...',
      unseenCount: 12,
      time: '6:15 pm',
      image:
          'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
];

class ListviewBuilderDemo extends StatelessWidget {
  const ListviewBuilderDemo({super.key});

  Widget buildUserChat(User users) {
    return Column(
      children: [
        ListTile(
            // leading: bd.Badge(
            //   badgeStyle: bd.BadgeStyle(
            //     badgeColor: Colors.green,
            //     shape: bd.BadgeShape.circle,
            //     padding: EdgeInsets.all(4)
            //   ),
            //   badgeContent: Text('${users.unseenCount}', style: TextStyle(color: Colors.white),),
            //   child: CircleAvatar(
            //     backgroundImage: NetworkImage(users.image),
            //   ),
            // ),
            leading: Badge(
              backgroundColor: Colors.green,
              textColor: Colors.white,
              label: Text('${users.unseenCount}', style: TextStyle(fontSize: 14),),
              child: CircleAvatar(
                backgroundImage: NetworkImage(users.image),
              ),
            ),
            title: Text(
              users.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(users.message),
            trailing: Text(users.time),
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return buildUserChat(users[index]);
        });
  }
}
