import 'package:flutter/material.dart';
import '../app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;

  Widget settingsTile({
    required IconData icon,
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(
        onTap: onTap,

        leading: Container(
          height: 42,
          width: 42,

          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Icon(
            icon,
            color: AppColors.blue,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.navy,
          ),
        ),

        trailing: trailing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.navy,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          const Text(
            'GENERAL SETTINGS',
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 18),

          settingsTile(
            icon: Icons.notifications_outlined,
            title: 'Notifications',

            trailing: Switch(
              value: notifications,

              activeThumbColor: AppColors.blue,

              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          settingsTile(
            icon: Icons.dark_mode_outlined,
            title: 'Dark Mode',

            trailing: Switch(
              value: darkMode,

              activeThumbColor: AppColors.blue,

              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Dark mode preference changed (demo only).',
                    ),
                  ),
                );
              },
            ),
          ),

          settingsTile(
            icon: Icons.language_outlined,
            title: 'Language',

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.grey,
            ),

            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Language selection coming soon.'),
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          const Text(
            'ABOUT APPLICATION',
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 18),

          settingsTile(
            icon: Icons.info_outline,
            title: 'About DocuScan',

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.grey,
            ),

            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'DocuScan',
                applicationVersion: '1.0.0',
                applicationLegalese:
                'A simple document scanning application.',
              );
            },
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              'DocuScan Version 1.0.0',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}