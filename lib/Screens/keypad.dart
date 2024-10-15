import 'package:flutter/material.dart';
import 'package:phone_logs_and_messages/Widgets/dialpad.dart';
import 'package:phone_logs_and_messages/Widgets/entered_number_field.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //const Spacer(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.18,),
        const EnteredNumberField(),  // This pushes the DialPad down
        const Expanded(  // Use flex to control the size of the DialPad area
          child: DialPad(),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.10,)
      ],
    );
  }
}
