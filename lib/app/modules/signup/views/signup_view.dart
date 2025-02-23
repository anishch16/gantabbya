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
                style: InRiaTextStyles.veryBigStyle
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "User Name",
                        icon: const Icon(Icons.person),
                        enabled: true,
                        textEditingController: controller.fn,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (string) =>
                            Validator.validateUsername(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hint: "Email",
                        enabled: true,
                        icon: const Icon(Icons.mail),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        textEditingController: controller.email,
                        validator: (string) =>
                            Validator.validateEmail(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return CustomTextField(
                          hint: "Password",
                          icon: const Icon(Icons.lock),
                          enabled: true,
                          textEditingController: controller.pw,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (string) =>
                              Validator.validatePassword(string: string ?? ""),
                          obscureText: controller.isPasswordVisible.value,
                          suffixIcon: controller.isPasswordVisible.value
                              ? GestureDetector(
                                  onTap: () {
                                    controller.isPasswordVisible.value =
                                        !controller.isPasswordVisible.value;
                                  },
                                  child: const Icon(Icons.visibility_off))
                              : GestureDetector(
                                  onTap: () {
                                    controller.isPasswordVisible.value =
                                        !controller.isPasswordVisible.value;
                                  },
                                  child: const Icon(Icons.visibility)),
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return CustomTextField(
                          hint: "Confirm Password",
                          icon: const Icon(Icons.lock),
                          enabled: true,
                          textEditingController: controller.confirmPw,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (string) => Validator.confirmPassword(
                              password: controller.pw.text,
                              cPassword: string ?? ""),
                          obscureText: controller.isPasswordVisible.value,
                          suffixIcon: controller.isPasswordVisible.value
                              ? GestureDetector(
                                  onTap: () {
                                    controller.isPasswordVisible.value =
                                        !controller.isPasswordVisible.value;
                                  },
                                  child: const Icon(Icons.visibility_off))
                              : GestureDetector(
                                  onTap: () {
                                    controller.isPasswordVisible.value =
                                        !controller.isPasswordVisible.value;
                                  },
                                  child: const Icon(Icons.visibility)),
                        );
                      }),
                      const SizedBox(
                        height: 24,
                      ),
                      Obx(
                        () => controller.isSigningUp.value
                            ? const CircularProgressIndicator(
                                color: AppColors.primary, strokeWidth: 3)
                            : GestureDetector(
                                onTap: () {
                                  if (controller.signUpFormKey.currentState!
                                      .validate()) {
                                    controller.signup(
                                      email: controller.email.text,
                                      pw: controller.pw.text,
                                      username: controller.fn.text,
                                    );
                                  } else {
                                    Get.rawSnackbar(
                                        message: "Invalid Input",
                                        backgroundColor: AppColors.red,
                                        duration: const Duration(seconds: 2),
                                        animationDuration:
                                            const Duration(milliseconds: 100),
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
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
                            style: AppTextStyles.smallStyle
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () => Get.offAllNamed(Routes.LOGIN),
                            child: Text(
                              "LogIn",
                              style: AppTextStyles.smallStyle
                                  .copyWith(color: Colors.blue),
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
