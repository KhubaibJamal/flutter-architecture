import 'package:architecture/user_json.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserJson user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(user.name),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(user.name[0]),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email),
            Text(user.phone),
            Text(user.website),
          ],
        ),
      ),
    );
  }
}
