import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qutequotes/pages/quotes.dart';
import 'package:qutequotes/pages/view_quo.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<Quotes> quotes = [
    Quotes("Doubt kills more dreams than failure ever will.", "Suzy Kassem"),
    Quotes(
        "Hardships often prepare ordinary people for an extraordinary destiny.",
        "Unknown"),
    Quotes(
        "We delight in the beauty of the butterfly, but rarely admit the changes it has gone through to achieve that beauty.",
        "Maya Angelou")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
            itemBuilder: (context, i) {
              return Column(children: [
                ListTile(
                  title: _buildRow(quotes[i], context),
                )
              ]);
            },
            separatorBuilder: (context, i) => const Divider(),
            itemCount: quotes.length));
  }

  Widget _buildRow(Quotes quote, BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ViewQuote()));
        },
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Text(
                quote.quote,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Center(
                  child: Text(
                quote.author,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ))
            ],
          ),
        ));
  }
}
