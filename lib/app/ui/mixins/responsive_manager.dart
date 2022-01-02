import 'package:flutter/material.dart';
import '../../ui/enums/screen_type.dart';

/// Add this mixin to a StatelessWidget to make it resposive
/// Then implements mobile, tablet, desktop, tv methods to make it responsive.
mixin ResponsiveManager on Widget {
  late final MediaQueryData mediaQuery;

  Size get _screenSize => mediaQuery.size;

  Widget? mobile(BuildContext context);
  Widget? tablet(BuildContext context);
  Widget? desktop(BuildContext context);
  Widget? tv(BuildContext context);

  final double _phoneBreakPoint = 480;
  final double _tabletBreakPoint = 768;
  final double _desktopBreakPoint = 1200;

  ScreenType get screenType {
    final deviceWidth = _screenSize.width;
    if (deviceWidth <= _phoneBreakPoint) return ScreenType.Mobile;
    if (deviceWidth <= _tabletBreakPoint) return ScreenType.Tablet;
    if (deviceWidth <= _desktopBreakPoint) return ScreenType.Desktop;
    return ScreenType.TV;
  }

  @protected
  Widget build(BuildContext context) {
    Widget? responsiveWidget;

    if (screenType == ScreenType.TV) {
      responsiveWidget = tv(context);
    }
    if (screenType == ScreenType.Desktop) {
      responsiveWidget = desktop(context);
    }
    if (screenType == ScreenType.Tablet) {
      responsiveWidget = tablet(context);
    }
    if (screenType == ScreenType.Mobile) {
      responsiveWidget = mobile(context);
    }

    return responsiveWidget ??
        tv(context) ??
        desktop(context) ??
        tablet(context) ??
        mobile(context)!;
  }
}
