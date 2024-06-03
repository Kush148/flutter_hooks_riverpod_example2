import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class CounterProvider extends StateNotifier<int> {
  CounterProvider() : super(1);

  void increment() => state++;

  /*int get value {
    return state;
  }*/
}

final counterProvider = StateNotifierProvider<CounterProvider,int?>((ref) => CounterProvider());

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final counter = ref.watch(counterProvider);
    final text = counter.toString();
    print('text');
    print(text);
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: const Text(
              'Click me',
            ),
          ),
        ],
      ),
    );
  }
}
