import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_logs_and_messages/provider/dialed_num_provider.dart';
//import 'package:google_fonts/google_fonts.dart';

class DialButton extends ConsumerWidget {
  const DialButton({super.key, required this.text, /*required this.semanticLabel*/});

  final String text;
  //final String semanticLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print(text);
    return InkWell(
      onTap: () => ref.read(dialNumProvider.notifier).onDigitTap(text) ,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 27,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
