import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_with_firebase/features/counter/domain/models/counter_model.dart';

class CounterRepository {
  static const stringCounterKey = 'counter';

  Future<CounterModel> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final String? counterJson = prefs.getString(stringCounterKey);

    if (counterJson == null) {
      return CounterModel.initial();
    }

    try {
      return CounterModel.fromJson(jsonDecode(counterJson));
    } catch (e) {
      return CounterModel.initial();
    }
  }

  Future<void> saveCounter(int value) async {
    final prefs = await SharedPreferences.getInstance();
    final model = CounterModel(value: value, lastUpdated: DateTime.now());

    await prefs.setString(stringCounterKey, jsonEncode(model.toJson()));
  }
}
