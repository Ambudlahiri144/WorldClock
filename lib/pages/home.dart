import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty ? data:ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);
    // String bgImage = data['isDaytime']?? false;
    // bgImage = data['isDaytime']? 'day.jpg':'night.jpg';
    // Color bgColor = data['isDaytime']?? true;
    // bgColor = data['isDaytime']?Colors.blue:Colors.indigo[700]!;

    return Scaffold(
        // backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/day2.jpg'),
                fit: BoxFit.cover,
                )
              ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
          children: <Widget>[
            TextButton.icon(
              onPressed: () async{
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time':result['time'],
                    'location':result['location'],
                    'isDaytime':result['isDaytime'],
                    'flag':result['flag'],
                  };
                });
              },

              label: const Text(
                  "Edit Location",
                  style: TextStyle(
                    backgroundColor: Colors.black,
                    color: Colors.white,
                  ),
                  ),

              icon: const Icon(
                  Icons.edit_location,
                  color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: const TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66.0,
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
