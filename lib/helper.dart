import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

Future<Iterable<CallLogEntry>> getAllCallLogs() {
  return CallLog.get();
}

String getTitle(CallLogEntry entry) {
  // if (entry.name == null) return entry.number!;
  // if (entry.name!.isEmpty) return entry.number!;
  if (entry.name?.isEmpty ?? true) return entry.number!;
  return entry.name!;
}

String getAvatarTitle(CallLogEntry entry) {
  String title = getTitle(entry).replaceAll("+", '').replaceAll(" ", '').substring(0,2);
  return title;
}

Icon getCallTypeIcon(CallType callType) {
  Map<String, dynamic> iconData;

  switch (callType) {
    case CallType.outgoing:
      iconData = {"color": Colors.green, "icon": Icons.call_made_rounded};
    case CallType.incoming:
      iconData = {"color": Colors.green, "icon": Icons.call_received_rounded};
    case CallType.missed:
      iconData = {"color": Colors.red, "icon": Icons.call_missed_rounded};
    case CallType.rejected:
      iconData = {
        "color": Colors.grey,
        "icon": Icons.remove_circle_outline_rounded
      };

    default:
      iconData = {"color": Colors.grey, "icon": Icons.report_problem_rounded};
  }

  return Icon(
    IconData(iconData["icon"]),
    color: iconData["color"],
    size: 14,
  );
}

Widget permissionDialogBox(
    {String msg = 'Allow "Call logs" to make and view Calls',
    required Function allowFunction,
    required Function closeAppFunction}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Permission Denied",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    closeAppFunction();
                  },
                  child: const Text(
                    'Close App',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    allowFunction();
                  },
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
