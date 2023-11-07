import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lets_talk/bloc/environment/environment_bloc.dart';
import 'package:lets_talk/bloc/environment/environment_event.dart';
import 'package:lets_talk/bloc/environment/environment_state.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/environment%20&%20role%20screens%20&%20chat%20screens/conversion_screen.dart';
import 'package:lets_talk/ui/screens/environment%20&%20role%20screens%20&%20chat%20screens/test_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';
import 'package:lets_talk/ui/widgets/choose_role_card.dart';

class RoleScreen extends StatefulWidget {
  RoleScreen({Key? key, required this.id}) : super(key: key);
  static const screenId = '/airplane_environment';
  int id;
  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  void initState() {
    BlocProvider.of<EnvironmentBloc>(context)
        .add(EnvironmentRoleEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
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
          title: AirplaneEnvironment.appbarTitle,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height * 0.03),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                Assets.images.png.airportImg.image(),
                SizedBox(height: size.height * 0.08),
                Text(
                  AirplaneEnvironment.mainTitle,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: size.height * 0.15),
                Row(
                  children: [
                    Text(
                      AirplaneEnvironment.chooseRole,
                      style: theme.textTheme.titleLarge,
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ConversationScreen.screenId,
                          );
                        },
                        child: BlocBuilder<EnvironmentBloc, EnvironmentState>(
                          builder: (context, state) {
                            if (state is EnvironmentInitialState &&
                                state is EnvironmentLoadingState) {
                              return const SpinKitCircle(
                                color: Colors.black,
                              );
                            }
                            if (state is EnvironmentRoleResponseStata) {
                              return state.environmentRoleListResponse.fold(
                                (l) {
                                  return Column(
                                    children: [
                                      Text(
                                        'Error to get Data',
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(color: redColor),
                                      ),
                                      SizedBox(height: size.height * 0.0),
                                      const SpinKitCircle(
                                        color: Colors.black,
                                      ),
                                    ],
                                  );
                                },
                                (r) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return BlocProvider(
                                              create: (context) =>
                                                  EnvironmentBloc(),
                                              child: ChatPage(
                                                roleIdUser: r[0].id,
                                                roleIdAi: r[1].id,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: ChooseRoleCard(
                                      path: Assets
                                          .images.svg.flightAttendantImg.path,
                                      text: r[0].name,
                                    ),
                                  );
                                },
                              );
                            }
                            return const SpinKitCircle(
                              color: Colors.black,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: BlocBuilder<EnvironmentBloc, EnvironmentState>(
                        builder: (context, state) {
                          if (state is EnvironmentInitialState &&
                              state is EnvironmentLoadingState) {
                            return const SpinKitCircle(
                              color: Colors.black,
                            );
                          }
                          if (state is EnvironmentRoleResponseStata) {
                            return state.environmentRoleListResponse.fold(
                              (l) {
                                return Column(
                                  children: [
                                    Text(
                                      'Error to get Data',
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(color: redColor),
                                    ),
                                    SizedBox(height: size.height * 0.0),
                                    const SpinKitCircle(
                                      color: Colors.black,
                                    ),
                                  ],
                                );
                              },
                              (r) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) =>
                                                EnvironmentBloc(),
                                            child: ChatPage(
                                              roleIdUser: r[1].id,
                                              roleIdAi: r[0].id,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: ChooseRoleCard(
                                    path: Assets
                                        .images.svg.flightAttendantImg.path,
                                    text: r[1].name,
                                  ),
                                );
                              },
                            );
                          }
                          return const SpinKitCircle(
                            color: Colors.black,
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
