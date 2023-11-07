import 'package:flutter/material.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/auth/login_screen.dart';
import 'package:lets_talk/ui/screens/auth/register_screen2.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_blue_button.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';

class RegiseterScreen extends StatefulWidget {
  const RegiseterScreen({Key? key}) : super(key: key);
  static const screenId = '/register_screen';

  @override
  State<RegiseterScreen> createState() => _RegiseterScreenState();
}

class _RegiseterScreenState extends State<RegiseterScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  bool isChecked = false;
  bool isPasswordShow = false;
  bool isRePasswordShow = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppMainAppBar(
            icon: const SizedBox(), title: FormStrings.registerAppbarTitle),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.05),
                  Text(
                    FormStrings.registerScreenTitle,
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    children: [
                      Text(
                        FormStrings.mobile,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
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
                  SizedBox(height: size.height * 0.05),
                  Row(
                    children: [
                      Text(
                        FormStrings.password,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPasswordShow,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: blackColor, fontSize: 20),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: redColor,
                        fontSize: 15,
                        fontFamily: FontFamily.arM,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                      ),
                      prefixIconColor: darkGreyColor,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordShow = !isPasswordShow;
                          });
                        },
                        icon: isPasswordShow
                            ? const Icon(Icons.visibility_off)
                            : const Icon(
                                Icons.visibility,
                              ),
                      ),
                      suffixIconColor: darkGreyColor,
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
                        return 'password input can not be empty!!!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    children: [
                      Text(
                        FormStrings.repeatPassword,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormField(
                    controller: _rePasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isRePasswordShow,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: blackColor, fontSize: 20),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: redColor,
                        fontSize: 15,
                        fontFamily: FontFamily.arM,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                      ),
                      prefixIconColor: darkGreyColor,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isRePasswordShow = !isRePasswordShow;
                          });
                        },
                        icon: isRePasswordShow
                            ? const Icon(Icons.visibility_off)
                            : const Icon(
                                Icons.visibility,
                              ),
                      ),
                      suffixIconColor: darkGreyColor,
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
                        return 'repeat password input can not be empty!!!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: darkBlueColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        value: isChecked,
                        onChanged: (state) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        FormStrings.remind,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: darkBlueColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.screenId);
                        },
                        child: Text(
                          FormStrings.haveAccount,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: darkBlueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppBlueButton(
                    title: FormStrings.next,
                    onPressed: () {
                      if (_formKey.currentState!.validate() && isChecked) {
                        List<String>? userInfo = [
                          _mobileController.text,
                          _passwordController.text,
                        ];
                        Navigator.pushNamed(context, RegisterScreen2.screenId,
                            arguments: userInfo);
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
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
