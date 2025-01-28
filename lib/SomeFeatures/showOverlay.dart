
 import 'package:flutter/material.dart';
class showOverlay extends StatelessWidget {
  const showOverlay(BuildContext context, {super.key, required this.message});
final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _showOverlay(context, message)));
  }
}
_showOverlay(BuildContext context, String message) {
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        // Semi-transparent background
        Positioned.fill(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: 1.0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        // Centered message container with icon
        Center(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
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
                    offset: Offset(0, 6),
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
                    child: Icon(
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      decoration: TextDecoration.none, // Ensures no line appears
                    ),
                    textScaleFactor: 1.0, // Removes any unintended scaling
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  overlayState?.insert(overlayEntry);

  // Automatically remove the overlay after 2 seconds
  Future.delayed(Duration(seconds: 2), () {
    overlayEntry.remove();
    });
  }