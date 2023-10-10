import 'package:flutter/material.dart';
import 'package:flutter_taufiqb_siakad_app/pages/auth/auth_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const AuthPage();
        }));
      },
      child: Text('log out'),
    ));
  }
}
