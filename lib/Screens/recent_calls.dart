import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:phone_logs_and_messages/Screens/call_log_details_screen.dart';
import 'package:phone_logs_and_messages/Widgets/call_log_item.dart';
import 'package:phone_logs_and_messages/helper.dart';

class RecentCalls extends StatefulWidget {
  const RecentCalls({super.key});

  @override
  State<RecentCalls> createState() {
    return _RecentCallsState();
  }
}

class _RecentCallsState extends State<RecentCalls> with WidgetsBindingObserver {
  late Future<Iterable<CallLogEntry>> allCalllogs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    allCalllogs = getAllCallLogs();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        allCalllogs = getAllCallLogs();
      });
    }
  }

  void _onClickInfo(BuildContext context, CallLogEntry currentCallLog) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => CallLogDetailsScreen(currentCallLog: currentCallLog),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recents"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(
            future: allCalllogs,
            builder: (context, snapshot) {
              
              if (!snapshot.hasData || snapshot.hasError) {
                  return const Center(child: Text("Not call Logs available"),);
              }
              
              if (snapshot.connectionState == ConnectionState.done) {
                final List<CallLogEntry> entries = snapshot.data!.toList();

                return ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) => CallLogItem(
                    currentCallLog: entries[index],
                    onClickInfo: () {
                      _onClickInfo(context, entries[index]);
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
