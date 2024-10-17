import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recents"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(future: allCalllogs, builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<CallLogEntry> entries = snapshot.data!.toList();

            return ListView.builder(itemBuilder: (context, index) => CallLogItem());
          }
        }),
      ),
    );
  }
}
