import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_with_firebase/features/counter/data/repositories/counter_repository.dart';

part 'repository_providers.g.dart';

@riverpod
CounterRepository counterRepository (Ref ref) {
  return CounterRepository();
}

