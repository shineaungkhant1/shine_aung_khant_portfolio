import 'package:flutter/material.dart';

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
                    'assets/profile_image.png', // Replace with your image
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
              _SocialButton(icon: Icons.facebook),
              _SocialButton(icon: Icons.facebook),
              _SocialButton(icon: Icons.facebook),
              _SocialButton(icon: Icons.facebook),
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

  const _SocialButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Add social media link logic
      },
      icon: Icon(icon),
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



// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyPortfolio());
// }
//
// class MyPortfolio extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: PortfolioScreen(),
//     );
//   }
// }
//
// class PortfolioScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.black, Colors.teal.shade900],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Column(
//             children: [
//               // Navigation Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Portfolio.",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         NavBarItem(title: "Home"),
//                         NavBarItem(title: "About"),
//                         NavBarItem(title: "Skills"),
//                         NavBarItem(title: "Portfolio"),
//                         NavBarItem(title: "Contact"),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               // Main Content
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Left Section
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Hello, It's Me",
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   color: Colors.white70,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 "John Kendric",
//                                 style: TextStyle(
//                                   fontSize: 48,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                 "And I'm a Frontend Developer",
//                                 style: TextStyle(
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.tealAccent,
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//                               Text(
//                                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Posimus nulla sed saepe rerum, animi expedita.",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white70,
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//                               // Social Icons and Button
//                               Row(
//                                 children: [
//                                   SocialIcon(icon: Icons.facebook),
//                                   SocialIcon(icon: Icons.facebook),
//                                   SocialIcon(icon: Icons.facebook),
//                                   SocialIcon(icon: Icons.email),
//                                 ],
//                               ),
//                               SizedBox(height: 20),
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.tealAccent,
//                                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   // Add your CV download logic here
//                                 },
//                                 child: Text(
//                                   "Download CV",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         // Right Section - Profile Image
//                         Expanded(
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 gradient: RadialGradient(
//                                   colors: [Colors.tealAccent, Colors.black],
//                                   radius: 1.2,
//                                 ),
//                               ),
//                               padding: EdgeInsets.all(6),
//                               child: CircleAvatar(
//                                 radius: 120,
//                                 backgroundImage: AssetImage("assets/profile.jpg"), // Add your image in assets folder
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NavBarItem extends StatelessWidget {
//   final String title;
//   const NavBarItem({required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 16,
//           color: Colors.white70,
//         ),
//       ),
//     );
//   }
// }
//
// class SocialIcon extends StatelessWidget {
//   final IconData icon;
//   const SocialIcon({required this.icon});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: Icon(
//         icon,
//         color: Colors.tealAccent,
//         size: 28,
//       ),
//     );
//   }
// }
