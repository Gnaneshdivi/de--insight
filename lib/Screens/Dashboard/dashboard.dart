import 'package:cryptosplit/API/liquiditypool.dart';
import 'package:cryptosplit/Screens/Home_Screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashboard extends StatefulWidget {
  static const id = 'Dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  var dropdownValue = 'None';
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getchains(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<String> drop = ['None'];
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data.length; i++) {
              drop.add(snapshot.data[i]['name']);
            }
            print(drop);
          }

          snapshot.hasData ? print(snapshot.data) : null;
          return snapshot.hasData
              ? Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'DASHBOARD',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Choose network : ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: drop.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  backgroundColor: primaryColor,
                )
              : Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
