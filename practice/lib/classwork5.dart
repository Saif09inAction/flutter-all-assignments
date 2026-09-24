import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserNotifier extends Notifier<String> {
  @override
  String build() {
    return 'Agent 007';
  }

  void set(String name) {
    state = name;
  }
}

final userProvider =
    NotifierProvider<UserNotifier, String>(UserNotifier.new);

final router = GoRouter(
  initialLocation: '/shell/details/TargetAcquired',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Undercover Agent Switcher'),
          ),
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/shell/details/:name',
          name: 'details',
          builder: (context, state) {
            return DetailScreen(
              name: state.pathParameters['name']!,
            );
          },
        ),
      ],
    ),
  ],
);

class DetailScreen extends ConsumerWidget {
  final String name;

  const DetailScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(userProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$username: $name',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              ref
                  .read(userProvider.notifier)
                  .set('Supreme Ninja');
            },
            child: const Text('Activate Alias'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Undercover Agent Switcher',
      routerConfig: router,
    );
  }
}