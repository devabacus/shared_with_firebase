import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_with_firebase/features/counter/data/providers/repository_providers.dart';
import 'package:shared_with_firebase/features/counter/domain/models/counter_model.dart';

part 'counter.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  FutureOr<CounterModel> build() {
    final counterRepository = ref.watch(counterRepositoryProvider);
    return counterRepository.getCounter();
  }

  Future<void> increment() async {
    final counterRepository = ref.read(counterRepositoryProvider);
    final currentState = await future;

    await counterRepository.saveCounter(currentState + 1);
    state = AsyncData(currentState + 1);
  }

  Future<void> reset() async {
    final counterRepository = ref.read(counterRepositoryProvider);
    counterRepository.saveCounter(0);
    state = AsyncData(0);
  }
}
