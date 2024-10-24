import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';

final deviceDimensionsProvider = StateProvider<Size>((ref) {
  return Size(0,0);
});