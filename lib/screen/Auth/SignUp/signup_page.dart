import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../stepper/stepper_page.dart';
import '../../../Widgets/custom_button.dart';

import '../../../utls/textstyle.dart';
import '../Login/login_page.dart';

final TextEditingController _signUpemailController = TextEditingController();

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
        child: SvgPicture.asset(
            'assets/icons/cross.svg',height: 14,width: 14,
          ),
                ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                )),
            child: Center(
              child: const TextFieldText(
                'Log In',
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 16)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              titleTextFiedl: 'Your Email Address',
              controller: _signUpemailController,
              svgPicture: SvgPicture.asset(
                'assets/icons/mail.svg',
              ),
              hintText: 'Enter your email address',
              padding: const EdgeInsets.symmetric(horizontal: 18),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Continue',
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const StepperPage()));
              },
            ),
            const SizedBox(height: 53),
          ],
        ),
      ),
    );
  }
}
