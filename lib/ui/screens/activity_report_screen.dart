import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';

class ActivityReportScreen extends StatefulWidget {
  ActivityReportScreen({Key? key}) : super(key: key);
  static const screenId = 'activity_report_screen';
  @override
  State<ActivityReportScreen> createState() => _ActivityReportScreenState();
}

class _ActivityReportScreenState extends State<ActivityReportScreen> {
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
            title: ActivityReportStrings.activityReportAppbarTitle),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: EasyDateTimeLine(
                  headerProps: const EasyHeaderProps(
                    selectedDateFormat: SelectedDateFormat.fullDateDMY,
                    monthStyle: TextStyle(
                      color: darkBlueColor,
                    ),
                  ),
                  initialDate: DateTime.now(),
                  activeColor: darkBlueColor,
                  onDateChange: (selectedDate) {},
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.images.svg.activityProcessSampleImg.path,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: milkyColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.02,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ActivityReportStrings.grammer,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: darkBlueColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Text(
                                  ActivityReportStrings.completeSample1,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: mediumBlueColor,
                                  ),
                                ),
                                const Spacer(),
                                const ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: LinearProgressIndicator(
                                    minHeight: 10,
                                    value: 0.5,
                                    backgroundColor: darkGreyColor,
                                    color: mediumBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: milkyColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.02,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ActivityReportStrings.procurance,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: darkBlueColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Text(
                                  ActivityReportStrings.completeSample2,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: greenColor,
                                  ),
                                ),
                                const Spacer(),
                                const ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: LinearProgressIndicator(
                                    minHeight: 10,
                                    value: 0.34,
                                    backgroundColor: darkGreyColor,
                                    color: greenColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  decoration: const BoxDecoration(
                    color: milkyColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.02,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ActivityReportStrings.timeRecord,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: darkBlueColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              ActivityReportStrings.timeRecordSample,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: mediumBlueColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Center(
                          child: SvgPicture.asset(
                            Assets.images.svg.timeRecordImg.path,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
