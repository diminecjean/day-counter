import 'package:flutter/material.dart';

class AddContainer extends StatefulWidget {
  const AddContainer({super.key});
  @override
  State<AddContainer> createState() {
    return _AddContainer();
  }
}

class _AddContainer extends State<AddContainer> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView.builder(
            reverse: true,
            pageSnapping: false,
            controller: PageController(viewportFraction: 0.85),
            itemCount: count,
            itemBuilder: (context, i) {
              print(i);
              if (i == 0) {
                return Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.015,
                        right: MediaQuery.of(context).size.height * 0.015,
                        top: MediaQuery.of(context).size.width * 0.08,
                        bottom: MediaQuery.of(context).size.width * 0.15),
                    child: Material(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                        elevation: 8.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  size: 50.0,
                                )
                              ]),
                        )));
              } else {
                return Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.015,
                        right: MediaQuery.of(context).size.height * 0.015,
                        top: MediaQuery.of(context).size.width * 0.08,
                        bottom: MediaQuery.of(context).size.width * 0.15),
                    child: Material(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white,
                      elevation: 8.0,
                    ));
              }
            }));
  }
}
