import 'package:flutter/material.dart';

class DepartmentScreen extends StatelessWidget {
  final String message;

  DepartmentScreen({Key? key, required this.message}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text(message),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                controller: _controller,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                print(_controller.text);
              },
              child: const Text('Enabled'),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('The Enchanted Nightingale'),
                    subtitle:
                        Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('BUY TICKETS'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('LISTEN'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
