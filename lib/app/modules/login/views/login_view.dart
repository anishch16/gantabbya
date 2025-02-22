import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/snackbar_util.dart';
import '../../../widgets/button_large.dart';
import '../../../widgets/checkbox_view.dart';
import '../../../widgets/custom_textfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppImages.planeBackground,
              ),
              Text(
                "LogIn",
                style: InRiaTextStyles.veryBigStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.logInFormKey,
                  child: Column(
                    children: [

                      CustomTextField(
                        hint: "Username",
                        enabled: true,
                        icon: const Icon(Icons.person),
                        textEditingController: controller.username,
                        // validator: (string) =>
                        //     Validator.validateIsEmpty(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        hint: "Email",
                        enabled: true,
                        icon: const Icon(Icons.email),
                        textEditingController: controller.email,
                        // validator: (string) =>
                        //     Validator.validateIsEmpty(string: string ?? ""),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return CustomTextField(
                          hint: "Password",
                          icon: const Icon(Icons.lock),
                          enabled: true,
                          textEditingController: controller.password,
                          obscureText: controller.isPasswordVisible.value,
                          suffixIcon: controller.isPasswordVisible.value
                              ? GestureDetector(
                                  onTap: () {
                                    controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                  },
                                  child: const Icon(Icons.visibility_off))
                              : GestureDetector(
                                  onTap: () {
                                    controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                  },
                                  child: const Icon(Icons.visibility)),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.isRememberMe.value = !controller.isRememberMe.value;
                              },
                              child: CheckboxView(
                                title: "Remember Me",
                                clicked: controller.isRememberMe.value,
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     // Get.to(() => ForgotPassword());
                            //   },
                            //   child: const Text(
                            //     "Forgot Password?",
                            //     style: TextStyle(color: Colors.red),
                            //   ),
                            // ),
                          ],
                        );
                      }),
                      const SizedBox(
                        height: 24,
                      ),
                      Obx(
                        () => controller.isLogging.value
                            ? const CircularProgressIndicator(color: AppColors.primary, strokeWidth: 3)
                            : GestureDetector(
                                onTap: () {
                                  if (controller.logInFormKey.currentState!.validate()) {
                                    controller.login(
                                      username: controller.username.text,
                                      email: controller.email.text,
                                      pw: controller.password.text,
                                    );
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
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New?",
                            style: AppTextStyles.smallStyle.copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () => Get.offAllNamed(Routes.SIGNUP),
                            child: Text(
                              "SignUp",
                              style: AppTextStyles.smallStyle.copyWith(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
