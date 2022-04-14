import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //BASIC INITIALISATION OF NOTIFICATION,
  AwesomeNotifications().initialize('images/careflight logo.png', [
    NotificationChannel(
      channelKey: 'Key1',
      channelName: 'care flight',
      channelDescription: "Notification",
      defaultColor: Color(0XFF9050DD),
      playSound: true,
      soundSource: 'music/notification.mp3',
      enableLights: true,
      enableVibration: true,
    ),
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/bookingpage':((context) =>bookingpage()  )
      },
      title: 'NOTIFICATION APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //creating button for main function to run
        child: ElevatedButton(
          onPressed: () {
            Notify();

            //WHEN WE TAP ON NOTICTIFICATION FOLLOWING PAGE SHOULD OPEN:
            AwesomeNotifications().actionStream.listen((receivedNotification) {
              Navigator.of(context).pushNamed(
                '/bookingpage',
              );
            });
          },
          child: Icon(Icons.circle_notifications),
        ),
      ),
    );
  }
}

void Notify() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 1,
        channelKey: 'key1',
        title: 'Incoming Booking',
        body: 'This is Body of Noti',
        bigPicture: 'https://www.clipartmax.com/max/m2i8G6K9d3G6d3i8/',
        notificationLayout: NotificationLayout.BigPicture),
  );
}
