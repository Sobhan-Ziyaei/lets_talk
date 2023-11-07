import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lets_talk/bloc/authentication/auth_bloc.dart';
import 'package:lets_talk/bloc/authentication/auth_event.dart';
import 'package:lets_talk/bloc/authentication/auth_state.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/auth/forget_password_screen.dart';
import 'package:lets_talk/ui/screens/auth/register_screen.dart';
import 'package:lets_talk/ui/screens/level_choose_screen.dart';
import 'package:lets_talk/ui/screens/main%20screen/main_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_blue_button.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';
import 'package:lets_talk/util/auth_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const screenId = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordShow = false;
  String? mac ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    mac = AuthManager.readMac();
    print('object');
  }

  @override
  void dispose() {
    super.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppMainAppBar(
          icon: InkWell(
            onTap: () => Navigator.pop(context, true),
            child: const SizedBox(
              width: 70,
              height: 40,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          title: FormStrings.loginAppbarTitle,
        ),
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
                    FormStrings.youHaveAccount,
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
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: darkBlueColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgetPasswordScreen.screenId);
                        },
                        child: Text(
                          FormStrings.forgetPasswordText,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: darkBlueColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: darkBlueColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegiseterScreen.screenId);
                        },
                        child: Text(
                          FormStrings.dontHaveAccount,
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthInitialState) {
                        return AppBlueButton(
                          title: FormStrings.loginButtonText,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginEvent(
                                  phone: _mobileController.text,
                                  password: _passwordController.text,
                                  timezone: AuthManager.readTimezone(),
                                  mac: 'RP1A.200720.011',
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: whiteColor,
                                    title: Text(
                                      FormStrings.warning,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: darkBlueColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Text(
                                      FormStrings.completeInput,
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
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
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
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
                        );
                      }
                      if (state is AuthLoadingState) {
                        return const SpinKitCircle(color: Colors.black);
                      }
                      if (state is AuthLoginResponseState) {
                        Widget? result;
                        state.loginResponse.fold(
                          (l) {
                            result = l;
                          },
                          (r) {
                            result = r;
                            SchedulerBinding.instance.addPostFrameCallback(
                              (timeStamp) {
                                Navigator.pushNamed(
                                    context, MainScreen.screenId);
                              },
                            );
                          },
                        );
                        return Column(
                          children: [
                            result ?? const SizedBox(),
                            SizedBox(height: size.height * 0.03),
                            AppBlueButton(
                              title: FormStrings.loginButtonText,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    AuthLoginEvent(
                                      phone: _mobileController.text,
                                      password: _passwordController.text,
                                      timezone: AuthManager.readTimezone(),
                                      mac: 'RP1A.200720.011',
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: whiteColor,
                                        title: Text(
                                          FormStrings.warning,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: darkBlueColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: Text(
                                          FormStrings.completeInput,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
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
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
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
                        );
                      }
                      return Text(
                        'خطای نا مشخص',
                        style: theme.textTheme.titleLarge,
                      );
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
