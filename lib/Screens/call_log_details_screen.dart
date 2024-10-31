import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_logs_and_messages/Widgets/DetailsScreenWidget/call_log_list.dart';
import 'package:phone_logs_and_messages/Widgets/DetailsScreenWidget/call_section.dart';
import 'package:phone_logs_and_messages/Widgets/DetailsScreenWidget/header.dart';
import 'package:phone_logs_and_messages/helper.dart';
import 'package:phone_logs_and_messages/provider/device_dimensions_provider.dart';

class CallLogDetailsScreen extends ConsumerStatefulWidget {
  const CallLogDetailsScreen({super.key, required this.currentCallLog});

  final CallLogEntry currentCallLog;

  @override
  ConsumerState<CallLogDetailsScreen> createState() {
    return _CallLogDetailsScreenState();
  }
}

class _CallLogDetailsScreenState extends ConsumerState<CallLogDetailsScreen> {
  late Future<Iterable<CallLogEntry>> currentCallLogs;
  late Size sizeOfScreen;
  @override
  void initState() {
    super.initState();
    currentCallLogs = getCurrentCallLogs(widget.currentCallLog);
    sizeOfScreen = ref.read(deviceDimensionsProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: sizeOfScreen.width < 600
          ? Column(
              children: [
                Header(currentCallLog: widget.currentCallLog),
                const SizedBox(
                  height: 20,
                ),
                CallSection(currentCallLog: widget.currentCallLog),
                const SizedBox(
                  height: 10,
                ),
                CallLogList(currentCallLogs: currentCallLogs),
              ],
            )
          : Row(
              children: [
                Header(currentCallLog: widget.currentCallLog),
                const SizedBox(
                  width: 20,
                ),
                CallSection(currentCallLog: widget.currentCallLog),
                const SizedBox(
                  width: 10,
                ),
                CallLogList(currentCallLogs: currentCallLogs),
              ],
            ),
    );
  }
}
