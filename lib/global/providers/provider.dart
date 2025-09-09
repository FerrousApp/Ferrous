import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlurValueState extends StateNotifier<bool> {
  BlurValueState() : super(true) {
    load();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool("blur") ?? false;
    state = saved;
  }

  setState(bool value) async {
    //
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // set state in local storage
    await prefs.setBool('blur', value);

    // set state in UI
    state = value;
  }
}

final blurValueStateProvider =
    StateNotifierProvider.autoDispose<BlurValueState, bool>((ref) {
  return BlurValueState();
});
