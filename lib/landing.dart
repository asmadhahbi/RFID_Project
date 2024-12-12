// landing_screen.dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'signin.dart';

class landing extends StatefulWidget {
  const landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<landing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const signin()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: BubblePainter(_controller.value),
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Image(
                  image: AssetImage('assets/logo1.png'),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  'KeyFlow',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Because access should always be in your hands',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(225, 187, 132, 223),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final double progress;

  BubblePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    void drawBubble(double x, double y, double radius, Color color) {
      paint.color = color;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }

    final purpleBubble = const Color.fromARGB(255, 187, 132, 232);
    final blueBubble = Color.fromARGB(149, 28, 86, 193);

    final width = size.width;
    final height = size.height;

    // Draw half-visible bubbles at the edges
    drawBubble(-40, height * 0.3 + 20 * sin(progress * 2 * pi), 120,
        purpleBubble); // Left edge
    drawBubble(width + 40, height * 0.5 - 20 * sin(progress * 2 * pi), 140,
        blueBubble); // Right edge
    drawBubble(width * 0.5, -60 + 15 * cos(progress * 2 * pi), 100,
        purpleBubble); // Top edge
    drawBubble(width * 0.5, height + 60 - 15 * cos(progress * 2 * pi), 100,
        blueBubble); // Bottom edge
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
