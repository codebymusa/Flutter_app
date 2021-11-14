import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qutequotes/model/quotes_model.dart';
import 'package:qutequotes/pages/add_quote.dart';
import 'package:qutequotes/pages/quotes.dart';
import 'package:qutequotes/pages/view_quote.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<QuotesModel>(builder: (context, quotes, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder<List<Quotes>>(builder: (context, snap) {
            if (snap.hasData) {
              return Stack(children: [
                ListView.separated(
                    itemBuilder: (context, i) {
                      return Column(children: [
                        ListTile(
                          title: _buildRow(snap.data![i], context),
                        )
                      ]);
                    },
                    separatorBuilder: (context, i) => const Divider(),
                    itemCount: snap.data!.length),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: FloatingActionButton(
                        backgroundColor: Colors.black,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddQuote()));
                        },
                      )),
                )
              ]);
            }
            return const Text("Not working");
          }));
    });
  }

  Widget _buildRow(Quotes quote, BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<QuoteModel>().setQuote = quote;
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
