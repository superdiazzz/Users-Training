import 'package:flutter/material.dart';


class ListTileUser extends StatelessWidget {
  final String image;
  final String name;
  ListTileUser({
    super.key,
    required this.image,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(image),
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
    );
  }
}
