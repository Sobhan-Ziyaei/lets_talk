import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/bloc/authentication/auth_bloc.dart';
import 'package:lets_talk/bloc/authentication/auth_event.dart';
import 'package:lets_talk/bloc/authentication/auth_state.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/level_choose_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_blue_button.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';
import 'package:lets_talk/util/auth_manager.dart';
import 'package:lets_talk/util/timezone.dart';

class RegisterScreen2 extends StatefulWidget {
  RegisterScreen2({Key? key, this.userInfo}) : super(key: key);
  List<String>? userInfo;
  static const screenId = '/register_screen2';
  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nationality = '';
  String gender = '';
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isGenderSelected = false;
  bool isNationalitySelected = false;
  String id = '';
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final String timezone =
      timezoneLocation[DateTime.now().timeZoneOffset.inMilliseconds]!;

  @override
  void initState() {
    super.initState();
    getMac();
    AuthManager.saveTimezone(timezone);
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
              onTap: () => Navigator.pop(context),
              child: const SizedBox(
                width: 70,
                height: 40,
                child: Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            title: FormStrings.registerAppbarTitle),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Text(
                        FormStrings.registerScreenTitle,
                        style:
                            theme.textTheme.titleLarge?.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.08),
                        child: Row(
                          children: [
                            Visibility(
                              visible: isMaleSelected,
                              child: Text(FormStrings.male,
                                  style: theme.textTheme.titleLarge),
                            ),
                            const Spacer(),
                            Visibility(
                              visible: isFemaleSelected,
                              child: Text(FormStrings.female,
                                  style: theme.textTheme.titleLarge),
                            ),
                            SizedBox(width: size.width * 0.20),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.08),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isMaleSelected = !isMaleSelected;
                                      isFemaleSelected = false;
                                      isGenderSelected = true;
                                      gender = 'ML';
                                    });
                                  },
                                  child: Container(
                                    height: size.height * 0.15,
                                    decoration: BoxDecoration(
                                      color: isMaleSelected
                                          ? darkGreyColor
                                          : milkyColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                        Assets.images.svg.maleImg.path),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.15),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isFemaleSelected = !isFemaleSelected;
                                      isMaleSelected = false;
                                      isGenderSelected = true;
                                      gender = 'FL';
                                    });
                                  },
                                  child: Container(
                                    height: size.height * 0.15,
                                    decoration: BoxDecoration(
                                      color: isFemaleSelected
                                          ? darkGreyColor
                                          : milkyColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                      Assets.images.svg.femaleImg.path,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.07),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.05),
                          Row(
                            children: [
                              Text(
                                FormStrings.name,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.text,
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
                          SizedBox(height: size.height * 0.10),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: darkBlueColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      setState(() {
                                        nationality = country.name;
                                        isNationalitySelected = true;
                                      });
                                    },
                                  );
                                },
                                child: Text(
                                  FormStrings.nationality,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                      color: whiteColor, fontSize: 15),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                nationality,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: darkBlueColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: size.width * 0.10),
                            ],
                          ),
                          const Spacer(),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is AuthInitialState) {
                                return AppBlueButton(
                                  title: FormStrings.registerAppbarTitle,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate() &&
                                        isNationalitySelected &&
                                        isGenderSelected) {
                                      BlocProvider.of<AuthBloc>(context).add(
                                        AuthRegisterEvent(
                                          username: _nameController.text,
                                          phone: widget.userInfo![0],
                                          password: widget.userInfo![1],
                                          nationality: nationality,
                                          gender: gender,
                                          timezone: timezone,
                                          mac: id,
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
                                                  backgroundColor:
                                                      darkBlueColor,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  FormStrings.returnText,
                                                  style: theme
                                                      .textTheme.bodySmall
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
                              if (state is AuthRegisterResponseState) {
                                Widget? result;
                                state.registerResponse.fold(
                                  (l) {
                                    result = l;
                                  },
                                  (r) {
                                    result = r;
                                    SchedulerBinding.instance
                                        .addPostFrameCallback(
                                      (timeStamp) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return BlocProvider(
                                                create: (context) => AuthBloc(),
                                                child:
                                                    const LevelChooseScreen(),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                                return Column(
                                  children: [
                                    result ?? const SizedBox(),
                                    SizedBox(height: size.height * 0.03),
                                    AppBlueButton(
                                      title: FormStrings.registerAppbarTitle,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          BlocProvider.of<AuthBloc>(context)
                                              .add(
                                            AuthRegisterEvent(
                                                username: _nameController.text,
                                                phone: widget.userInfo![0],
                                                password: widget.userInfo![1],
                                                nationality: nationality,
                                                gender: gender,
                                                timezone: timezone,
                                                mac: id),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: whiteColor,
                                                title: Text(
                                                  FormStrings.warning,
                                                  style: theme
                                                      .textTheme.bodySmall
                                                      ?.copyWith(
                                                    color: darkBlueColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                content: Text(
                                                  FormStrings.completeInput,
                                                  style: theme
                                                      .textTheme.bodySmall
                                                      ?.copyWith(
                                                    color: darkBlueColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          darkBlueColor,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      FormStrings.returnText,
                                                      style: theme
                                                          .textTheme.bodySmall
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
                              return Text('خطای نامشخص',
                                  style: theme.textTheme.titleLarge);
                            },
                          ),
                          SizedBox(height: size.height * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getMac() async {
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          id = build.id;
          AuthManager.saveMac(id);
        });
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          id = data.identifierForVendor ?? '' ;
          AuthManager.saveMac(id);
        });
      }
      print('alive');
    } catch (e) {
      print('Error getting MAC address: $e');
    }
  }
}
