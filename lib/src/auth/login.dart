import 'package:flutter/material.dart';
import 'package:flutter_practical_task/component/button.dart';
import 'package:flutter_practical_task/src/auth/registration.dart';
import 'package:flutter_practical_task/util/colors.dart';
import 'package:flutter_practical_task/util/images.dart';
import 'package:provider/provider.dart';

import '../../component/custom_text_field.dart';
import '../../component/mobile_num_textfield copy.dart';
import '../../component/text_widget.dart';
import '../home/home_page.dart';
import 'provider/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppImages.signInBg,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 120, left: 40, child: heading1Text('Hi,\nWelcome'))
                ],
              ),
            )),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  textLabel('Mobile Number'),
                  MobileNumberTextField(
                      textEditingController: provider.numberLogin,
                      hindText: 'Enter your phone number'),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hindText: 'Enter OTP',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: heading2Text('Resend OTP')),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      label: 'LOGIN',
                      onPress: () {
                        provider.login(context);
                      }),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: richText1('Don\'t have an account? ', 'Sign Up',
                        onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registration(),
                          ));
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
