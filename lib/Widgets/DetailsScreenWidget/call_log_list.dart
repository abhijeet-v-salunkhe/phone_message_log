import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

class CallLogList extends StatelessWidget {
  const CallLogList({super.key, required this.currentCallLogs});
  final Future<Iterable<CallLogEntry>> currentCallLogs;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentCallLogs,
      builder: (context, snapshot) {
        Iterable<CallLogEntry> entries = snapshot.data!;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      "Call logs (${entries.isNotEmpty ? entries.length : 0})"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
