import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Account'),
              onTap: () {
                // Handle account settings
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                // Handle notification settings
              },
            ),
            ListTile(
              title: Text('Privacy'),
              onTap: () {
                // Handle privacy settings
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Handle about settings
              },
            ),
          ],
        ),
      ),
    );
  }
}
