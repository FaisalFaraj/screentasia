import '../screentasia.dart';

class Screentasia {
  static final Screentasia _instance = Screentasia._();

  Screentasia._();

  factory Screentasia() {
    return _instance;
  }

  BuildContext? _context;
  late double _screenWidth;
  late double _screenHeight;
  late double _adaptiveFrom;
  late double _deviceAdaptivePercentage;

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;

  double fullAdaptivePercentageValue(num value) {
    return value * 1 / _deviceAdaptivePercentage;
  }

  double get adaptiveFrom1PixelScale => (1 * 100) / _adaptiveFrom;

  double get currentScreen1PixelScaleWidth =>
      (adaptiveFrom1PixelScale * screenWidth) / 100;

  double get currentScreen1PixelScaleHeight =>
      ((adaptiveFrom1PixelScale * screenHeight) / 100) *
      differencePercentValueWFromH;

  double get differencePercentValueWFromH => screenWidth / screenHeight;

  double get finalWidthAdaptiveValue => _deviceAdaptivePercentage != 0
      ? currentScreen1PixelScaleWidth * _deviceAdaptivePercentage
      : 1;

  double get finalHeightAdaptiveValue => _deviceAdaptivePercentage != 0
      ? currentScreen1PixelScaleHeight * _deviceAdaptivePercentage
      : 1;

  /// Initializing the Screentasia
  static Future<void> init(
    BuildContext context,
    double adaptiveFrom,
    AdaptivePercentage adaptivePercentage,
  ) async {
    final navigatorContext = Navigator.maybeOf(context)?.context as Element?;
    final mediaQueryContext =
        navigatorContext?.getElementForInheritedWidgetOfExactType<MediaQuery>();

    final initCompleter = Completer<void>();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      mediaQueryContext?.visitChildElements((el) => _instance._context = el);
      if (_instance._context != null) initCompleter.complete();
    });

    final deviceData = MediaQuery.maybeOf(context).nonEmptySizeOrNull();

    final deviceSize = deviceData?.size;

    _instance
      .._screenWidth = deviceSize!.width
      .._screenHeight = deviceSize.height
      .._context = context
      .._adaptiveFrom = adaptiveFrom
      .._deviceAdaptivePercentage =
          adaptivePercentage.deviceAdaptivePercentage(deviceSize.width);

    return initCompleter.future;
  }

  double setWidth(num width) {
    return width * finalWidthAdaptiveValue;
  }

  double setHeight(num height) => height * finalHeightAdaptiveValue;

  double radius(num r) => r * finalWidthAdaptiveValue;

  double setSp(num fontSize) {
    return fontSize * finalWidthAdaptiveValue;
  }

  double setPercentage(num screenValue, num percentage) {
    try {
      return (percentage > 100 || percentage <= 0)
          ? throw (const PercentageException(
              'The value must be (value > 0 && value <= 100'))
          : screenValue * (percentage / 100);
    } on PercentageException catch (r) {
      throw Exception(r.message);
    }
  }

  double setAdaptivePercentage(
      num value, AdaptivePercentage adaptivePercentage) {
    return fullAdaptivePercentageValue(value) *
        (adaptivePercentage.deviceAdaptivePercentage(screenWidth));
  }
}

extension on MediaQueryData? {
  MediaQueryData? nonEmptySizeOrNull() {
    if (this?.size.isEmpty ?? true) {
      return null;
    } else {
      return this;
    }
  }
}
