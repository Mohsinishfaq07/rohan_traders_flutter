import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/utils/validators/form_validator.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/sized.box.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../dashboard/presentation/widgets/custom_buttons.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PhoneScreenContent();
  }
}

class PhoneScreenContent extends StatefulWidget {
  const PhoneScreenContent({Key? key}) : super(key: key);

  @override
  State<PhoneScreenContent> createState() => _PhoneScreenContentState();
}

class _PhoneScreenContentState extends State<PhoneScreenContent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  bool remember = false;
  bool loading = false;

  String userNumber = "";
   var country = "";
  var otp = "";
  String pinCode = "";

  var verifyId = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void>  sendOtp(String phoneNumber) async {
    // Get the `FirebaseAuth` instance
    final auth = FirebaseAuth.instance;

    try {
      // Start the phone number verification process
      await auth.verifyPhoneNumber(
        phoneNumber: countryCode.text + userNumber,
        verificationCompleted: (phoneAuthCredential) async {
          // Automatically sign in the user if verification is complete
          await auth.signInWithCredential(phoneAuthCredential);
          debugPrint('Verification completed successfully.');
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            loading = false;
          });
          // Handle verification failure
          debugPrint('Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save the verification ID to use later
          debugPrint('Verification code sent to $phoneNumber');
          AppState appState = sl();
          appState.goToNext(PageConfigs.otpScreenPageConfig);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // Handle timeout
          loading = false;
          debugPrint('Auto retrieval timeout: $verificationId');
        },
      );
    } catch (e) {
      // Handle errors
      debugPrint('Error occurred: $e');
    }
  }
  @override
  void initState(){
    countryCode.text ="+92";
    super.initState();
  }

  void clearTextField() {
    mobileController.text = '';
    if (remember) {
      remember = false;
    }
  }

  // Future<dynamic> sendOtp({required String phone}) async {
  //   await auth.verifyPhoneNumber(
  //       phoneNumber: countryCode + mobileController.text,
  //       verificationCompleted: (phoneAuthCredential) async {
  //         await auth.signInWithCredential(phoneAuthCredential);
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         return debugPrint(e.toString());
  //       },
  //       codeSent: (String? verificationId, int? resendToken) {
  //         verifyId = verificationId.toString();
  //       },
  //       codeAutoRetrievalTimeout: (value) {});
  // }
  loginMethod() async {
    try {
      PhoneAuthCredential credentials = PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: otpController.text);
      await auth.signInWithCredential(credentials);

      AppState appSate = sl();
      appSate.goToNext(
        PageConfigs.bottomNavigationBarPageConfig,
      );
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('Your Phone number'),
        actions: const [SizedBox()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Phone Verification ",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Text(
              "We need to register Your Phone number Before getting started ! ",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            20.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobileController,
                  onSaved: (value) {
                    userNumber = value!;
                  },
                  onChanged: (value) {},
                  validator: FormValidators.validatePhone,
                  maxLines: 1,
                  minLines: 1,
                  autofocus: false,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    prefixIcon: CountryCodePicker(
                      onChanged: (value) {
                        country = value.toString();
                      },

                      initialSelection: '+92',
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400),
                      showCountryOnly: false,
                      showFlag: true,
                      barrierColor: Theme.of(context).primaryColor,
                      showOnlyCountryWhenClosed: false,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.sp, vertical: 12.sp),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            20.ph,
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: CustomOtpFields(
            //       controller: otpController,
            //       onChanged: (value) {
            //         setState(() {
            //           pinCode = value;
            //         });
            //       }),
            // ),
            CustomButtons(
                color: Colors.amber,
                titleColor: Colors.white,
                radius: BorderRadius.circular(20.r),
                title: 'Verify Phone number',
                onTap: () {
                    // clearTextField();
                  setState(() {
                    loading = true;
                  });
                  sendOtp("+92039649303");
                  debugPrint("03039649303");
                }),
            // CustomButtons(
            //     color: Colors.amber,
            //     titleColor: Colors.white,
            //     radius: BorderRadius.circular(20.r),
            //     title: 'Verify Phone number',
            //     onTap: () {
            //       auth.verifyPhoneNumber(verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
            //     }),
          ],
        ),
      ),
    );
  }
}
