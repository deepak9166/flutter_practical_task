import 'package:flutter/material.dart';
import 'package:flutter_practical_task/util/colors.dart';

import '../../component/button.dart';
import '../../component/text_widget.dart';
import '../../util/images.dart';
import '../auth/login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
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
            Positioned(
              bottom: 0,
              child: loginView(context),
            )
          ],
        ),
      ),
    );
  }

  Widget loginView(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              label: 'Login with Phone',
              icon: Icons.call,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: AppColor.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('OR'),
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: AppColor.black,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          /// social icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AppImages.google),
              Image.asset(AppImages.facebook),
              Image.asset(AppImages.instagram),
            ],
          ),

          const SizedBox(
            height: 30,
          ),

          richText1('Don\'t have an account? ', 'Sign Up'),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
