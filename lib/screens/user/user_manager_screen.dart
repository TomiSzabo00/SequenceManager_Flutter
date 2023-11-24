import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/models/sequence.dart';
import 'package:sequence_manager/models/user.dart';
import 'package:sequence_manager/screens/user/user_get_number_screen.dart';
import 'package:sequence_manager/screens/user/user_viewmodel.dart';
import 'package:sequence_manager/screens/user/user_waiting_screen.dart';

class UserManagerScreen extends StatefulWidget {
  const UserManagerScreen(
      {Key? key, required this.user, required this.onLogout})
      : super(key: key);
  final User user;
  final Function? onLogout;

  @override
  UserManagerScreenState createState() => UserManagerScreenState();
}

class UserManagerScreenState extends State<UserManagerScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).getUserSequence();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>();
    return StreamBuilder(
      stream: viewModel.listenToSequence(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final sequence = snapshot.data as Sequence;
          if (sequence.sequence == null) {
            return UserGetNumberScreen(
                user: widget.user, onLogout: widget.onLogout);
          }
          return UserWaitingScreen(sequence: sequence);
        } else {
          return UserGetNumberScreen(
                user: widget.user, onLogout: widget.onLogout);
        }
      },
    );
  }
}
