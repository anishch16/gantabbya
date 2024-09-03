import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../widgets/button_large.dart';
import '../../../widgets/custom_textfield.dart';

class ForgotPassword extends StatelessWidget {
  final email=TextEditingController();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(children: [
              Image.asset("assets/images/notice.png"),
              Text(
                "Forgot Password",
                style: largeStyle.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter your email address to get verification code",
                style: smallStyle.copyWith(color: AppColors.gray),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(hint: "Email", icon: const Icon(Icons.email), textEditingController: email,),
              const SizedBox(
                height: 26,
              ),
              LargeButton(title: "Send Verification Code"),
            ]),
          ),
        ),
      ),
    );
  }
}
