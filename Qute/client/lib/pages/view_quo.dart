import 'package:flutter/material.dart';
import 'package:qutequotes/pages/full_screen_page.dart';

class ViewQuote extends StatefulWidget {
  const ViewQuote({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ViewQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Image.asset(
              "assets/quote.png",
              height: 40,
              width: 40,
              // color: Colors.white,
            ),
            const SizedBox(height: 30,),
            const Text("Don't let the nocise of others' opinions drown you out of your inner voice",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,)
            ),
            const SizedBox(height: 30,),
            const Text("Steve Jobs",
            style: TextStyle(color: Colors.black),
            ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add,
            color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const FullScreenPage()));
            },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
