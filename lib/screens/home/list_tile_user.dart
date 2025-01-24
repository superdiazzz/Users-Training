import 'package:flutter/material.dart';


class ListTileUser extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onpress;
  ListTileUser({
    super.key,
    required this.image,
    required this.name,
    required this.onpress
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onpress,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
              leading: image != '' ? CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(image),
              ): CircleAvatar(
                radius: 40,
                backgroundImage: const AssetImage("assets/images/profile.png"),
              ),
              title: Text(
                name,
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 16,),
            Divider(
              color: Colors.grey.shade300, // Light border color
              thickness: 1, // Thickness of the border
              height: 1, // Space taken by the Divider
            ),
          ],
        ),
      ),
    );
  }
}
