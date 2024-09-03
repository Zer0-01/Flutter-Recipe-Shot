import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/09/16/08/55/online-942406_960_720.jpg'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('User Name'),
            const Text('User Id'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
