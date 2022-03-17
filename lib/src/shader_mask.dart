import 'package:flutter/material.dart';

class CustomShaderMaskAnimation extends StatefulWidget {
  final String bgImage;
  final Widget childWidget;
  final double containerHeight;
  final double containerWidth;

  const CustomShaderMaskAnimation(
      {Key? key,
      required this.bgImage,
      required this.childWidget,
      required this.containerHeight,
      required this.containerWidth})
      : super(key: key);

  @override
  _CustomShaderMaskAnimationState createState() =>
      _CustomShaderMaskAnimationState();
}

class _CustomShaderMaskAnimationState extends State<CustomShaderMaskAnimation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          curve: Curves.easeInCirc,
          duration: const Duration(seconds: 1),
          builder: (context, double value, child) {
            return Container(
              color: Colors.black,
              height: widget.containerHeight,
              width: widget.containerWidth,
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [value, value],
                          colors: [Colors.white, Colors.black])
                      .createShader(bounds);
                },
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(widget.bgImage, fit: BoxFit.fill),
                    Center(child: widget.childWidget)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
