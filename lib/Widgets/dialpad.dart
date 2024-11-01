import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_logs_and_messages/Widgets/dial_button.dart';
import 'package:phone_logs_and_messages/provider/dialed_num_provider.dart';

class DialPad extends ConsumerWidget {
  const DialPad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController dialedNumber = ref.watch(dialNumProvider);
    return Container(
      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      color: const Color.fromARGB(31, 2, 2, 221),
      margin: const EdgeInsets.all(15.0),
      // height: 700,
      child: Table(
        children: [
          TableRow(
            children: List.generate(
              3,
              (index) => DialButton(text: "${index + 1}"),
            ),
          ),
          TableRow(
            children: List.generate(
              3,
              (index) => DialButton(text: "${index + 4}"),
            ),
          ),
          TableRow(
            children: List.generate(
              3,
              (index) => DialButton(text: "${index + 7}"),
            ),
          ),
          const TableRow(
            children: [
              DialButton(text: "*"),
              DialButton(text: "0"),
              DialButton(text: "#"),
            ],
          ),
          TableRow(
            children: [
              Container(), // Empty space where there is no button
              InkWell(
                onTap:
                    // Handle call button press
                    () async {
                  if (dialedNumber.text.isNotEmpty) {
                    await FlutterPhoneDirectCaller.callNumber(
                        dialedNumber.text);
                    //print("Call button pressed");
                  }
                },
                child: const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.call, color: Colors.green, size: 40),
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle backspace/delete action
                  //print("Backspace button pressed");
                  // Add the functionality to remove the last digit
                  ref.watch(dialNumProvider.notifier).onBackspaceTap();
                },
                child: const Icon(
                  Icons.backspace,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
