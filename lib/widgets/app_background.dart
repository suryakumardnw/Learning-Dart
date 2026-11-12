import 'package:flutter/material.dart';

/// A soft background used by content screens.
///
/// Pass [imageAsset] to show a photo behind a translucent white scrim.
class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child, this.imageAsset});

  final Widget child;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final image = imageAsset;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (image != null)
          Image.asset(image, fit: BoxFit.cover)
        else
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.primary.withAlpha(24),
                  theme.scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
        if (image != null)
          const ColoredBox(color: Color.fromRGBO(255, 255, 255, 0.9)),
        SafeArea(child: child),
      ],
    );
  }
}
