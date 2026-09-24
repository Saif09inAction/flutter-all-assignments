import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:flutter/material.dart';  

final nameProvider = Provider<String>((ref) => 'Riverpod');  

class MyApp extends ConsumerWidget {   
  const MyApp({super.key});    
  
  @override   
  Widget build(BuildContext context, WidgetRef ref) {     
    // Fetch the provider state
    final name = ref.watch(nameProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(name),
        ),
      ),
    );   
  } 
}  

void main() {   
  runApp(const ProviderScope(child: MyApp())); 
}