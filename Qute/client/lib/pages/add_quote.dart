import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:qutequotes/model/quotes_model.dart';
import 'package:qutequotes/pages/quotes.dart';

class AddQuote extends StatelessWidget {
  final TextEditingController quoteController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  AddQuote({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 450,
            child: Column(
              children: [
                const Spacer(),
                const Text("Add Quote",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const Spacer(),
                TextField(
                  controller: quoteController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Type Quote'),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: authorController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Type Author'),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  child: const Text("Add"),
                  onPressed: () {
                    if (quoteController.text.isEmpty) {
                      return;
                    }
                    Provider.of<QuotesModel>(context, listen: false).addQuote(
                        Quotes(
                            quoteController.text,
                            (authorController.text.isEmpty)
                                ? 'Anonymous'
                                : authorController.text));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )),
      floatingActionButton: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
