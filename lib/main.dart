import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117), // Dark background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF161B22),
        elevation: 0,
        title: const Text(
          "Portfolio.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          _NavBarItem("Home"),
          _NavBarItem("About"),
          _NavBarItem("Skills"),
          _NavBarItem("Portfolio"),
          _NavBarItem("Contact"),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF161B22),
            Color(0xFF0D1117),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Profile Picture and Glowing Hexagon
          Stack(
            alignment: Alignment.center,
            children: [
              // Glowing Hexagon Background
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.cyan.withOpacity(0.2),
                      Colors.transparent,
                    ],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
              // Hexagon Shape for Profile Image
              ClipPath(
                clipper: HexagonClipper(),
                child: Container(
                  height: 130,
                  width: 130,
                  color: Colors.blueAccent,
                  child: Image.asset(
                    'assets/profile/profile.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Hello, It's Me",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Shine Aung Khant",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "And I'm a Flutter Developer",
            style: TextStyle(
              fontSize: 20,
              color: Colors.cyanAccent,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Passionate Flutter developer specializing in building stunning, modern applications "
                "with responsive designs and high performance.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(
                icon: FontAwesomeIcons.github,
                url: 'https://github.com/shineaungkhant1',
              ),
              _SocialButton(
                icon: FontAwesomeIcons.linkedin,
                url: 'https://www.linkedin.com/in/shine-aung-khant-008b75255/',
              ),
              _SocialButton(
                icon: Icons.email,
                email: 'shineaungkhant1@gmail.com',
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add CV download logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyanAccent,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Download CV",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;

  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String? url;
  final String? email;

  const _SocialButton({required this.icon, this.url, this.email});

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



class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final double edge = width / 2;

    return Path()
      ..moveTo(width * 0.5, 0)
      ..lineTo(width, height * 0.25)
      ..lineTo(width, height * 0.75)
      ..lineTo(width * 0.5, height)
      ..lineTo(0, height * 0.75)
      ..lineTo(0, height * 0.25)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
