import 'package:demo/providers.dart';
import 'package:demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme_data.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModel = ref.watch(appThemeProvider);

    return MaterialApp(
        theme: AppThemeData.fromSeedColor(
          themeModel.seedColor,
        ),
        darkTheme: AppThemeData.fromSeedColor(
          themeModel.seedColor,
          darkMode: true,
        ),
        themeMode: themeModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final provider = CountGeneratorProvider(initialValue: 10);
    final value = ref.watch(provider);
    final themeModel = ref.watch(appThemeProvider);
    final seedColor = themeModel.seedColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example'),
        centerTitle: false,
        elevation: 6,
        actions: [
          // color picker button
          IconButton(
            onPressed: () {
              // show color picker
              showColorPicker(
                context,
                seedColor,
                onPicked: (color) {
                  if (color == null) return;
                  ref.read(appThemeProvider.notifier).setSeedColor(color);
                },
              );
            },
            icon: Icon(
              Icons.color_lens,
              color: seedColor,
            ),
          ),
          // light/dark switch
          Switch(
            value: themeModel.isDarkMode,
            onChanged: (value) {
              ref.read(appThemeProvider.notifier).setDarkMode(value);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // increment index
          ref.read(provider.notifier).resetIndex();
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            value.when(
              data: (text) {
                return Text(
                  text,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colorScheme.onBackground,
                      ),
                );
              },
              error: (error, trace) {
                return Text(
                  'Error: $error',
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('You clicked me!!!'),
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: const Text('Elevated Button'),
            ),
          ],
        ),
      ),
    );
  }
}
