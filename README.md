

<p align="center">
  <img src="https://github.com/FaisalFaraj/screentasia/blob/main/images/logo.jpg?raw=true" width="350px">
</p>
<h2 align="center"> Level Up Your UI, Enjoyable & Simple</h2>

# #1 Best Screens UI Package



# screentasia

A Flutter package that helps you create beautifully adaptive designs for all screens with a wealth of features.
## Features

- 🚀 Adaptive From: To adaptive sizes from different screens like Mobile, Tablet, Desktop

- ⚡️ Adaptive Percentage: To customize Adaptive percentage for different screens sizes in percentage for the hole app or for a specific widget

- ➗️ Percentage Sizes: Now you can customize width and height as percentages from screen

- ❤️ As you want: You can disable Adaptive for specific screens just passing 0
- 🏋‍♂️️ No Media Query: No need for Media Query no more





[github](https://github.com/FaisalFaraj/screentasia)

[Update log](https://github.com/FaisalFaraj/screentasia/CHANGELOG.md)

## Usage

### Add dependency

Please check the latest version before installation.
If there is any problem with the new version, please use the previous version

```yaml
dependencies:
  flutter:
    sdk: flutter
  # add screentasia
  screentasia: ^{latest version}
```

### Add the following imports to your Dart code

```dart
import 'package:screentasia/screentasia.dart';
```


### Property

| Property        | Type         | Default Value | Description                                                                 |
| --------------- | ------------ | ------------- | --------------------------------------------------------------------------- |
| adaptiveFrom         | double     | AdaptiveFrom.mobile          | Used to adapt sizes from chosen screen ex: if 500 width on a desktop is equal to 50% of the screen width, will be equal to 50% to all screens,also you can use custom screen with customScreen method|
| adaptivePercentage         | AdaptivePercentage     | AdaptivePercentage(mobile: 100, tablet: 100, desktop: 100)          | For adaptive percentage in different screens, also can disable adaptive for specific screens with 0 value as parameter  |
| builder         | Function     | null          | Return widget that uses the library in a property (ex: MaterialApp's theme) |
| child           | Widget       | null          | A part of the builder that its dependencies/properties don't use the library    |
| rebuildFactor   | Function     | *default*     | Returns whether to rebuild or not when screen metrics change.              |
                                                      




**Note : You must either provide builder, child or both.**

### Initialize



### To Initialize the Tha Adaptive with you app


#### The first way (You must use it once in your app)

```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return ScreentasiaInit(
      adaptiveFrom: AdaptiveFrom.mobile, //optional for custom screen ex: customScreen(400,700)
      adaptivePercentage: AdaptivePercentage(mobile:100,tablet:100,desktop:100),//optional
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Example',
          home: child,
        );
      },
      child: const HomePage(title: 'Example'),
    );
  }
}
```



### API

#### Pass the dp size of the design draft

```dart
    Screentasia().setWidth(540)  (dart sdk>=2.6 ) another way (540.w) //Adapted to screen width
    Screentasia().setHeight(200) (dart sdk>=2.6 ) another way (200.h) //Adapted to screen height, under normal circumstances, the height still uses x.w
    Screentasia().radius(200)    (dart sdk>=2.6 ) another way (200.r)    //Adapt according to the smaller of width or height
    Screentasia().setSp(24)      (dart sdk>=2.6 ) another way (24.sp) //Adapter font
    Screentasia().setPercentage(MediaQuery.of(context).size.width,50)   (dart sdk>=2.6 : 50.wp)    //Device width in Percentage, You can use Height just replace MediaQuery.of(context).size.width with MediaQuery.of(context).size.height
    
    EdgeInsets.all(10).w    //EdgeInsets.all(10.w)
    EdgeInsets.only(left:8,right:8).r // EdgeInsets.only(left:8.r,right:8.r).
    Radius.circular(16).w          //Radius.circular(16.w)
    BorderRadius.all(Radius.circular(16)).w  

    ap(tablet:50) //adaptive percentage, tablet 50 means that adaptive percentage 50% only on tablet screens, the default is 100% for all screens 
  
```


   
## Adapt screen size

Pass the dp size of the design draft((The unit is the same as the unit at initialization))：

Adapted to screen width: `Screentasia().setWidth(540)`,

Adapted to screen height: `Screentasia().setHeight(200)`, In general, the height is best to adapt to the width

If your dart sdk>=2.6, you can use extension functions:

example:

instead of :

```dart
Container(
  width: Screentasia().setWidth(50),
  height:Screentasia().setHeight(200),
)
```

you can use it like this:

```dart
Container(
  width: 50.w,
  height:200.h
)
```



#### Example for extensions

``` dart
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
```


### Example

[example demo](https://github.com/FaisalFaraj/screentasia/example/lib)



### Youtube Video Tutorial (Soon)

