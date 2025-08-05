import 'package:flunimation/curves.dart' show allCurves, MyCurve;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flunimation Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;

  Duration duration = const Duration(seconds: 1);
  MyCurve currentCurve = allCurves.first;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    controller = AnimationController(vsync: this, duration: duration);

    curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: currentCurve.curve,
    );

    controller.repeat(reverse: true);
  }

  void _restartController() {
    controller.dispose();
    curvedAnimation.dispose();
    _initController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Curves'),
        leading: IconButton(
          icon: const Icon(Icons.code),
          onPressed: () {
            launchUrlString('https://github.com/warioddly/flunimation');
          },
        ),
        actions: [
          IconButton(
            tooltip: 'Copy current curve',
            icon: const Icon(Icons.copy),
            onPressed: () {
              copyToClipboard(currentCurve.value);
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: allCurves.map((curve) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(curve.name),
                    subtitle: Text(curve.value.toString()),
                    onTap: () {
                      setState(() {
                        currentCurve = curve;
                        _restartController();
                      });
                    },
                    trailing: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () => copyToClipboard(curve.value),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.copy),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 2,
            child: AnimatedBuilder(
              animation: curvedAnimation,
              builder: (context, _) {
                return Column(
                  children: <Widget>[
                    Slider(
                      value: duration.inSeconds.toDouble(),
                      min: 1.0,
                      max: 15.0,
                      divisions: 14,
                      label: duration.inSeconds.toString(),
                      onChanged: (value) {
                        setState(() {
                          duration = Duration(seconds: value.toInt());
                          _restartController();
                        });
                      },
                    ),
                    Expanded(
                      child: CustomPaint(
                        painter: DrawCurve(
                          curve: currentCurve.curve,
                          t: curvedAnimation.value,
                        ),
                        child: Container(),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          _expand(
                            child: Opacity(
                              opacity: curvedAnimation.value.clamp(0, 1),
                              child: _container(Colors.blue),
                            ),
                          ),
                          _expand(
                            child: Transform.scale(
                              scale: curvedAnimation.value + 0.5,
                              child: _container(Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          _expand(
                            child: Transform.rotate(
                              angle: curvedAnimation.value * 6.28,
                              child: _container(Colors.red),
                            ),
                          ),
                          _expand(
                            child: Align(
                              alignment: Alignment(
                                2 * curvedAnimation.value - 1,
                                0,
                              ),
                              child: _container(Colors.purple),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _container(Color color) {
    return Container(width: 80, height: 80, color: color);
  }

  Widget _expand({required Widget child}) {
    return Expanded(child: Center(child: child));
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text('Copied: $text')));
  }
}

class DrawCurve extends CustomPainter {
  final Curve curve;
  final double t;

  DrawCurve({required this.t, required this.curve});

  final _axisPaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  final _gridPaint = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.5;

  final _ballPaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  final _linePaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    for (double x = 0; x <= width; x++) {
      final t = x / width;
      final y = height * (1 - curve.transform(t));
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, _linePaint);

    final x = width * t;
    final y = height * (1 - curve.transform(t.clamp(0, 1)));

    canvas.drawCircle(Offset(x, y), 6, _ballPaint);

    for (double i = 0; i <= width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, height), _gridPaint);
    }

    for (double i = 0; i <= height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(width, i), _gridPaint);
    }

    canvas
      ..drawLine(Offset(0, height), Offset(width, height), _axisPaint)
      ..drawLine(Offset(0, 0), Offset(0, height), _axisPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is DrawCurve && oldDelegate.curve != curve ||
        oldDelegate is DrawCurve && oldDelegate.t != t;
  }
}
