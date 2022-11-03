import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calc_tip.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tip = 0;
  int _person = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text("Split_Bill"),
            backgroundColor: Color.fromARGB(255, 48, 27, 107),
            brightness: Brightness.light,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                alignment: Alignment.center,
                height: 150,
                width: 470,
                decoration: BoxDecoration(
                    color: Color.fromARGB(
                      255,
                      44,
                      20,
                      75,
                    ).withOpacity(0.9),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 17, 16, 16),
                          blurRadius: 2.0,
                          offset: Offset(4.0, 4.0)),
                    ]),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Per Person',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "\$ ${calculateTotalPerPerson(_billAmount, _person.toDouble(), _tip)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    )
                  ],
                )),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(12.0),
                  height: 100,
                  width: 470,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(
                        255,
                        44,
                        20,
                        75,
                      ).withOpacity(1),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 17, 16, 16),
                            blurRadius: 2.0,
                            offset: Offset(4.0, 4.0)),
                      ]),
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                        prefixText: "Bill Amount:   ",
                        hintStyle: TextStyle(color: Colors.white)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (execption) {
                        _billAmount = 0.0;
                      }
                    },
                  )),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(
                  'Person',
                  style: TextStyle(fontSize: 24),
                ),
                // SizedBox(
                //   width: 250,
                // ),

                Row(
                  children: [
                    ElevatedButton(
                  
                  child: const Text(
                    '\+',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    setState(() {
                      _person++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(40, 40),
                      shape: const CircleBorder(),
                      backgroundColor: Color.fromARGB(255, 48, 27, 107)),
                ),
                Text(
                  (' ${(_person)}'),
                ),
                ElevatedButton(
                  child: const Text(
                    '\-',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    setState(() {
                      _person--;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(40, 40),
                      shape: const CircleBorder(),
                      backgroundColor: Color.fromARGB(255, 48, 27, 107)),
                )
                  ],
                )
                
                
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Tip",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "\$ ${(calculateTotalTip(_billAmount, _person, _tip)).toString()} ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                )
              ]),
              Column(
                children: [
                  Text(
                    ('\$ ${(_tip)}'),
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      value: (_tip.toDouble()),
                      min: 0,
                      max: 100,
                      activeColor: Colors.blue,
                      divisions: 10,
                      onChanged: (double newValue) {
                        setState(() {
                          _tip = newValue.round();
                        });
                      })
                ],
              )
            ])));
  }
}
