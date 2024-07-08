import 'package:flutter/material.dart';
import 'package:seniorproject/components/buttoms_nav.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage(
            image: 'assets/images/ksu1.jpg',
            title: 'Welcome to Our App',
            description: 'This is the first step to getting started.',
          ),
          OnboardingPage(
            image: 'assets/images/ksu2.jpg',
            title: 'Discover Features',
            description: 'Learn about all the great features we offer.',
          ),
          OnboardingPage(
            image: 'assets/images/ksu3.jpg',
            title: 'Stay Connected',
            description: 'Stay connected with the community and get updates.',
          ),
          buildMainScreen(context),
        ],
      ),
    );
  }

  Widget buildMainScreen(BuildContext context) {
    return Container(
      color: Colors.lightBlue[300], // พื้นหลังสีฟ้าพาสเทล
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/ksu.png',
              fit: BoxFit.contain, // ปรับขนาดรูปภาพให้พอดีกับ container
              width: 250, // กำหนดความกว้าง
              height: 350, // กำหนดความสูง
            ),
            SizedBox(height: 15), // เพิ่มระยะห่างระหว่างรูปภาพและปุ่ม
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomsNav(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.contain,
            width: 250,
            height: 250,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
