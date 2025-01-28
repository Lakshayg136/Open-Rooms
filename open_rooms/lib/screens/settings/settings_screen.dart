// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'package:open_rooms/resources/auth/auth_controller.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void logOut(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logout();
    Routemaster.of(context).push('/');
  }

  void navigateToEditProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/sign-up/$uid');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(
                color: Pallete.appbarColor, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Pallete.gradient3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/profile.png'),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      user!.name,
                                      style: TextStyle(
                                          color: Pallete.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      user!.batch,
                                      style: TextStyle(
                                          color: Pallete.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  ListTile(
                      title: const Text('Edit Profile'),
                      leading: const Icon(Icons.edit),
                      onTap: () => navigateToEditProfile(context, user.uid)),
                  ListTile(
                    title: const Text('Change Theme'),
                    leading: const Icon(Icons.brightness_6),
                    onTap: () {
                      // Implement theme toggle
                    },
                  ),
                  // SwitchListTile(
                  //   title: const Text('Enable Notifications'),
                  //   value: true, // Use your state for notifications
                  //   onChanged: (bool value) {
                  //     // Handle notification setting change
                  //   },
                  // ),
                  ListTile(
                    title: const Text('Notifications Settings'),
                    leading: const Icon(Icons.message),
                    onTap: () {
                      // Navigate to privacy settings screen
                    },
                  ),
                  ListTile(
                    title: const Text('Privacy Settings'),
                    leading: const Icon(Icons.lock),
                    onTap: () {
                      // Navigate to privacy settings screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: const Text('Log Out'),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () => logOut(context, ref),
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        )));
  }
}
