import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lets_talk/bloc/grammer/grammer_bloc.dart';
import 'package:lets_talk/bloc/grammer/grammer_event.dart';
import 'package:lets_talk/bloc/grammer/grammer_state.dart';
import 'package:lets_talk/ui/theme/colors.dart';

class GrammerLessonScreen extends StatefulWidget {
  GrammerLessonScreen({Key? key, required this.id,required this.level}) : super(key: key);
  String id;
  String level ;
  @override
  State<GrammerLessonScreen> createState() => _GrammerLessonScreenState();
}

class _GrammerLessonScreenState extends State<GrammerLessonScreen> {
  @override
  void initState() {
    BlocProvider.of<GrammerBloc>(context)
        .add(GrammerContentEvent(id: widget.id,level: widget.level));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GrammerBloc, GrammerState>(
          builder: (context, state) {
            if (state is GrammerLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is GrammerContentResponseState) {
              return state.grammerContentResponse.fold(
                (l) {
                  return l;
                },
                (r) {
                  return SingleChildScrollView(
                    child: Html(
                      data: r!.content,
                    ),
                  );
                },
              );
            }
            return const Text('Error');
          },
        ),
      ),
    );
  }
}
