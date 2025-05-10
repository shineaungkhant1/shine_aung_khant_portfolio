import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _heroSectionKey = GlobalKey(); // Added GlobalKey

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.5, // Center alignment
      );

      Future.delayed(const Duration(milliseconds: 900), () {
        FocusScope.of(context).requestFocus(FocusNode());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: const Color(0xFF161B22),
        title: TextButton(
          onPressed: () => _scrollToSection(_heroSectionKey),
          child: const Text(
            "Shine Aung Khant",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textScaler: TextScaler.linear(1.5),
          ),
        ),
        actions: [
          _NavBarItem("About", () => _scrollToSection(_aboutKey)),
          _NavBarItem("Experience", () => _scrollToSection(_experienceKey)),
          _NavBarItem("Projects", () => _scrollToSection(_projectsKey)),
          _NavBarItem("Contact", () => _scrollToSection(_contactKey)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                key: _heroSectionKey, // Assign the key to HeroSection
                child: Center(child: HeroSection()),
              ),
              Container(
                key: _aboutKey,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: const Text(
                        "About Me",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildAboutContent(),
                  ],
                ),
              ),
              Container(
                key: _experienceKey,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Experience",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildExperienceContent(),
                  ],
                ),
              ),
              Container(
                key: _projectsKey,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Projects",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildProjectContent(),
                  ],
                ),
              ),
              Container(
                key: _contactKey,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildContactContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutContent() {
    return Center(
      child:  Text(
        "I'm Shine Aung Khant, a passionate Flutter developer with experience building high-performance "
        "mobile applications. With a background in Network Communication and hands-on development experience, "
        "I specialize in creating responsive, user-centric apps. My goal is to continue learning, innovating, "
        "and contributing to the tech world.",
        style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
        textScaler: TextScaler.linear(1.5),
      ),
    );
  }

  Widget _buildExperienceContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ExperienceItem(
          title: "Strategy First International College (03/2024 – Present)",
          details: [
            "Built SFUx Learning App with BLoC architecture, integrating features like social media logins and quizzes.",
            "Developed StrategyFirst Learn App with digital IDs, newsfeeds, and a campus wallet.",
            "Created Waso Learn KG-12, an educational app for KG-12 students with real-time updates.",
            "Designed Waso Lite for low-RAM devices to ensure performance optimization.",
            "Developed Putet Comics 2.0 to enhance the user experience for digital comic readers.",
          ],
        ),
        SizedBox(height: 16),
        _ExperienceItem(
          title: "Xlance Collective (09/2023 – 02/2024)",
          details: [
            "Created innovative apps, including a dating app and a Wordle game.",
            "Delivered high-quality Flutter applications in collaboration with cross-functional teams.",
            "Consistently exceeded expectations in delivering user-friendly experiences.",
          ],
        ),
        SizedBox(height: 16),
        _ExperienceItem(
          title: "Tee Htwin (05/2023 – 10/2023)",
          details: [
            "Collaborated with a team to build an app for buying, selling, and bidding on artwork.",
            "Focused on creating a user-friendly interface and seamless community interaction.",
          ],
        ),
      ],
    );
  }

  Widget _buildProjectContent() {
    return const Text(
      "• SFUx Learning App: A comprehensive app with features for social learning, quizzes, and certificates.\n"
      "• StrategyFirst Learn App: University-focused app with schedules, newsfeeds, and digital IDs.\n"
      "• Waso Learn KG-12: Educational app for KG-12 students with engaging modules and real-time updates.\n"
      "• Waso Lite: Lightweight educational app designed for low-end devices.\n"
      "• Putet Comics 2.0: Enhanced digital comics platform.\n"
      "• Art Community App: A platform for art enthusiasts to buy, sell, and explore artwork.",
      style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
    );
  }

  Widget _buildContactContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email: shineaungkhant1@gmail.com",
            style: TextStyle(color: Colors.cyanAccent, fontSize: 16)),
        Text("Phone: +959421068291",
            style: TextStyle(color: Colors.cyanAccent, fontSize: 16)),
        Text("GitHub: github.com/shineaungkhant1",
            style: TextStyle(color: Colors.cyanAccent, fontSize: 16)),
        Text("LinkedIn: linkedin.com/in/shine-aung-khant-008b75255",
            style: TextStyle(color: Colors.cyanAccent, fontSize: 16)),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/profile/profile.jpeg'),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello I am,",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textScaler: TextScaler.linear(0.5),
            ),
            const Text(
              "Shine Aung Khant",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textScaler: TextScaler.linear(1.5),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Flutter Developer",
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.cyanAccent,
                  ),
                ),
                TyperAnimatedText(
                  "Mobile App Developer (Flutter)",
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.cyanAccent,
                  ),
                ),
                TyperAnimatedText(
                  "Application Developer (Flutter)",
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.cyanAccent,
                  ),
                ),
              ],repeatForever: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(20))),
              onPressed: () async {
                await downloadFile('assets/cv/Shine-Aung-Khant-CV.pdf',
                    'Shine_Aung_Khant_CV.pdf');
              },
              child: const Text(
                "Download CV",
                style: TextStyle(color: Colors.white),
                textScaler: TextScaler.linear(1.2),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SocialButton(
                  icon: FontAwesomeIcons.github,
                  url: 'https://github.com/shineaungkhant1',
                ),
                SocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: 'https://www.linkedin.com/in/shine-aung-khant-008b75255/',
                ),
                SocialButton(
                  icon: Icons.email,
                  email: 'shineaungkhant1@gmail.com',
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(title, style: const TextStyle(color: Colors.white70)));
  }
}

class _ExperienceItem extends StatelessWidget {
  final String title;
  final List<String> details;

  const _ExperienceItem({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.cyanAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...details.map((detail) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text("- $detail",
                  style: const TextStyle(color: Colors.white70, fontSize: 16)),
            )),
      ],
    );
  }
}

Future<void> downloadFile(String assetPath, String fileName) async {
  // Load file from assets
  final ByteData byteData = await rootBundle.load(assetPath);
  final Uint8List fileBytes = byteData.buffer.asUint8List();

  if (kIsWeb) {
    // For Web platform
    final blob = html.Blob([fileBytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
    html.Url.revokeObjectUrl(url); // Clean up
    print(" I AM WORK 1");
  } else {
    // For non-web platforms
    final Directory tempDir = await getTemporaryDirectory();
    final File file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(fileBytes);
    print(" I AM WORK 2");

    // Open or share the file (platform-specific code)
    print('File saved at: ${file.path}');
  }
}


class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon, this.url, this.email});
  final IconData icon;
  final String? url;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (url != null) {
          // Launch URL for LinkedIn or GitHub
          if (await canLaunch(url!)) {
            await launch(url!);
          } else {
            throw 'Could not launch $url';
          }
        } else if (email != null) {
          // Open Gmail in compose mode with prefilled recipient email
          final String composeUrl =
              'https://mail.google.com/mail/u/0/?view=cm&fs=1&to=$email';
          if (await canLaunch(composeUrl)) {
            await launch(composeUrl);
          } else {
            throw 'Could not launch $composeUrl';
          }
        }
      },
      icon: FaIcon(icon),
      color: Colors.cyanAccent,
      iconSize: 28,
    );
  }
}
