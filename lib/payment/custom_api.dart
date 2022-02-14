import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  CustomAppBar({
    required this.title,
    required this.backgroundColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        // "Add Your Location Here",
        title,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
      ),
      leading: const Icon(
        Icons.add_location,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreenDrawer()));
                  })),
        ),
      ],
    );
  }
}
