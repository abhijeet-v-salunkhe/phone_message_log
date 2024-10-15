import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_logs_and_messages/provider/dialed_num_provider.dart';

class EnteredNumberField extends ConsumerStatefulWidget {
  const EnteredNumberField({super.key});

  @override
  ConsumerState<EnteredNumberField> createState() {
    return _EnteredNumberFieldState();
  }
}

class _EnteredNumberFieldState extends ConsumerState<EnteredNumberField> {
  

  @override
  Widget build(BuildContext context) {
    final TextEditingController numController = ref.watch(dialNumProvider);
    debugPrint(numController.text);
    return TextField(
      autofocus: true,
      controller: numController,
      readOnly: true,
      showCursor: true,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.w800,
        fontSize: 25,
      ),
      // decoration: const InputDecoration(

      //     border: InputBorder.none, hintText: "Enter Number"),
      // )
    );
  }
}
