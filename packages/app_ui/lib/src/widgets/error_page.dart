import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Error500View extends StatelessWidget {
  const Error500View({
    super.key,
    this.onRetry,
    this.customMessage,
    this.showBackButton = false,
    this.onBack,
  });

  final VoidCallback? onRetry;
  final String? customMessage;
  final bool showBackButton;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 80,
                color: isDarkMode ? Colors.red[300] : Colors.red,
              ),
              const SizedBox(height: 15),
              const Text(
                '500 - Server Error',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                customMessage ?? 'Something went wrong, please try again.',
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Button row with conditional back button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showBackButton) ...[
                    ShadButton.outline(
                      onPressed: onBack ?? () => Navigator.maybePop(context),
                      child: Text(
                        'Back',
                        style: TextStyle(color: theme.colorScheme.foreground),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  _buildRetryButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRetryButton(BuildContext context) {
    return ShadButton.destructive(
      onPressed: onRetry,
      child: Text(
        'Retry',
        style: TextStyle(
          color: ShadTheme.of(context).colorScheme.foreground,
        ),
      ),
    );
  }
}
