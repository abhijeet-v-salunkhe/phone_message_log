import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:phone_logs_and_messages/helper.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.currentCallLog});

  final CallLogEntry currentCallLog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    getTitle(currentCallLog),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
