import 'package:flutter/material.dart';
import 'package:hotel/restaurant.dart';

void main()
{
  runApp(MaterialApp(home: splash(),debugShowCheckedModeBanner: false,));
}
class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gonext();
  }
  gonext()
  async {
    await Future.delayed(Duration(seconds: 0));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return restaurant();
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Restaurant...",style: TextStyle(fontSize: 40),textAlign: TextAlign.center),
      ),
    );
  }
}
