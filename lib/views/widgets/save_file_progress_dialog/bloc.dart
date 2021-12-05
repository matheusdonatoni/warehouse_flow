import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SaveFileProgressDialogBloc extends GetxController
    with SingleGetTickerProviderMixin {
  late final AnimationController animation;

  late final Animation<double> stackSize;

  late final Animation<double> fileScale;
  late final Animation<double> fileOpacity;

  late final Animation<double> iconScale;
  late final Animation<double> iconOpacity;

  late final CurvedAnimation _stackSizeCurve;

  late final CurvedAnimation _fileScaleCurve;
  late final CurvedAnimation _fileOpacityCurve;

  late final CurvedAnimation _iconScaleCurve;
  late final CurvedAnimation _iconOpacityCurve;

  void _setupStackSize() {
    _stackSizeCurve = CurvedAnimation(
      parent: animation,
      curve: Interval(0.0, 0.3, curve: Curves.ease),
    );

    stackSize = Tween(begin: 0.0, end: 1.0).animate(_stackSizeCurve);
  }

  void _setupFileAnimations() {
    _fileScaleCurve = CurvedAnimation(
      parent: animation,
      curve: Interval(0.1, 0.55, curve: Curves.easeOutBack),
    );
    _fileOpacityCurve = CurvedAnimation(
      parent: animation,
      curve: Interval(0.1, 0.55, curve: Curves.decelerate),
    );

    fileScale = Tween(begin: 0.0, end: 1.0).animate(_fileScaleCurve);
    fileOpacity = Tween(begin: 0.0, end: 1.0).animate(_fileOpacityCurve);
  }

  void _setupIconAnimations() {
    _iconScaleCurve = CurvedAnimation(
      parent: animation,
      curve: Interval(0.55, 1.0, curve: Curves.easeOutBack),
    );
    _iconOpacityCurve = CurvedAnimation(
      parent: animation,
      curve: Interval(0.55, 1.0, curve: Curves.decelerate),
    );

    iconScale = Tween(begin: 0.0, end: 1.0).animate(_iconScaleCurve);
    iconOpacity = Tween(begin: 0.0, end: 1.0).animate(_iconOpacityCurve);
  }

  void playAnimation() async {
    if (animation.isDismissed) await animation.forward();
  }

  @override
  void onInit() {
    super.onInit();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _setupStackSize();
    _setupFileAnimations();
    _setupIconAnimations();
  }

  @override
  void onClose() {
    animation.dispose();
    super.onClose();
  }
}
