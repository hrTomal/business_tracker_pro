import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: const [
            ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone),
              title: Text('Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
