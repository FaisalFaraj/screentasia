import 'package:flutter/material.dart';

import '../screentasia.dart';

typedef RebuildFactor = bool Function(MediaQueryData old, MediaQueryData data);

typedef ScreentasiaInitBuilder = Widget Function(
  BuildContext context,
  Widget? child,
);

class RebuildFactors {
  const RebuildFactors._();

  static bool size(MediaQueryData old, MediaQueryData data) {
    return old.size != data.size;
  }
}

class CustomScreen {
  const CustomScreen(this.width, this.height);
  final double width;
  final double height;
}

class AdaptiveFrom {
  const AdaptiveFrom._();

  static CustomScreen customScreen(double width, double height) {
    return CustomScreen(width, height);
  }

  static const CustomScreen mobile = CustomScreen(400, 760);
  static const CustomScreen tablet = CustomScreen(768, 1060);
  static const CustomScreen desktop = CustomScreen(1280, 621);
}

class AdaptivePercentage {
  const AdaptivePercentage(
      {this.mobile = 100, this.tablet = 100, this.desktop = 100});

  final double mobile;
  final double tablet;
  final double desktop;

  double deviceAdaptivePercentage(double screenWidth) {
    if (screenWidth <= 500) {
      return (mobile / 100);
    } else if (screenWidth < 1024 && screenWidth > 500) {
      return (tablet / 100);
    } else {
      return (desktop / 100);
    }
  }
}

class ScreentasiaInit extends StatefulWidget {
  /// A helper widget that initializes [Screentasia]
  const ScreentasiaInit({
    Key? key,
    required this.builder,
    this.adaptiveFrom = AdaptiveFrom.mobile,
    this.adaptivePercentage = const AdaptivePercentage(),
    this.child,
    this.rebuildFactor = RebuildFactors.size,
    this.useInheritedMediaQuery = false,
  }) : super(key: key);

  final ScreentasiaInitBuilder builder;
  final Widget? child;
  final bool useInheritedMediaQuery;
  final RebuildFactor rebuildFactor;
  final CustomScreen adaptiveFrom;
  final AdaptivePercentage adaptivePercentage;

  @override
  State<ScreentasiaInit> createState() => ScreentasiaInitState();
}

class ScreentasiaInitState extends State<ScreentasiaInit>
    with WidgetsBindingObserver {
  MediaQueryData? _mediaQueryData;

  bool wrappedInMediaQuery = false;

  WidgetsBinding get binding => WidgetsFlutterBinding.ensureInitialized();

  MediaQueryData get mediaQueryData => _mediaQueryData!;

  MediaQueryData get newData {
    if (widget.useInheritedMediaQuery) {
      final data = MediaQuery.maybeOf(context);

      if (data != null) {
        wrappedInMediaQuery = true;
        return data;
      }
    }

    return MediaQueryData.fromView(binding.window);
  }

  Widget get child {
    return widget.builder.call(context, widget.child);
  }

  _updateTree(Element el) {
    el.markNeedsBuild();
    el.visitChildren(_updateTree);
  }

  @override
  void initState() {
    super.initState();

    binding.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final old = _mediaQueryData!;
    final data = newData;

    if (widget.rebuildFactor(old, data)) {
      _mediaQueryData = data;
      _updateTree(context as Element);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_mediaQueryData == null) _mediaQueryData = newData;
    didChangeMetrics();
  }

  @override
  void dispose() {
    binding.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext _context) {
    if (mediaQueryData.size == Size.zero) return const SizedBox.shrink();
    if (!wrappedInMediaQuery) {
      return MediaQuery(
        data: mediaQueryData,
        child: Builder(
          builder: (__context) {
            final deviceData = MediaQuery.maybeOf(__context);
            final deviceSize = deviceData!.size;

            Screentasia.init(
                __context, widget.adaptiveFrom, widget.adaptivePercentage);
            return AppWidget(deviceSize: deviceSize, child: child);
          },
        ),
      );
    }

    Screentasia.init(_context, widget.adaptiveFrom, widget.adaptivePercentage);

    final deviceData = MediaQuery.maybeOf(_context);

    final deviceSize = deviceData!.size;
    return AppWidget(deviceSize: deviceSize, child: child);
  }
}
