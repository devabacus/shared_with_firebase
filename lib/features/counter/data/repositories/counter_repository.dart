import 'package:shared_preferences/shared_preferences.dart';

class CounterRepository {
  static const stringCounterKey = 'counter';

  Future<int> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(stringCounterKey) ?? 0;
  }

  Future<void> saveCounter(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(stringCounterKey, value);
  }
}
