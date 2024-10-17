import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class CallLogItem extends StatelessWidget {
  const CallLogItem(
      {super.key, required this.currentCallLog, required this.onClickInfo});

  final CallLogEntry currentCallLog;
  final Function() onClickInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 14,
        child: Text(ge),
      ),
    );
  }
}
