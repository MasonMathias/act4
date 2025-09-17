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
                  child: const Text("Random"),
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
      2.1, // sweep angle in radians (about 120 degrees)
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
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final circleOffset = Offset(centerX, centerY);

    // Draw a head
    final circlePaint = Paint()
      ..color = const Color.fromARGB(255, 230, 226, 16)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 50, circlePaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AngryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final circleOffset = Offset(centerX, centerY);

    // Draw a head
    final circlePaint = Paint()
      ..color = const Color.fromARGB(255, 255, 85, 18)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 50, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/*
class ShapesDemoScreen extends StatelessWidget {
  const ShapesDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Shapes Drawing Demo'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Task 1: Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: CustomPaint(
                painter: BasicShapesPainter(),
                size: const Size(double.infinity, 200),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Task 2: Combined Shapes (Abstract Design)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: CombinedShapesPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Task 3: Styled Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: StyledShapesPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Determine the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final circleOffset = Offset(centerX, centerY);
    final rightEyeOffset = Offset(centerX - 20, centerY - 10);
    final leftEyeOffset = Offset(centerX + 20, centerY - 10);
    final smileOffset = Offset(centerX, centerY + 5)

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
      2.1, // sweep angle in radians (about 120 degrees)
      false, // whether to use center 
      arcPaint
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CombinedShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Background gradient
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [Colors.blue.shade100, Colors.white],
    );
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = backgroundGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Draw a sun (circle with rays)
    final sunPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY - 40), 40, sunPaint);

    // Sun rays (lines)
    final rayPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 3;
    for (int i = 0; i < 8; i++) {
      final angle = i * (pi / 4); // Use pi from dart:math
      final dx = cos(angle) * 60;
      final dy = sin(angle) * 60;
      canvas.drawLine(
        Offset(centerX, centerY - 40),
        Offset(centerX + dx, centerY - 40 + dy),
        rayPaint,
      );
    }

    // Draw a house (square with triangle roof)
    final housePaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: Offset(centerX, centerY + 40), width: 80, height: 80),
      housePaint,
    );

    final roofPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    final roofPath = Path()
      ..moveTo(centerX - 60, centerY)
      ..lineTo(centerX + 60, centerY)
      ..lineTo(centerX, centerY - 60)
      ..close();
    canvas.drawPath(roofPath, roofPaint);

    // Draw a door (rectangle)
    final doorPaint = Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: Offset(centerX, centerY + 60), width: 30, height: 50),
      doorPaint,
    );

    // Draw windows (squares)
    final windowPaint = Paint()
      ..color = Colors.blue.shade200
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: Offset(centerX - 25, centerY + 20), width: 20, height: 20),
      windowPaint,
    );
    canvas.drawRect(
      Rect.fromCenter(center: Offset(centerX + 25, centerY + 20), width: 20, height: 20),
      windowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StyledShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw a gradient-filled rectangle
    final rectGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.red, Colors.blue],
    );
    final rect = Rect.fromCenter(center: Offset(centerX, centerY - 100), width: 200, height: 60);
    canvas.drawRect(
      rect,
      Paint()
        ..shader = rectGradient.createShader(rect)
        ..style = PaintingStyle.fill,
    );

    // Draw a circle with a border
    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final circleBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circlePaint);
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circleBorderPaint);

    // Draw a transparent oval
    final ovalPaint = Paint()
      ..color = Colors.purple.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(centerX + 80, centerY), width: 100, height: 60),
      ovalPaint,
    );

    // Draw a dashed line using a custom path effect
    final dashPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    
    // We draw a series of short lines and spaces
    final path = Path();
    double startX = centerX - 100;
    const dashLength = 10.0;
    const spaceLength = 5.0;
    while (startX < centerX + 100) {
      path.moveTo(startX, centerY + 80);
      path.lineTo(min(startX + dashLength, centerX + 100), centerY + 80);
      startX += dashLength + spaceLength;
    }
    canvas.drawPath(path, dashPaint);

    // Draw a gradient arc
    final arcGradient = SweepGradient(
      center: Alignment.centerRight,
      startAngle: 0,
      endAngle: pi, // Use pi from dart:math
      colors: [Colors.red, Colors.yellow, Colors.green],
    );
    final arcRect = Rect.fromCenter(center: Offset(centerX, centerY + 100), width: 120, height: 120);
    final arcPaint = Paint()
      ..shader = arcGradient.createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(centerX, centerY + 100), width: 100, height: 100),
      0, // start angle
      2.5, // sweep angle
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
*/