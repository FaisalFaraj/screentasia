import 'package:screentasia/screentasia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreentasiaInit(
      adaptiveFrom: AdaptiveFrom.mobile,
      adaptivePercentage:
          const AdaptivePercentage(mobile: 100, desktop: 100, tablet: 100),
      builder: (context, child) {
        return const MaterialApp(
          title: 'Flutter screentasia',
          home: MyHomePage(title: 'Flutter screentasia Demo  Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Not Adaptive Text',
                        style: TextStyle(fontSize: 14),
                      ),
                      Icon(
                        Icons.add,
                        size: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: Colors.black,
                      height: 50,
                      width: 350,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 350.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.r)),
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Adaptive Text ',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Icon(
                        Icons.add,
                        size: 14.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: Colors.black,
                      height: 50.h,
                      width: 350.w.ap(
                          adaptivePercentage: const AdaptivePercentage(
                              mobile: 50, tablet: 50, desktop: 50)),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  color: Colors.red,
                  width: 50.wp,
                  height: 15.hp,
                ),
                Container(
                  color: Colors.orange,
                  width: 50.wp,
                  height: 15.hp,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
