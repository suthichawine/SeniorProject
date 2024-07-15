import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:seniorproject/app_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushReplacementNamed(context, AppRouter.bottomsNav);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    const bodyStyle = TextStyle(fontSize: 16.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.lightBlueAccent,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.lightBlueAccent,
        pages: [
          PageViewModel(
            title: "ยินดีต้อนรับสู่มหาวิทยาลัยกาฬสินธุ์",
            body: "สำรวจโอกาสและประสบการณ์การเรียนรู้ที่ไม่มีที่สิ้นสุดกับเรา",
            image: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: _buildImage('ksu.png'),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "มหาวิทยาลัยกาฬสินธุ์สู่ความเป็นเลิศ",
            body: "มหาวิทยาลัยกาฬสินธุ์ มุ่งสู่ความเป็นเลิศด้านการศึกษา หล่อหลอมบัณฑิตที่มีคุณภาพ พร้อมทักษะที่ตรงกับความต้องการของตลาดงาน",
            image: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: _buildImage('ksu2.jpg'),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "อนาคตที่สดใสรอคุณอยู่",
            body: "มุ่งมั่นส่งเสริมให้นักศึกษาบรรลุเป้าหมาย และประสบความสำเร็จบนเส้นทางที่คุณเลือก",
            image: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: _buildImage('ksu3.jpg'),
            ),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        skip: const Text('ข้าม', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('เสร็จสิ้น',
            style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
