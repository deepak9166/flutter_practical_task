import 'package:flutter/material.dart';

import '../../util/images.dart';
import 'welcome.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    goNextPage();
    super.initState();
  }

  goNextPage() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.splash0,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppImages.logo,
          ),
        ],
      ),
    );
  }
}
