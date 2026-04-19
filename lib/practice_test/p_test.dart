import 'package:flutter/material.dart';

class Test_Text_Button extends StatelessWidget {
  const Test_Text_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                const Text("Don't Have An Account??"),
                TextButton(onPressed: () {}, child: Text("Click")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
