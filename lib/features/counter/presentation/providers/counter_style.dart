import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:shared_with_firebase/features/counter/domain/models/counter_model.dart';
import 'package:shared_with_firebase/features/counter/domain/providers/counter.dart';

part 'counter_style.g.dart';

@riverpod
TextStyle counterStyle(Ref ref) {
  final counterAsync = ref.watch(counterProvider);

  return counterAsync.when(
    data: (CounterModel model) {
      final value = model.value;
      if (value > 15) return TextStyle(fontSize: 45, color: Colors.green);
      if (value > 10) return TextStyle(fontSize: 35, color: Colors.blue);
      return TextStyle(fontSize: 25, color: Colors.red);
    },
    error: (_, __) => TextStyle(fontSize: 15, color: Colors.black),
    loading: () => TextStyle(fontSize: 15, color: Colors.black),
  );
}
