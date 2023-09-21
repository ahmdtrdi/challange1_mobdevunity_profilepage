import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:mobiledev_flutter_1/view/day2_page.dart';
//import 'package:mobiledev_flutter_1/view/day3_page.dart';
//import 'package:mobiledev_flutter_1/view/profile_page.dart';
import 'package:mobiledev_flutter_1/model/usermodels.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledev_flutter_1/stuff/iconmeasure.dart';
import 'package:mobiledev_flutter_1/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
      minimumSize: Size(327, 50),
      backgroundColor: Color.fromARGB(255, 4, 45, 78),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))));
  Future<Data> getUserData() async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users/2'),
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Data pengguna = UserModel.fromJson(body).data;
      return pengguna;
    } else {
      throw 'error';
    }
  }

  late Future<Data> user;

  //futurewidget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: ListView(
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(children: [
        const SizedBox(height: 20),
        Text(
          'Triadi M',
          style: poppinsTextStyle,
        ),
        const SizedBox(height: 5),
        Text(
          'Anak MobDev anjayy',
          style: TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 127, 127, 127)),
        ),
        const SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: logoLocate),
                Container(
                    margin: const EdgeInsets.only(right: 185),
                    child: const Text('Manado, Sulawesi Utara',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 127, 127, 127)))),
              ],
            ),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.only(right: 10), child: logoUni),
              Container(
                  margin: const EdgeInsets.only(right: 165),
                  child: Text('Universitas Sam Ratulangi',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 127, 127, 127)))),
            ]),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.only(right: 8), child: logoCerti),
              Container(
                  margin: const EdgeInsets.only(right: 140),
                  child: Text('Bachelor of Computer Science',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 127, 127, 127))))
            ]),
          ],
        ),
        Divider(),
        const SizedBox(
          height: 16,
          width: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialIcon(
                FontAwesomeIcons.discord, Color.fromARGB(255, 4, 45, 78)),
            const SizedBox(height: 10, width: 13),
            buildSocialIcon(
                FontAwesomeIcons.github, Color.fromARGB(255, 4, 45, 78)),
            const SizedBox(height: 10, width: 13),
            buildSocialIcon(
                FontAwesomeIcons.twitter, Color.fromARGB(255, 4, 45, 78)),
            const SizedBox(height: 10, width: 13),
            buildSocialIcon(
                FontAwesomeIcons.linkedin, Color.fromARGB(255, 4, 45, 78)),
          ],
        ),
        Divider(),
        const SizedBox(
          height: 16,
          width: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                'About',
                style: titleTextStyle,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: SafeArea(
                child: Text(
                  'Creative and Passionate IT student. Eager to expand his skills in Bussines and tech programming by joining UNITY and learning from various mentors. Expertise in team management, programming, and leading ongoing projects.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 35),
        Column(
          children: [
            ElevatedButton(
                style: buttonPrimary,
                onPressed: () {},
                child: Text(
                  'Contact Me',
                  style: poppinsTextStyle2,
                ))
          ],
        ),
        const SizedBox(height: 20)
      ]);

  Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.asset(
        'lib/Logo/giff.gif',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ));

  Widget buildProfileImage() => SafeArea(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 76,
          child: Container(
            child: CircleAvatar(
              radius: profileHeight / 2,
              backgroundColor: Colors.grey.shade800,
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/media/F6i837JboAARE9u?format=jpg&name=4096x4096'),
            ),
          ),
        ),
      );

  Widget buildSocialIcon(IconData icon, Color) => CircleAvatar(
        radius: 30,
        child: Center(child: Icon(icon, size: 32)),
      );
}
