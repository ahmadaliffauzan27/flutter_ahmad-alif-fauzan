import 'package:flutter/material.dart';

class Profile {
  String name;
  String phoneNumber;
  String profilePhoto;

  Profile(this.name, this.phoneNumber, this.profilePhoto);
}

List<Profile> profiles = [
  Profile('Ahmad Alif Fauzan', '08123456789', 'assets/profile.png'),
  Profile('Rouf Majidin', '08234567890', 'assets/profile.png'),
  Profile('Hafidz Surya Ramadhan', '08345678901', 'assets/profile.png'),
  Profile('Fajar Gema Ramadhan', '08456789012', 'assets/profile.png'),
  Profile('Mochamad Nurul Adzan', '08456789012', 'assets/profile.png'),
  Profile('Faturrochman JatiKusuma', '08456789012', 'assets/profile.png'),
  Profile('Iko Vicky Pratama', '08456789012', 'assets/profile.png'),
  Profile('Fernand Jerico', '08456789012', 'assets/profile.png'),
  Profile('Susanto Abdurrochman', '08456789012', 'assets/profile.png'),
  Profile('Melky Abraham', '08456789012', 'assets/profile.png'),
  Profile('Jeny Lawrenyansi', '08456789012', 'assets/profile.png'),
  Profile('Fareel Mukhlisin', '08456789012', 'assets/profile.png'),
];

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          title: Text(
            profiles[index].name,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            profiles[index].phoneNumber,
            style: const TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }
}
