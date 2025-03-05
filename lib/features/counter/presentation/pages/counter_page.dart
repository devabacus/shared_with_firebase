import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_with_firebase/features/counter/domain/providers/counter.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switch (counter) {
              AsyncData(:final value) => Text("value = $value", style: TextStyle(fontSize: 20)),
              AsyncError(:final error) => Text("error $error", style: TextStyle(fontSize: 20)),
              _ => CircularProgressIndicator()
            },
            
            SizedBox(height: 30),
            ElevatedButton(onPressed:() => ref.read(counterProvider.notifier).increment(), child: Text("Увеличить", style: TextStyle(fontSize: 20)),),
            SizedBox(height: 30),
            ElevatedButton(onPressed:() => ref.read(counterProvider.notifier).reset(), child: Text("Сброс", style: TextStyle(fontSize: 20)),)
          ],
        ),
      ),
    );
  }
}
