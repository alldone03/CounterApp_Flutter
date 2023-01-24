import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main%20copy.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(countApp());
}

class countApp extends StatelessWidget {
  const countApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => changerState(),
      child: MaterialApp(
        home: displayView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class changerState extends ChangeNotifier {
  var data = 0;
  void tambahdata() {
    data += 1;
    // print(data);
    notifyListeners();
  }

  void kurangdata() {
    data -= 1;
    // print(data);
    notifyListeners();
  }
}

class displayView extends StatelessWidget {
  const displayView({super.key});

  @override
  Widget build(BuildContext context) {
    var myState = context.watch<changerState>();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              myState.data.toString(),
              style: TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    myState.tambahdata();
                  },
                  child: Text(
                    'Tambah data',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    myState.kurangdata();
                  },
                  child: Text('Kurang data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
