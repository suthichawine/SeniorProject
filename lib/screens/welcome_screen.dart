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
    Navigator.pushReplacementNamed(context, AppRouter.bottomsNav );
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

    const bodyStyle = TextStyle(fontSize: 20.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
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
              padding: const EdgeInsets.only(top: 100.0),
              child: _buildImage('ksu.png'),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "ภาพรวมระบบในหนึ่งเดียว",
            body: "ดูภาพรวมของระบบได้ทุกที่ทุกเวลา ด้วยระบบที่ออกแบบมาเพื่อความง่าย",
            image: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: _buildImage('ksu2.jpg'),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "ซื้อขายได้ตลอดเวลา",
            body: "ติดตามการซื้อขายได้ทุกที่ทุกเวลา ด้วยระบบที่ออกแบบมาเพื่อความง่าย",
            image: Padding(
              padding: const EdgeInsets.only(top: 100.0),
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
        done: const Text('เสร็จสิ้น', style: TextStyle(fontWeight: FontWeight.w600)),
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


          