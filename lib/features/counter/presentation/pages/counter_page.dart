import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("counter_value", style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){}, child: Text("Add", style: TextStyle(fontSize: 20)),)
          ],
        ),
      ),
    );
  }
}
