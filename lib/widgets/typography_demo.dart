import 'package:flutter/material.dart';

class TypographyDemo extends StatelessWidget {
  const TypographyDemo({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final styles = {
      'displayLarge' : textTheme.displayLarge,
      'displayMedium' : textTheme.displayMedium,
      'displaySmall' : textTheme.displaySmall,
      'headlineLarge' : textTheme.headlineLarge,
      'headlineMedium' : textTheme.headlineMedium,
      'headlineSmall' : textTheme.headlineSmall,
      'titleLarge' : textTheme.titleLarge,
      'titleMedium' : textTheme.titleMedium,
      'titleSmall' : textTheme.titleSmall,
      'labelLarge' : textTheme.labelLarge,
      'labelMedium' : textTheme.labelMedium,
      'labelSmall' : textTheme.labelSmall,
      'bodyLarge' : textTheme.bodyLarge,
      'bodyMedium' : textTheme.bodyMedium,
      'bodySmall' : textTheme.bodySmall,
    };

    return ListView(
      children: [
        for(var e in styles.entries)
          ListTile(title: Text(e.key, style: e.value,),)
      ],
    );
  }
}
