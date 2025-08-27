import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrimaryPageIndex extends StateNotifier<PageController> {
  PrimaryPageIndex() : super(PageController(initialPage: 0));

  setIndex(int index) {
    state = PageController(initialPage: index);
  }
}

final primaryPageIndexProvider =
    StateNotifierProvider.autoDispose<PrimaryPageIndex, PageController>((ref) {
  return PrimaryPageIndex();
});
