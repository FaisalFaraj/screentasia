import '../../screentasia.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    required this.deviceSize,
    required this.child,
  });

  final Size deviceSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: FittedBox(
          fit: BoxFit.none,
          alignment: Alignment.center,
          child: Container(
            width: deviceSize.width,
            height: deviceSize.height,
            child: child,
          ),
        ));
  }
}
