import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';
import 'package:sb_myreports/core/widgets/custom/custom_form_field.dart';
import '../widgets/custom_buttons.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EditProfileScreenContent();
  }
}

class EditProfileScreenContent extends StatefulWidget {
  const EditProfileScreenContent({Key? key}) : super(key: key);

  @override
  State<EditProfileScreenContent> createState() => _EditProfileScreenContentState();
}

class _EditProfileScreenContentState extends State<EditProfileScreenContent> {
  File? selectImage;
  String base64Image = "";
  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    if (image != null) {
      setState(() {
        selectImage = File(image.path);
        base64Image = base64Encode(selectImage!.readAsBytesSync());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Profile Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  // Container(
                  //   height: 130.h,
                  //   width: 130.w,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 1.w,color: Colors.amber),
                  //     boxShadow: [
                  //       BoxShadow(spreadRadius: 2,
                  //       blurRadius: 10,
                  //       color: Colors.black.withOpacity(0.1))
                  //     ],
                  //     shape: BoxShape.circle,
                  //     image: const DecorationImage(fit: BoxFit.cover,image: AssetImage(AppAssets.perfume2,),)
                  //   ),
                  //
                  // ),
                  Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber,  width: 2 ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                    child: Container(
                      height: 130.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.w,color: Colors.amber),
                        shape: BoxShape.circle,
                        // boxShadow: [
                        //   BoxShadow(spreadRadius: 1,
                        //   blurRadius: 10,
                        //   color: Colors.white)
                        // ]
                      ),
                      child: selectImage != null
                          ? Image.file(
                              selectImage!,
                              height: 130,
                              width: 130,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(
                              height: 130.h,
                              width: 130.w,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.asset(AppAssets.thred1,fit: BoxFit.cover,),),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 2,
                    child: InkWell(
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 22.sp,
                          )),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 100.h,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          chooseImage("camera");
                                        },
                                        child: const Text('Camera',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold))),
                                    TextButton(
                                        onPressed: () {
                                          chooseImage("Gallery");
                                        },
                                        child: const Text(
                                          'Gallery',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ]),
                CustomTextFormField(
                  hintText: 'Enter Your Name ',
                  labelText: 'Your Name',
                ),
                CustomTextFormField(
                  hintText: 'Enter Your Email / PHone ',
                  labelText: 'Your  Email / PHone',
                ),
                CustomTextFormField(
                  hintText: 'Address',
                  labelText: 'Address',
                ),
                CustomTextFormField(
                  hintText: 'Enter Your Password ',
                  labelText: ' Password',
                ),
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(width: 100.w,
                  child: CustomButtons(
                      color: Colors.amber,
                      titleColor: Colors.white,
                      radius: BorderRadius.circular(20.r),
                      title: 'Save Now',
                      onTap: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
