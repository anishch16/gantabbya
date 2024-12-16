import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/validators.dart';
import '../../../widgets/button_large.dart';
import '../../../widgets/custom_textfield.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppImages.planeBackground,
              ),
              Text(
                "SignUp",
                style: InRiaTextStyles.veryBigStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "Full Name",
                        icon: const Icon(Icons.person),
                        textEditingController: controller.fn,
                        validator: (string) => Validator.validateIsEmpty(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hint: "Email",
                        icon: const Icon(Icons.mail),
                        textEditingController: controller.email,
                        validator: (string) => Validator.validateEmail(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hint: "Phone Number",
                        icon: const Icon(Icons.phone),
                        textEditingController: controller.pn,
                        validator: (string) => Validator.validatePhone(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      CustomTextField(
                        hint: "Password",
                        icon: const Icon(Icons.lock),
                        textEditingController: controller.pw,
                        validator: (string) => Validator.validatePassword(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hint: "Confirm Password",
                        icon: const Icon(Icons.lock),
                        textEditingController: controller.confirmPw,
                        validator: (string) => Validator.confirmPassword(password: controller.pw.text, cPassword: string ?? ""),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Obx(
                        () => controller.isSigningIn.value
                            ? const CircularProgressIndicator(color: AppColors.primary, strokeWidth: 3)
                            : GestureDetector(
                                onTap: () {
                                  if (controller.signUpFormKey.currentState!.validate()) {
                                    controller.signup(controller.fn.text, controller.ln.text, controller.pn.text, controller.email.text,
                                        controller.pw.text, controller.confirmPw.text);
                                  } else {}

                                  // Get.to(() => UserDetailFormView());
                                },
                                child: const LargeButton(title: "Signup"),
                              ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already an account?",
                            style: AppTextStyles.smallStyle.copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () => Get.offAllNamed(Routes.LOGIN),
                            child: Text(
                              "LogIn",
                              style: AppTextStyles.smallStyle.copyWith(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
