import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialedNumNotifier extends StateNotifier<TextEditingController> {
  DialedNumNotifier() : super(TextEditingController());

  
  void onDigitTap(String digit) {
    debugPrint(digit);
    int cursorPosition = state.selection.baseOffset;
    debugPrint("Cursor Po: $cursorPosition");
    final int numLen = state.text.length;

    if (cursorPosition == numLen) {
      state.text += digit;
      debugPrint(state.text);
    }
    else {
      adddigitAt(cursorPosition, digit);
      cursorPosition += 1;
      state.selection = TextSelection.fromPosition(TextPosition(offset: cursorPosition));
      debugPrint("In else:");
      debugPrint("In else : ${state.text}");
    }

  }

  void adddigitAt(int index, String digit) {
    final int numLen = state.text.length;
    //debugPrint("..........${state.text.substring(0,0)}");
    if (index >= 0 && index < numLen) {
      state.text = state.text.substring(0, index) + digit + state.text.substring(index);
    }
  }

  void onBackspaceTap() {
    final int numLen = state.text.length;
    int cursorPosition = state.selection.baseOffset;
    debugPrint("cursorPosition : $cursorPosition");
    debugPrint("numLen : $numLen");
    if(/*cursorPosition == -1 ||*/ cursorPosition == numLen) {
      //removing the last digit
      state.text = numLen != 0 ? state.text.substring(0, numLen - 1) : "";
    }
    else {
      //removing the middle digit
      removeDigitAt(cursorPosition - 1);
      cursorPosition -= 1;
      if (cursorPosition < 0) {
        cursorPosition = 0;
      } else if (cursorPosition > numLen) {
        cursorPosition = numLen;
      } else {
        state.selection = TextSelection.fromPosition(TextPosition(offset: cursorPosition));
      }
    }
  }

  void removeDigitAt(int index) {
    final int numLen = state.text.length;
    if (index >= 0 && index < numLen) {
      //debugPrint(state.text);
      //debugPrint(state.text.substring(0, index));
      //debugPrint(state.text.substring(index + 1));
      state.text = state.text.substring(0, index) + state.text.substring(index + 1);
      //debugPrint(state.text);

    }
  }

}

final dialNumProvider =
    StateNotifierProvider<DialedNumNotifier, TextEditingController>(
  (ref) => DialedNumNotifier(),
);
