import 'package:flutter/material.dart';
import 'package:flutter_web_formbuilder/screens/home_screen_body.dart';
import 'package:flutter_web_formbuilder/screens/home_screen_toolbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1600),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                title: const Text('Form Builder'),
              ),
              const Expanded(
                child: Row(
                  children: [
                    HomeScreenToolbar(),
                    HomeScreenBody(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
