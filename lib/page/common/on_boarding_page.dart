import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/other/SharedPref.dart';
import 'package:pantau_pasien/page/common/check_pref.dart';
import 'package:pantau_pasien/page/common/login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    SharedPref().addIntToSF("isOnBoarding", 1);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/img/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  // checkBoardingPref() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int isOnBoarding = prefs.getInt("isOnBoarding");
  //   if(isOnBoarding != null){
  //     print("session created $isOnBoarding");
  //     Get.to(LoginPage());
      
  //   }else{
  //     print("session not created");
  //     Get.to(OnBoardingPage());
  //   }
    
  // }

  @override
  void initState() {
    super.initState();
    // checkBoardingPref();
    CheckPref().checkPref();

  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Memantau Pasien bisa dimana saja",
          body:"Anda bisa memantau kondisi pasien dimana saja dan kapanpun melalui aplikasi Pantau Pasien",
          image: _buildImage('onboard'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Mencegah penularan dengan pasien",
          body:"Anda tidak perlu mengunjungi rumah sakit untuk memantau kondisi pasien agar tidak tertular penyakit dengan pasien",
          image: _buildImage('onboard'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Layanan Mudah dan Gratis",
          body: "Layanan pada aplikasi tidak dipungut biaya apapun dan mudah digunakan oleh Anda",
          image: _buildImage('onboard'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,
      // skip: const Text('Skip'),
      next: CircleAvatar(
        radius: 30,
        backgroundColor: primaryColor,
        child: IconButton(
            icon: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        )),
      ),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
