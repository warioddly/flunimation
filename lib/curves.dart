
import 'package:flutter/animation.dart' show Curves;
import 'package:flutter/cupertino.dart' show Curve;

final class MyCurve {

  final String name;
  final Curve curve;
  final String value;

  const MyCurve({
    required this.name,
    required this.curve,
    required this.value,
  });

}

final allCurves = <MyCurve>[
  MyCurve(name: 'linear', curve: Curves.linear, value: 'Curves.linear'),
  MyCurve(name: 'decelerate', curve: Curves.decelerate, value: 'Curves.decelerate'),
  MyCurve(name: 'fastLinearToSlowEaseIn', curve: Curves.fastLinearToSlowEaseIn, value: 'Curves.fastLinearToSlowEaseIn'),
  MyCurve(name: 'fastEaseInToSlowEaseOut', curve: Curves.fastEaseInToSlowEaseOut, value: 'Curves.fastEaseInToSlowEaseOut'),
  MyCurve(name: 'ease', curve: Curves.ease, value: 'Curves.ease'),
  MyCurve(name: 'easeIn', curve: Curves.easeIn, value: 'Curves.easeIn'),
  MyCurve(name: 'easeInToLinear', curve: Curves.easeInToLinear, value: 'Curves.easeInToLinear'),
  MyCurve(name: 'easeInSine', curve: Curves.easeInSine, value: 'Curves.easeInSine'),
  MyCurve(name: 'easeInQuad', curve: Curves.easeInQuad, value: 'Curves.easeInQuad'),
  MyCurve(name: 'easeInCubic', curve: Curves.easeInCubic, value: 'Curves.easeInCubic'),
  MyCurve(name: 'easeInQuart', curve: Curves.easeInQuart, value: 'Curves.easeInQuart'),
  MyCurve(name: 'easeInQuint', curve: Curves.easeInQuint, value: 'Curves.easeInQuint'),
  MyCurve(name: 'easeInExpo', curve: Curves.easeInExpo, value: 'Curves.easeInExpo'),
  MyCurve(name: 'easeInCirc', curve: Curves.easeInCirc, value: 'Curves.easeInCirc'),
  MyCurve(name: 'easeInBack', curve: Curves.easeInBack, value: 'Curves.easeInBack'),
  MyCurve(name: 'easeOut', curve: Curves.easeOut, value: 'Curves.easeOut'),
  MyCurve(name: 'linearToEaseOut', curve: Curves.linearToEaseOut, value: 'Curves.linearToEaseOut'),
  MyCurve(name: 'easeOutSine', curve: Curves.easeOutSine, value: 'Curves.easeOutSine'),
  MyCurve(name: 'easeOutQuad', curve: Curves.easeOutQuad, value: 'Curves.easeOutQuad'),
  MyCurve(name: 'easeOutCubic', curve: Curves.easeOutCubic, value: 'Curves.easeOutCubic'),
  MyCurve(name: 'easeOutQuart', curve: Curves.easeOutQuart, value: 'Curves.easeOutQuart'),
  MyCurve(name: 'easeOutQuint', curve: Curves.easeOutQuint, value: 'Curves.easeOutQuint'),
  MyCurve(name: 'easeOutExpo', curve: Curves.easeOutExpo, value: 'Curves.easeOutExpo'),
  MyCurve(name: 'easeOutCirc', curve: Curves.easeOutCirc, value: 'Curves.easeOutCirc'),
  MyCurve(name: 'easeOutBack', curve: Curves.easeOutBack, value: 'Curves.easeOutBack'),
  MyCurve(name: 'easeInOut', curve: Curves.easeInOut, value: 'Curves.easeInOut'),
  MyCurve(name: 'easeInOutSine', curve: Curves.easeInOutSine, value: 'Curves.easeInOutSine'),
  MyCurve(name: 'easeInOutQuad', curve: Curves.easeInOutQuad, value: 'Curves.easeInOutQuad'),
  MyCurve(name: 'easeInOutCubic', curve: Curves.easeInOutCubic, value: 'Curves.easeInOutCubic'),
  MyCurve(name: 'easeInOutCubicEmphasized', curve: Curves.easeInOutCubicEmphasized, value: 'Curves.easeInOutCubicEmphasized'),
  MyCurve(name: 'easeInOutQuart', curve: Curves.easeInOutQuart, value: 'Curves.easeInOutQuart'),
  MyCurve(name: 'easeInOutQuint', curve: Curves.easeInOutQuint, value: 'Curves.easeInOutQuint'),
  MyCurve(name: 'easeInOutExpo', curve: Curves.easeInOutExpo, value: 'Curves.easeInOutExpo'),
  MyCurve(name: 'easeInOutCirc', curve: Curves.easeInOutCirc, value: 'Curves.easeInOutCirc'),
  MyCurve(name: 'easeInOutBack', curve: Curves.easeInOutBack, value: 'Curves.easeInOutBack'),
  MyCurve(name: 'fastOutSlowIn', curve: Curves.fastOutSlowIn, value: 'Curves.fastOutSlowIn'),
  MyCurve(name: 'slowMiddle', curve: Curves.slowMiddle, value: 'Curves.slowMiddle'),
  MyCurve(name: 'bounceIn', curve: Curves.bounceIn, value: 'Curves.bounceIn'),
  MyCurve(name: 'bounceOut', curve: Curves.bounceOut, value: 'Curves.bounceOut'),
  MyCurve(name: 'bounceInOut', curve: Curves.bounceInOut, value: 'Curves.bounceInOut'),
  MyCurve(name: 'elasticIn', curve: Curves.elasticIn, value: 'Curves.elasticIn'),
  MyCurve(name: 'elasticOut', curve: Curves.elasticOut, value: 'Curves.elasticOut'),
  MyCurve(name: 'elasticInOut', curve: Curves.elasticInOut, value: 'Curves.elasticInOut'),
];