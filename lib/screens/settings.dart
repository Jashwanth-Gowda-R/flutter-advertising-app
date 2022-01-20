import 'package:adlisting/screens/my-ads.dart';
import 'package:adlisting/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Sundaravel"),
            subtitle: Text("+919876543210"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://appmaking.co/wp-content/uploads/2021/08/sundar-grey-bg-300x300.png"),
            ),
            trailing: TextButton(
              onPressed: () {
                Get.to(ProfileScreen());
              },
              child: Text("Edit"),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(MyAdsScreen());
            },
            title: Text("My Ads"),
            leading: Icon(Icons.post_add),
          ),
          ListTile(
            title: Text("About us"),
            leading: Icon(Icons.person_outline_outlined),
          ),
          ListTile(
              title: Text("Contact Us"), leading: Icon(Icons.contacts_outlined))
        ],
      ),
    );
  }
}
