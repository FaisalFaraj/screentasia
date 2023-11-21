# Screentasia

<p align="center">
  <img src="https://t9009185363.p.clickup-attachments.com/t9009185363/9185ba2a-001e-4a32-b55d-21ed0d4f64e7/logo.jpg" width="350px">
</p>

# Level Up Your UI, Enjoyable & Simple

## #1 Best Screens UI Package

  

# ![](https://t9009185363.p.clickup-attachments.com/t9009185363/801dc212-1ec0-4443-9798-c91cbe3fe5a6/icons8-star.gif) ✨ Give a star for the Repo ✨

#   

# Screentasia

  

A Flutter package that helps you create beautifully adaptive designs for all screens with a wealth of features.

  

## Features

  

*   🚀 Adaptive From: To adaptive sizes from different screens like Mobile, Tablet, Desktop
*   ⚡️ Adaptive Percentage: To customize Adaptive percentage for different screens sizes in percentage for the hole app or for a specific widget
*   ➗️ Percentage Sizes: Now you can customize width and height as percentages from screen
*   ❤️ As you want: You can disable Adaptive for specific screens just passing 0
*   🏋‍♂️️ No Media Query: No need for Media Query no more

  

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

  

| Property | Type | Default Value | Description |
| ---| ---| ---| --- |
| adaptiveFrom | double | adaptiveFrom . mobile | Used to adapt sizes from chosen screen ex: if 500 width on a desktop is equal to 50% of the screen width, will be equal to 50% to all screens,also you can use custom screen with customScreen method |
| adaptivePercentage | AdaptivePercentage | AdaptivePercentage(mobile: 100, tablet: 100, desktop: 100) | For adaptive percentage in different screens, also can disable adaptive for specific screens with 0 value as parameter |
| builder | Function | null | Return widget that uses the library in a property (ex: MaterialApp's theme) |
| child | Widget | null | A part of the builder that its dependencies/properties don't use the library |
| rebuildFactor | Function | _default_ | Returns whether to rebuild or not when screen metrics change. |

  

**Note : You must either provide builder, child or both.**

  

### Initialize

  

### To Initialize the Tha Adaptive with you app

  

#### The first way (You must use it once in your app)

  

```scala
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

  

### Examples

### In this example we will use only width for all situations to use adaptive values,Of course we can apply that concept in (Height,Font,Padding,etc)

  

### Example using Values

  

We can create adaptive value for (width,height,font,etc) based on value in specific device for example (Mobile,Tablet,Desktop) or specific device dimension ( width,height )

to apply adaptive value for all screen

ex: 250.w '250 width in mobile screen'

  

```haskell
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreentasiaInit(
      adaptiveFrom: AdaptiveFrom.mobile,
      adaptivePercentage:
          const AdaptivePercentage(mobile: 100, desktop: 100, tablet: 100),
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter screentasia',
            home: Scaffold(
                appBar: AppBar(
                  title: const Text('Flutter screentasia Demo  Page'),
                ),
                body: Container(
                  color: Colors.blue,
                  width: 250.w,
                )));
      },
    );
  }
}
```

#### Desktop

![](https://t9009185363.p.clickup-attachments.com/t9009185363/51c1b440-ee16-4298-9b5a-5e04028b1ffe/3.PNG)

#### Tablet

![](https://t9009185363.p.clickup-attachments.com/t9009185363/f48c4ed1-01b2-41bc-a6fe-7289a19ffd24/2.PNG)

### Mobile

![](https://t9009185363.p.clickup-attachments.com/t9009185363/323d570c-bd68-4dd1-b4b7-7e57200f8010/1.PNG)

###   

### Example using Percentage

  

We can create adaptive value for (width,height, font,etc) based on percentage

for example we will use width percentage 'wb' in diffrent screen sizes

ex: 50wp '50 width percent in screen'

  

```plain
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreentasiaInit(
      adaptiveFrom: AdaptiveFrom.mobile,
      adaptivePercentage:
          const AdaptivePercentage(mobile: 100, desktop: 100, tablet: 100),
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter screentasia',
            home: Scaffold(
                appBar: AppBar(
                  title: const Text('Flutter screentasia Demo  Page'),
                ),
                body: Container(
                  color: Colors.blue,
                  width: 50.wp,
                )));
      },
    );
  }
}
```

#### Desktop

![](https://t9009185363.p.clickup-attachments.com/t9009185363/3f0c5c1c-f431-4fed-9b03-181bc2902b03/1.PNG)

#### Tablet

![](https://t9009185363.p.clickup-attachments.com/t9009185363/19c07937-1c3f-45c3-99fa-55a453e868de/2.PNG)

### Mobile

![](https://t9009185363.p.clickup-attachments.com/t9009185363/b4bba53b-d180-4293-baf7-d316c27e1475/3.PNG)

###   

### Example using Percentage in Specific Screen

  

We can create adaptive value for (width, height, font, etc) based on percentage

for example, we will use width percentage 'wb' in different screen sizes with different value percentages in specific screens

ex: 100wp '100 width per cent from Desktop Screen'

50wp '50 width per cent from Tablet Screen'

25wp '25 width per cent from Mobile Screen'

  

```haskell
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreentasiaInit(
      adaptiveFrom: AdaptiveFrom.mobile,
      adaptivePercentage:
          const AdaptivePercentage(mobile: 100, desktop: 100, tablet: 100),
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter screentasia',
            home: Scaffold(
                appBar: AppBar(
                  title: const Text('Flutter screentasia Demo  Page'),
                ),
                body: Container(
                    color: Colors.blue,
                    width: 100.wp.ap(
                        adaptivePercentage: const AdaptivePercentage(
                            desktop: 100, tablet: 50, mobile: 25)))));
      },
    );
  }
}
```

  

#### Desktop

![](https://t9009185363.p.clickup-attachments.com/t9009185363/89090a20-57c1-48ea-8909-c354c20db890/1.PNG)

#### Tablet

![](https://t9009185363.p.clickup-attachments.com/t9009185363/acef422a-99dc-40a3-a384-1fe29ded0f1f/2.PNG)

### Mobile

![](https://t9009185363.p.clickup-attachments.com/t9009185363/11602d5b-eb8c-4c7a-a4fd-4b6557ac8e55/3.PNG)

###   

###   

### API

  

#### Pass the dp size of the design draft

  

```scss
    Screentasia().setWidth(540)  (dart sdk>=2.6 ) another way (540.w) //Adapted to screen width
    Screentasia().setHeight(200) (dart sdk>=2.6 ) another way (200.h) //Adapted to screen height, under normal circumstances, the height still uses x.w
    Screentasia().radius(200)    (dart sdk>=2.6 ) another way (200.r)    //Adapt according to the smaller of width or height
    Screentasia().setSp(24)      (dart sdk>=2.6 ) another way (24.sp) //Adapter font
    Screentasia().setPercentage(MediaQuery.sizeOf(context).width,50)   (dart sdk>=2.6 : 50.wp)    //Device width in Percentage, You can use Height just replace MediaQuery.sizeOf(context).width with MediaQuery.sizeOf(context).height
    
    EdgeInsets.all(10).w    //EdgeInsets.all(10.w)
    EdgeInsets.only(left:8,right:8).r // EdgeInsets.only(left:8.r,right:8.r).
    Radius.circular(16).w          //Radius.circular(16.w)
    BorderRadius.all(Radius.circular(16)).w  

    ap(tablet:50) //adaptive percentage, tablet 50 means that adaptive percentage 50% only on tablet screens, the default is 100% for all screens 
```