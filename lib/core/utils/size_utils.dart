import 'package:flutter/material.dart';

// This functions are responsible to make UI responsive across all the mobile devices.

MediaQueryData get mediaQueryData {
  final view = WidgetsBinding.instance.platformDispatcher.views.first;
  return MediaQueryData.fromView(view);
}

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num figmaDesignWidth = 375;
const num figmaDesignHeight = 812;
const num figmaDesignStatusBar = 0;

///This extension is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  /// This method is used to get device viewport width.
  double get _width {
    return mediaQueryData.size.width;
  }

  /// This method is used to get device viewport height.
  double get _height {
    double statusBar = mediaQueryData.viewPadding.top;
    double bottomBar = mediaQueryData.viewPadding.bottom;
    return mediaQueryData.size.height - statusBar - bottomBar;
  }

  /// This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  double get h => (this * _width) / figmaDesignWidth;

  /// This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  double get v => (this * _height) / (figmaDesignHeight - figmaDesignStatusBar);

  /// This method is used to set smallest px in image height and width
  double get adaptSize {
    double height = v;
    double width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  /// This method is used to set text font size according to Viewport
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
