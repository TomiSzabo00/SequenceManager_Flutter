import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sequence_manager/screens/global/alert_viewmodel.dart';

class AlertWrapper<T extends ChangeNotifier> extends StatelessWidget {
  final AlertViewModel viewModel;
  final Widget Function(BuildContext, AlertViewModel) builder;

  const AlertWrapper({
    Key? key,
    required this.viewModel,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<AlertViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.alertMessage != null) {
            Future.delayed(Duration.zero, () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text(viewModel.alertMessage!),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          viewModel.alertMessage = null;
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            });
          }
          return builder(context, viewModel);
        },
      ),
    );
  }
}
