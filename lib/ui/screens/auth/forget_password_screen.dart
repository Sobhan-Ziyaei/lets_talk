import 'package:flutter/material.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_blue_button.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  static const screenId = 'forget_password_screen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppMainAppBar(
          icon: InkWell(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 70,
              height: 40,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          title: FormStrings.forgetPassAppbarTitle,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    Text(
                      FormStrings.inputYourMobile,
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.number,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: blackColor, fontSize: 20),
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(
                      color: redColor,
                      fontSize: 15,
                      fontFamily: FontFamily.arM,
                    ),
                    prefixIcon: const Icon(
                      Icons.mobile_screen_share_rounded,
                    ),
                    prefixIconColor: darkGreyColor,
                    filled: true,
                    fillColor: milkyColor,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.02,
                    ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 2,
                        color: darkBlueColor,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'mobile input can not be empty!!!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.07),
                AppBlueButton(
                  title: AppStrings.next,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigator.pushNamed(
                      //     context, LevelChooseScreen.screenId);
                      print('input is filled');
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: whiteColor,
                            title: Text(
                              FormStrings.warning,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: darkBlueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              FormStrings.completeInput,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: darkBlueColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: darkBlueColor,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  FormStrings.returnText,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
