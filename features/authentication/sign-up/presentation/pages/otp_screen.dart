import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/custom_otp_fields.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/sized.box.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/router/models/page_config.dart';
import '../../../../../core/utils/enums/page_state_enum.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../dashboard/presentation/widgets/custom_buttons.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OtpScreenContent(
      verificationId: '',
    );
  }
}

class OtpScreenContent extends StatefulWidget {
  final String verificationId;

  const OtpScreenContent({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<OtpScreenContent> createState() => _OtpScreenContentState();
}

class _OtpScreenContentState extends State<OtpScreenContent> {
  String pinCode = "";
  bool loading = false;
  TextEditingController phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        shape: ContinuousRectangleBorder(
          side: BorderSide(color: Colors.amber, width: 1.w),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        title: const Text('Your Otp '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Phone Verification ",
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              "We need to register YourPhone number Before getting started !",
              style: TextStyle(color: Colors.white),
            ),
            20.ph,
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Form(
            //     key: _formKey,
            //     child: TextFormField(
            //       keyboardType: TextInputType.number,
            //       // controller: user_number,
            //       // initialValue: "+971",
            //       onSaved: (value) {
            //         userNumber = value!;
            //       },
            //       validator: FormValidators.validatePhone,
            //       maxLines: 1,
            //       minLines: 1,
            //       autofocus: false,
            //       style: TextStyle(
            //           fontSize: 14.sp,
            //           color: Colors.white,
            //           fontWeight: FontWeight.w400),
            //       decoration: InputDecoration(
            //         prefixIcon: CountryCodePicker(
            //           onChanged: (value) {
            //             print(value);
            //             countryCode = value.toString();
            //           },
            //           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            //           initialSelection: '+92',
            //           textStyle: TextStyle(
            //               fontSize: 14.sp,
            //               color: Colors.white ,
            //               fontWeight: FontWeight.w400),
            //           // favorite: ['+971','AE'],
            //           // optional. Shows only country name and flag
            //           showCountryOnly: false,
            //           showFlag: true,
            //           // optional. Shows only country name and flag when popup is closed.
            //           showOnlyCountryWhenClosed: false,
            //           // optional. aligns the flag and the Text left
            //           alignLeft: false,
            //         ),
            //         contentPadding: EdgeInsets.symmetric(
            //             horizontal: 10.sp, vertical: 12.sp),
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(15),
            //           borderSide: const BorderSide(color: Colors.grey),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(15),
            //           borderSide: const BorderSide(color: Colors.blue),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            20.ph,
            TextFormField(
              controller: phoneNumberController,
            ),
            //
            //  CustomOtpFields(onChanged:(value ){
            //
            //   setState(() {
            //     pinCode = value ;
            //   });
            //
            //
            // } ),
            CustomButtons(
                color: Colors.amber,
                titleColor: Colors.white,
                loading: loading,
                radius: BorderRadius.circular(20.r),
                title: 'Verify Phone number',
                onTap: () async {
                  setState(() {
                    loading= true ;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: phoneNumberController.text.toString());

                  try{
                    await auth.signInWithCredential(credential);
                    AppState appState = sl ();
                    appState.goToNext(PageConfigs.bottomNavigationBarPageConfig);
                  } catch(e){
                    setState(() {
                      loading= false;
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
