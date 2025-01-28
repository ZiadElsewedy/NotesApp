import 'package:flutter/material.dart';

void showOverlay(BuildContext context, String message) {
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        // Semi-transparent background
        Positioned.fill(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1.0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        // Centered message container with icon
        Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1.0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  CircleAvatar(
                    backgroundColor: Colors.green.withOpacity(0.1),
                    radius: 30,
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Message
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                    textScaleFactor: 1.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  // Insert the overlay
  overlayState?.insert(overlayEntry);

  // Automatically remove the overlay after 2 seconds
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
