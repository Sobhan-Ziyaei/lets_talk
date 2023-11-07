import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_talk/bloc/environment/environment_bloc.dart';
import 'package:lets_talk/data/models/environment.dart';
import 'package:lets_talk/ui/theme/colors.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key, required this.roleIdUser, required this.roleIdAi})
      : super(key: key);
  int roleIdUser;
  int roleIdAi;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: BlocProvider(
        create: (context) => ChatBloc(),
        child: ChatContent(
            roleIdUser: widget.roleIdUser, roleIdAi: widget.roleIdAi),
      ),
    );
  }
}

class ChatContent extends StatefulWidget {
  ChatContent({Key? key, required this.roleIdUser, required this.roleIdAi})
      : super(key: key);
  int roleIdUser;
  int roleIdAi;

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  late ChatBloc chatBloc;

  @override
  void initState() {
    super.initState();

    chatBloc = context.read<ChatBloc>();
    chatBloc.loadChats(widget.roleIdUser, widget.roleIdAi);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, List<EnvironmentChat>>(
            builder: (context, chatList) {
              return ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      chatList[index].messageChat,
                      style: TextStyle(color: blackColor),
                    ),
                  );
                },
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            chatBloc.nextChat();
          },
          child: Text('بعدی'),
        ),
      ],
    );
  }
}
