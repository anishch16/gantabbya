import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../utils/snackbar_util.dart';
import '../../../utils/validators.dart';
import '../../../widgets/button_large.dart';
import '../../../widgets/custom_textfield.dart';
import '../../bottomNav/views/bottom_nav_view.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  final controller = Get.put(LoginController());
  GlobalKey<FormState> formKey = GlobalKey();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.loginBg), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            "Login",
            style: largeStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24.0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter your credentials to login to your account.",
                        style: smallStyle.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      CustomTextField(
                        hint: "Email",
                        icon: const Icon(Icons.email),
                        textEditingController: email,
                        // validator: (string) =>
                        //     Validator.validateIsEmpty(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hint: "Password",
                        icon: const Icon(Icons.lock),
                        textEditingController: password,
                        // validator: (string) =>
                        //     Validator.validateIsEmpty(string: string ?? ""),
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const CheckboxView(
                      //       title: "Remember Me",
                      //       clicked: false,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {
                      //         Get.to(() => ForgotPassword());
                      //       },
                      //       child: const Text(
                      //         "Forgot Password?",
                      //         style: TextStyle(color: Colors.red),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 60,
                      ),
                      Obx(
                        () => controller.isLogging.value
                            ? const CircularProgressIndicator(
                                color: AppColors.primary, strokeWidth: 3)
                            : GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    Get.offAll(() => BottomNavView());

                                    // controller.login(email.text, password.text);
                                  } else {
                                    SnackBarUtil.showSnackBar(
                                      message: "Please fill-up required fields",
                                    );
                                  }
                                },
                                child: const LargeButton(
                                  title: "Log In ",
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: smallStyle.copyWith(color: AppColors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SignupView());
                            },
                            child: const Text(
                              " Sign Up",
                              style: TextStyle(color: AppColors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
