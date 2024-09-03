import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../utils/validators.dart';
import '../../../widgets/button_large.dart';
import '../../../widgets/custom_textfield.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final fn = TextEditingController();
  final ln = TextEditingController();
  final email = TextEditingController();
  final pn = TextEditingController();

  final pw = TextEditingController();
  final confirmPw = TextEditingController();

  @override
  final controller = Get.put(SignupController());
  GlobalKey<FormState> formKey = GlobalKey();

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // Image.asset("assets/images/notice.png"),
                  Text(
                    "SignUp",
                    style: largeStyle.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your credentials to login to your account.",
                    style: smallStyle.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    hint: "First Name",
                    icon: const Icon(Icons.person),
                    textEditingController: fn,
                    validator: (string) =>
                        Validator.validateIsEmpty(string: string ?? ""),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hint: "Last Name",
                    icon: const Icon(Icons.person),
                    textEditingController: ln,
                    validator: (string) =>
                        Validator.validateIsEmpty(string: string ?? ""),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hint: "Email",
                    icon: const Icon(Icons.mail),
                    textEditingController: email,
                    validator: (string) =>
                        Validator.validateEmail(string: string ?? ""),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hint: "Phone Number",
                    icon: const Icon(Icons.phone),
                    textEditingController: pn,
                    validator: (string) =>
                        Validator.validatePhone(string: string ?? ""),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // CustomTextField(hint: "Profession", icon: Icon(Icons.badge), textEditingController: profession,),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  CustomTextField(
                      hint: "Password",
                      icon: const Icon(Icons.lock),
                      textEditingController: pw,
                      validator: (string) =>
                          Validator.validatePassword(string: string ?? ""),
                      isPassword: true),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                      hint: "Confirm Password",
                      icon: const Icon(Icons.lock),
                      textEditingController: confirmPw,
                      validator: (string) => Validator.confirmPassword(
                          password: pw.text, cPassword: string ?? ""),
                      isPassword: true),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () => controller.isSigningIn.value
                        ? const CircularProgressIndicator(
                            color: AppColors.primary, strokeWidth: 3)
                        : GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                controller.signup(fn.text, ln.text, pn.text,
                                    email.text, pw.text, confirmPw.text);
                              } else {}

                              // Get.to(() => UserDetailFormView());
                            },
                            child: const LargeButton(title: "Signup"),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
