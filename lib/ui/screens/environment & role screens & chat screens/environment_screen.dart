import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lets_talk/bloc/environment/environment_bloc.dart';
import 'package:lets_talk/bloc/environment/environment_event.dart';
import 'package:lets_talk/bloc/environment/environment_state.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/environment%20&%20role%20screens%20&%20chat%20screens/role_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';

class EnvironmentScreen extends StatefulWidget {
  EnvironmentScreen({Key? key, required this.id}) : super(key: key);
  static const screenId = '/environment_screen';
  int id;

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  @override
  void initState() {
    BlocProvider.of<EnvironmentBloc>(context)
        .add(EnvironmentTopicEvent(id: widget.id));
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
          title: EnvironmentStrings.environment,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.03),
                      Assets.images.png.airportImg.image(),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        EnvironmentStrings.sampleText,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontFamily: FontFamily.arB,
                          fontSize: 22,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<EnvironmentBloc, EnvironmentState>(
              builder: (context, state) {
                if (state is EnvironmentLoadingState) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                if (state is EnvironmentTopicResponseState) {
                  return state.environmentTopicListResponse.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Column(
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
                        ),
                      );
                    },
                    (r) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return BlocProvider(
                                          create: (context) =>
                                              EnvironmentBloc(),
                                          child: RoleScreen(id: r[index].id),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.height * 0.03),
                                  child: OptionContainer(
                                    text: r[index].name,
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: r.length,
                        ),
                      );
                    },
                  );
                }

                return SliverToBoxAdapter(
                  child: Text(
                    'خطای نامشخص',
                    style: theme.textTheme.titleLarge,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionContainer extends StatelessWidget {
  const OptionContainer({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: size.width,
      height: size.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        boxShadow: const [
          BoxShadow(
            color: lightGreyColor,
            blurRadius: 25.0,
            spreadRadius: 1.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
        child: Row(
          children: [
            Text(
              text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: blackColor,
                fontFamily: FontFamily.arM,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
