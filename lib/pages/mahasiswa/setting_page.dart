import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taufiqb_siakad_app/bloc/logout/logout_bloc.dart';
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
        child: BlocProvider(
      create: (context) => LogoutBloc(),
      child: BlocConsumer<LogoutBloc, LogoutState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              loaded: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return AuthPage();
                }));
              },
              error: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Logout error')));
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return ElevatedButton(
                  onPressed: () {
                    context.read<LogoutBloc>().add(LogoutEvent.logout());
                  },
                  child: Text('log out'));
            },
          );
        },
      ),
    ));
  }
}
/* Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const AuthPage();
                      })); */
