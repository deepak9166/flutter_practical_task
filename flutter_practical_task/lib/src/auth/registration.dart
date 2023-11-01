import 'package:flutter/material.dart';
import 'package:flutter_practical_task/component/button.dart';
import 'package:flutter_practical_task/util/colors.dart';
import 'package:flutter_practical_task/util/images.dart';
import 'package:provider/provider.dart';

import '../../component/custom_text_field.dart';
import '../../component/mobile_num_textfield copy.dart';
import '../../component/text_widget.dart';
import 'provider/auth_provider.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

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
      body: SizedBox(
        child: Column(children: [
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
                        top: 120,
                        left: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heading1Text('Welcome'),
                            const SizedBox(
                              height: 16,
                            ),
                            heading3Text('Enter Valid Mobile Number')
                          ],
                        ))

                    //
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
                        textEditingController: provider.number,
                        hindText: 'Enter your phone number'),
                    const SizedBox(
                      height: 20,
                    ),
                    textLabel('Register for?'),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          child: Text('Organiser'),
                        ),
                      ],
                      onChanged: (value) {},
                      style: TextStyle(color: AppColor.black, fontSize: 18),
                      isExpanded: true,
                    ),
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
                        label: 'SIGN UP',
                        onPress: () {
                          provider.signUp(context);
                        }),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: richText1('Back to ', 'Login', onPress: () {
                        Navigator.pop(context);
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
