// Edison Zheng and Mason Mathias

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ShapesDemoApp());
}

class ShapesDemoApp extends StatelessWidget {
  const ShapesDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ShapesDemoScreen(),
    );
  }
}

class ShapesDemoScreen extends StatefulWidget {
  const ShapesDemoScreen({super.key});

  @override
  State<ShapesDemoScreen> createState() => _ShapesDemoScreenState();
}

class _ShapesDemoScreenState extends State<ShapesDemoScreen> {
  CustomPainter _currentPainter = SmileyPainter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emoji Selector')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Area for emoji to appear in
            CustomPaint(
              size: const Size(250, 250),
              painter: _currentPainter,
            ),

            const SizedBox(height: 30),

            // Buttons for emojis
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentPainter = SmileyPainter();
                    });
                  },
                  child: const Text("Smiley"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentPainter = PartyPainter();
                    });
                  },
                  child: const Text("Party"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentPainter = HeartPainter();
                    });
                  },
                  child: const Text("Heart"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentPainter = AngryPainter();
                    });
                  },
                  child: const Text("Angry"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final circleOffset = Offset(centerX, centerY);
    final rightEyeOffset = Offset(centerX - 20, centerY - 10);
    final leftEyeOffset = Offset(centerX + 20, centerY - 10);
    final smileOffset = Offset(centerX, centerY + 5);

    // Draw a head
    final circlePaint = Paint()
      ..color = const Color.fromARGB(255, 230, 226, 16)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 50, circlePaint);

    // Draw the eyes
    final ovalPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 17, 0)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: rightEyeOffset, width: 10, height: 20),
      ovalPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(center: leftEyeOffset, width: 10, height: 20),
      ovalPaint,
    );

    // Draw the smile
    final arcPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 17, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: smileOffset, width: 20, height: 10),
      0, // start angle in radians
      pi, // sweep angle in radians (about 120 degrees)
      false, // whether to use center 
      arcPaint
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PartyPainter extends CustomPainter {

  void drawStar(Canvas canvas, Offset center, double radius, Paint paint) {
    const int points = 5; // function to draw the star for the hat
    final Path path = Path();

    for (int i = 0; i < points * 2; i++) {
      // Alternate between outer and inner radius
      final double r = (i % 2 == 0) ? radius : radius / 2;
      final double angle = (pi / points) * i - pi / 2; // start at top
      final double x = center.dx + r * cos(angle);
      final double y = center.dy + r * sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final circleOffset = Offset(centerX, centerY);
    final rightEyeOffset = Offset(centerX - 20, centerY - 10);
    final leftEyeOffset = Offset(centerX + 20, centerY - 10);
    final smileOffset = Offset(centerX, centerY + 5);

    // Draw a head
    final circlePaint = Paint()
      ..color = const Color.fromARGB(255, 230, 226, 16)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 50, circlePaint);

    // Draw the eyes
    final ovalPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 17, 0)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: rightEyeOffset, width: 10, height: 20),
      ovalPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(center: leftEyeOffset, width: 10, height: 20),
      ovalPaint,
    );

    // Draw the smile
    final arcPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 17, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: smileOffset, width: 20, height: 10),
      0, // start angle in radians
      pi, // sweep angle in radians (about 120 degrees)
      false, // whether to use center 
      arcPaint
      );
      
    // Draw the party hat
    final hatPaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;
    final Path hatPath = Path()
      ..moveTo(centerX, centerY - 50 - 30) // tip of hat
      ..lineTo(centerX - 20 / 2, centerY - 50) // bottom-left
      ..lineTo(centerX + 20 / 2, centerY - 50) // bottom-right
      ..close();
    canvas.drawPath(hatPath, hatPaint);

    // Star at the top of the hat
    final starPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    drawStar(
      canvas,
      Offset(centerX, centerY - 50 - 30),
      10, // size of the star
      starPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final heartSize = 100.0;

    final heartPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Radius of the circles (top lobes)
    final radius = heartSize / 2;

    // Left circle
    canvas.drawCircle(
      Offset((centerX - radius) + 3, (centerY - radius) - 15),
      radius,
      heartPaint,
    );

    // Right circle
    canvas.drawCircle(
      Offset((centerX + radius) - 3, (centerY - radius) - 15),
      radius,
      heartPaint,
    );

    // Triangle (bottom point of heart)
    final path = Path()
      ..moveTo((centerX - radius * 3) + 55, centerY - radius) // left corner
      ..lineTo((centerX + radius * 3) - 55, centerY - radius) // right corner
      ..lineTo(centerX, centerY + radius + 40) // bottom tip
      ..close();

    canvas.drawPath(path, heartPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AngryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final circleOffset = Offset(centerX, centerY);
    final rightEyeOffset = Offset(centerX - 20, centerY - 10);
    final leftEyeOffset = Offset(centerX + 20, centerY - 10);
    final frownOffset = Offset(centerX, centerY + 20);

    // Head gradient colors
    final circlePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color.fromARGB(255, 156, 31, 0),  // darker red (top)
          const Color.fromARGB(255, 255, 106, 47), // lighter red (bottom)
        ],
      ).createShader(Rect.fromCircle(center: circleOffset, radius: 50));

    // Draw the head with gradient
    canvas.drawCircle(circleOffset, 50, circlePaint);

    // Draw the eyes
    final ovalPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 17, 0)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: rightEyeOffset, width: 10, height: 20),
      ovalPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(center: leftEyeOffset, width: 10, height: 20),
      ovalPaint,
    );

    // Draw the frown
    final arcPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 17, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: frownOffset, width: 30, height: 20),
      pi, // start angle (180°)
      pi, // sweep angle (180°)
      false,
      arcPaint,
    );

    // Draw angry eyebrows
    final browPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 17, 0)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Right eyebrow (slanted down toward center)
    canvas.drawLine(
      Offset(centerX - 35, centerY - 30),
      Offset(centerX - 15, centerY - 20),
      browPaint,
    );

    // Left eyebrow (slanted down toward center)
    canvas.drawLine(
      Offset(centerX + 15, centerY - 20),
      Offset(centerX + 35, centerY - 30),
      browPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}