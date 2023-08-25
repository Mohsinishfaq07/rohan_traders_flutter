import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sb_myreports/core/utils/validators/form_validator.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/sized.box.dart';

import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/enums/page_state_enum.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/widgets/custom/custom_form_field.dart';
import '../../../../dashboard/presentation/widgets/custom_buttons.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignUpScreenContent();
  }
}

class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({Key? key}) : super(key: key);

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 14, right: 14,bottom: 6 ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Lottie.asset(
                'assets/images/business.json',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.0003,
                    width: MediaQuery.of(context).size.width * 0.1,
                    color: Colors.white,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.0003,
                    width: MediaQuery.of(context).size.width * 0.47,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: SingleChildScrollView(

                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: CustomTextFormField(
                            controller: nameController,
                            validator: FormValidators.validateName,
                            textInputAction: TextInputAction.next,
                            hintText: 'Your Name ',
                            labelText: 'Your Name',
                          ),
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          validator: FormValidators.validateEmail,
                          textInputAction: TextInputAction.next,
                          hintText: 'Your Email  ',
                          labelText: 'Your  Email ',
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: CustomTextFormField(
                            controller: addressController,
                            validator: FormValidators.validateAddress,
                            textInputAction: TextInputAction.next,
                            hintText: 'Address',
                            labelText: 'Shop Address',
                          ),
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          validator: FormValidators.validateLoginPassword,
                          textInputAction: TextInputAction.done,
                          hintText: 'Your Password ',
                          labelText: ' Password',
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: CustomTextFormField(
                            controller: passwordController,
                            validator: FormValidators.validateLoginPassword,
                            textInputAction: TextInputAction.done,
                            hintText: ' Confirm Password ',
                            labelText: 'Confirm Password',
                          ),
                        ),
                        20.ph,
                        CustomButtons(
                            color: Colors.amber,
                            loading: loading,
                            titleColor: Colors.white,
                            radius: BorderRadius.circular(20.r),
                            title: 'Sign Up ',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                try {
                                  _auth.createUserWithEmailAndPassword(
                                      email: emailController.text.toString(),
                                      password:
                                          passwordController.text.toString());
                                  setState(() {
                                    loading = false;
                                  });
                                  AppState appSate = sl();
                                  appSate.goToNext(
                                      PageConfigs.bottomNavigationBarPageConfig,
                                      pageState: PageState.replace);
                                } catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(e.toString()),
                                  ));
                                }
                              }
                            }),
                        20.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Joined us before?",
                              style: TextStyle(color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {
                                AppState appSate = sl();
                                appSate.removePage(PageConfigs.logInScreenPageConfig);
                                appSate.goToNext(
                                    PageConfigs.logInScreenPageConfig,
                                    pageState: PageState.replace);
                              },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
