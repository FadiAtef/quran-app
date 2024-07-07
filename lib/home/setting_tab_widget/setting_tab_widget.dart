import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<SettingsProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mode Text
          Container(
            padding: EdgeInsets.only(left: 15),
            child: const Text(
              'Mode',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            padding: EdgeInsets.only(left: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: ListTile(
              title: Text(
                'Light',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
              trailing: DropdownButton<String>(
                // Use DropdownButton instead of ListTile's trailing
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 34,
                ),
                // Consider implementing onChanged callback with actual functionality
                onChanged: (value) {},
                underline: Container(), // Remove default underline
                items: [
                  DropdownMenuItem(
                    value: 'light',
                    child: Text(
                      'Light',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'dark',
                    child: Text(
                      'Dark',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: const Text(
              'Language',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            padding: const EdgeInsets.only(left: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: ListTile(
              title: Text(
                'English',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
              trailing: DropdownButton<String>(
                // Use DropdownButton instead of ListTile's trailing
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 34,
                ),

                onChanged: (value) {},
                underline: Container(), // Remove default underline
                items: [
                  DropdownMenuItem(
                    value: 'English',
                    child: Text(
                      'English',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Arabic', // Add additional options if needed
                    child: Text(
                      'Arabic',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
