import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/sized.box.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/validators/form_validator.dart';
import '../../../../../core/widgets/custom/custom_form_field.dart';
import '../../../../dashboard/presentation/widgets/custom_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginScreenContent();
  }
}

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({Key? key}) : super(key: key);

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString());
  }

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
               width: MediaQuery.of(context).size.width *0.9,
              child: Lottie.asset(
                'assets/images/business.json'
              ),
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
                  "Login",
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

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 14),
                      child: CustomTextFormField(
                        validator: FormValidators.validateEmail,
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        // prefix: Icon(Icons.alternate_email) ,

                        hintText: 'Your Email ',
                        labelText: 'Your  Email ',
                      ),
                    ),
                    CustomTextFormField(
                      validator: FormValidators.validateLoginPassword,
                      textInputAction: TextInputAction.done,
                      controller: passwordController,
                      suffixIconOnTap: () {},
                      suffix: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      hintText: 'Your Password ',
                      obscureText: !_isPasswordVisible,
                      labelText: ' Password',
                    ),
                    6.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password ",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    20.ph,
                    CustomButtons(
                        color: Colors.amber,
                        titleColor: Colors.white,
                        radius: BorderRadius.circular(12.r),
                        title: 'Login In',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            try {
                              await _auth.signInWithEmailAndPassword(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString());
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

                  ],
                ),
              ),
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New Here?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                InkWell(
                    onTap: () {
                      AppState appSate = sl();
                      appSate.removePage(
                          PageConfigs.signUpScreenPageConfig);
                      appSate.goToNext(
                          PageConfigs.signUpScreenPageConfig,
                          pageState: PageState.replace);
                    },
                    child: const Text(
                      " Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
