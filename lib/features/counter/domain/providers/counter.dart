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

    final newModel = currentState.copyWith(
      value: currentState.value + 1,
      lastUpdated: DateTime.now(),
    );

    await counterRepository.saveCounter(newModel.value);
    state = AsyncData(newModel);
  }

  Future<void> reset() async {
    final counterRepository = ref.read(counterRepositoryProvider);
    final newModel = CounterModel.initial();

    await counterRepository.saveCounter(newModel.value);
    state = AsyncData(newModel);
  }
}
