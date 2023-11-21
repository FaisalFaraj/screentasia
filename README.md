# Screentasia

<p align="center">
  <img src="https://user-images.githubusercontent.com/74715917/284740018-918bcf55-87ed-4325-b384-f757f0349d34.jpg" width="350px">
</p>

# Level Up Your UI, Enjoyable & Simple

## #1 Best Screens UI Package

  

# ![](https://user-images.githubusercontent.com/74715917/284740021-7f34dfc1-72ef-4639-8079-fc8612254afb.gif) ✨ Give a star for the Repo ✨

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

![](https://user-images.githubusercontent.com/74715917/284739887-daf52730-bed4-4783-ad2c-327163534b58.png)

#### Tablet

![](https://user-images.githubusercontent.com/74715917/284739894-556301bc-9db2-437b-a339-4a2aa4f9617e.png)

### Mobile

![](https://user-images.githubusercontent.com/74715917/284739900-9f3d85b1-6326-4211-96ef-bada89aa7654.png)

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

![](https://user-images.githubusercontent.com/74715917/284739968-6e8c7b61-10ab-44b7-941e-f41ecabce332.png)

#### Tablet

![](https://user-images.githubusercontent.com/74715917/284739973-eb2c9aa5-62cf-4e05-8f98-f1d51a49a175.png)

### Mobile

![](https://user-images.githubusercontent.com/74715917/284739976-d1e426a2-bf20-4a06-b5ce-ad565c6e55d7.png)

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

![](https://user-images.githubusercontent.com/74715917/284739988-a889cf6d-5fe0-45a8-962f-a567f630f029.png)

#### Tablet

![](https://user-images.githubusercontent.com/74715917/284739991-a7b962c5-c468-4a3d-86ac-f09ffda110f4.png)

### Mobile

![](https://user-images.githubusercontent.com/74715917/284739994-90bfc9ba-90d0-490d-ae62-d786c703bad9.png)

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