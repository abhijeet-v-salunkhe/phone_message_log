import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:phone_logs_and_messages/Widgets/detail_call_log_item.dart';

class CallLogList extends StatelessWidget {
  const CallLogList({super.key, required this.currentCallLogs});
  final Future<Iterable<CallLogEntry>> currentCallLogs;
  @override
  Widget build(BuildContext context) {
    //print("currentCallLog : ----> ${currentCallLogs == null}");
    return FutureBuilder(
      future: currentCallLogs,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center();
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text("No call logs Available"),);
        }
        
        final Iterable<CallLogEntry> entries = snapshot.data!;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
    
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Call logs (${entries.isNotEmpty ? entries.length : 0})",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 14),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (context, index) => DetailCallLogItem(
                        currentCallLog: entries.elementAt(index)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
