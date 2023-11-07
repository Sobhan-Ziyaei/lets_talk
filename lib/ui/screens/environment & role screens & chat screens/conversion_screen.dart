import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lets_talk/data/api/translation_api.dart';
import 'package:lets_talk/data/api/translations.dart';
import 'package:lets_talk/gen/assets.gen.dart';
import 'package:lets_talk/gen/fonts.gen.dart';
import 'package:lets_talk/main.dart';
import 'package:lets_talk/ui/constants/app_strings.dart';
import 'package:lets_talk/ui/screens/main%20screen/main_screen.dart';
import 'package:lets_talk/ui/theme/colors.dart';
import 'package:lets_talk/ui/widgets/app_main_app_bar.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ConversationScreen extends StatefulWidget {
  ConversationScreen({Key? key}) : super(key: key);
  static const screenId = '/conversation_screen';
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

enum TtsState { playing, stopped }

class _ConversationScreenState extends State<ConversationScreen> {
  bool isRecording = false;
  String resultValue = '';
  String selectedText = '';
  String language1 = Translations.languageList.first;
  String language2 = Translations.languageList.last;
  FlutterTts flutterTts = FlutterTts();
  stt.SpeechToText speech = stt.SpeechToText();
  bool _isListening = false;
  bool isVisible = false;
  bool isTranslate = false;
  String voicText = '';

  @override
  void initState() {
    super.initState();
    selectedText = ConversationScreenStrings.sampleChat1;
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              TextButton(
                onPressed: () {
                  globalNavigatorKey.currentState
                      ?.pushNamed(MainScreen.screenId);
                },
                child: const Text('Home Screen'),
              ),
            ],
          ),
        ),
        appBar: AppMainAppBar(
          icon: InkWell(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 70,
              height: 40,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          title: ConversationScreenStrings.appBarTitle,
          drawerIcon: Builder(
            builder: (context) {
              return InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const Icon(Icons.menu),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.03),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: RichText(
                              text: TextSpan(
                                text: ConversationScreenStrings.titleText,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontFamily: FontFamily.arT,
                                  fontSize: 25,
                                  color: darkBlueColor,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ConversationScreenStrings.passengerText,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                        fontFamily: FontFamily.arT,
                                        fontSize: 25,
                                        color: lightBlueColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ConversationScreenStrings.titleText2,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontFamily: FontFamily.arT,
                                      fontSize: 25,
                                      color: darkBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              Assets.images.svg.grammerBannerImg.path,
                              height: size.height * 0.17,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          CircleItem(
                            bgColor: darkOrangeColor,
                            path: Assets.images.svg.flightAttendantImg.path,
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(
                            ConversationScreenStrings.flightAttendant,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: blackColor,
                              fontFamily: FontFamily.arT,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                ChatItem(
                                  playIcon: InkWell(
                                    onTap: () {
                                      textToSpeech(selectedText);
                                    },
                                    child: const Icon(
                                        Icons.play_circle_fill_rounded),
                                  ),
                                  color: darkOrangeColor,
                                  text: resultValue == ''
                                      ? selectedText
                                      : resultValue,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  Assets.images.svg.hintImg.path,
                                ),
                                SizedBox(height: size.height * 0.03),
                                InkWell(
                                  onTap: () async {
                                    if (isTranslate == false) {
                                      String text =
                                          await translateFunc(selectedText);
                                      setState(() {
                                        resultValue = text;
                                        isTranslate = true;
                                      });
                                    } else {
                                      setState(() {
                                        resultValue = selectedText;
                                        isTranslate = false;
                                      });
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    Assets.images.svg.translateImg.path,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: isVisible == true
                                ? ChatItem(
                                    color: darkGreyColor,
                                    text: voicText,
                                    playIcon: InkWell(
                                      onTap: () {
                                        textToSpeech(voicText);
                                      },
                                      child: const Icon(
                                          Icons.play_circle_fill_rounded),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: isVisible == true
                                ? Column(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.images.svg.hintImg.path,
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      InkWell(
                                        onTap: () async {
                                          String text =
                                              await translateFunc(voicText);
                                          setState(() {
                                            voicText = text;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          Assets.images.svg.translateImg.path,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.07,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.2,
                      vertical: size.height * 0.005,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                        color: darkGreyColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          ConversationScreenStrings.cancel,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 16,
                            color: lightOrangeColor,
                          ),
                        ),
                        Container(
                          width: size.height * 0.10,
                          height: size.width * 0.10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient:
                                LinearGradient(colors: micBackgroundColor),
                          ),
                          child: AvatarGlow(
                            animate: _isListening,
                            glowColor: Colors.blue,
                            endRadius: 40,
                            duration: const Duration(milliseconds: 2000),
                            repeatPauseDuration:
                                const Duration(milliseconds: 100),
                            repeat: true,
                            child: InkWell(
                              onTap: () {
                                listen();
                                //startRecording();
                              },
                              child: Icon(
                                _isListening
                                    ? Icons.mic
                                    : Icons.mic_off_outlined,
                                color: whiteColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          ConversationScreenStrings.send,
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: greenColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> translateFunc(String text) async {
    final fromLanguageCode = Translations.getLanguageCode(language1);
    final toLanguageCode = Translations.getLanguageCode(language2);

    final result =
        await TranslationApi.translate(text, fromLanguageCode, toLanguageCode);
    return result;
  }

  Future<void> textToSpeech(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  Future<void> listen() async {
    if (!_isListening) {
      bool available = await speech.initialize();
      if (available) {
        setState(() {
          _isListening = true;
          isVisible = true;
        });

        speech.listen(
          onResult: (result) {
            setState(() {
              voicText = result.recognizedWords;
            });
          },
        );
      } else {
        setState(() {
          _isListening = false;
        });
        await speech.stop();
      }
    } else {
      setState(() {
        _isListening = false;
      });
      await speech.stop();
    }
  }
}

class CircleItem extends StatelessWidget {
  Color bgColor;
  String path;

  CircleItem({
    Key? key,
    required this.bgColor,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.1,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: SvgPicture.asset(
        path,
        width: size.width * 0.05,
        height: size.height * 0.05,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  Color color;
  String text;
  Widget playIcon;
  ChatItem({
    Key? key,
    required this.color,
    required this.text,
    required this.playIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: theme.textTheme.titleLarge?.copyWith(
                color: blackColor,
                fontFamily: FontFamily.arT,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                playIcon,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
