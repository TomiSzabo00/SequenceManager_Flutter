import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/helpers/api.dart';
import 'package:sequence_manager/models/sequence.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/user/user_viewmodel.dart';

class UserWaitingScreen extends StatefulWidget {
  const UserWaitingScreen(
      {super.key, required this.sequence, required this.user});
  final Sequence sequence;
  final User user;

  @override
  UserWaitingScreenState createState() => UserWaitingScreenState();
}

class UserWaitingScreenState extends State<UserWaitingScreen> {
  @override
  void initState() {
    super.initState();
    API.instance.connectToWebSocket();
  }

  @override
  void dispose() {
    API.instance.disconnectFromWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stand in line"),
        leading: null,
      ),
      body: Center(
        child: StreamBuilder(
            stream: API.instance.listenToSequenceChanges(widget.user),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return screenContents(widget.sequence);
              }
              final sequence = snapshot.data as Sequence;
              return screenContents(sequence);
            }),
      ),
    );
  }

  Widget screenContents(Sequence sequence) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Your number:"),
        Text(
          sequence.sequence.toString(),
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          (sequence.queueUsersCount ?? 0) <= 1
              ? "Go to the counter"
              : "${(sequence.queueUsersCount ?? 0) - 1} people are ahead of you",
          style: const TextStyle(fontSize: 16),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Text(
          sequence.location ?? "",
          style: const TextStyle(fontSize: 16),
        ),
        FractionallySizedBox(
          widthFactor: 0.75, // 75% of the screen width
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<UserViewModel>().deleteNumber();
              },
              child: const Text("Delete"),
            ),
          ),
        ),
      ],
    );
  }
}
