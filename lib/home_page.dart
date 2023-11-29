// import 'dart:ffi';

import 'package:calculator/logics/calculations.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 186, 233, 255),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Consumer<Calculations>(builder: (context, value, index) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  // color: const Color.fromARGB(255, 174, 197, 174),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        value.input,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        value.output,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                child: Consumer<Calculations>(
                  builder: (context, value, child) {
                    return Container(
                      // color: const Color.fromARGB(255, 224, 205, 255),
                      child: GridView.builder(
                        itemCount: value.characters.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                value.onPressed(value.characters[index]),
                            child: Button(
                              color: value.isOperator(value.characters[index])
                                  ? Colors.deepPurple
                                  : Colors.lightBlue,
                              text: value.characters[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
