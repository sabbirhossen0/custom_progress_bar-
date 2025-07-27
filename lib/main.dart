
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'contact_screen.dart';




void main() {
  runApp(
      MaterialApp(
          home: HomeScreen()
      )
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _goToContactWithLoading(BuildContext context) async {
    // Show Lottie Loading Dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Lottie.asset(
          'assets/lottie/loading.json',
          width: 150,
          height: 150,
        ),
      ),
    );

    // Wait for 2 seconds (simulate loading)
    await Future.delayed(const Duration(seconds: 1));

    // Close the loading dialog
    Navigator.pop(context);

    // Navigate to ContactScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ContactScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goToContactWithLoading(context),
          child: const Text('Go to Contact'),
        ),
      ),
    );
  }
}

