
// lib/main.dart
import 'package:evnt/src/config/all_routes.dart';
import 'package:evnt/src/config/theme.dart';
import 'package:evnt/src/core/local_storage/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for IsarService
final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      title: 'E-vnt',
      theme: appTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}