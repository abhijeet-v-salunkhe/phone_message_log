import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:phone_logs_and_messages/helper.dart';

class DetailCallLogItem extends StatelessWidget {
  const DetailCallLogItem({super.key, required this.currentCallLog});

  final CallLogEntry currentCallLog;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "${getCallLogType(currentCallLog)} ${getCallDuration(currentCallLog)}",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Text(
        formatDateTime(currentCallLog.timestamp!),
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
