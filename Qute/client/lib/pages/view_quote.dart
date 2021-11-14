import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:qutequotes/model/quotes_model.dart';
import 'package:qutequotes/pages/add_quote.dart';
import 'package:qutequotes/pages/quotes.dart';

class ViewQuote extends StatefulWidget {
  const ViewQuote({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ViewQuote> {
  @override
  Widget build(BuildContext context) {
    Quotes quote = context.read<QuoteModel>().quote;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back),
            ),
            const Spacer(),
            Image.asset(
              "assets/quote.png",
              height: 40,
              width: 40,
              // color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(quote.quote,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 30,
            ),
            Text(
              quote.author,
              style: const TextStyle(color: Colors.black),
            ),
            const Spacer(),
            
            
          ],
        ),
      ),
    );
  }
}
