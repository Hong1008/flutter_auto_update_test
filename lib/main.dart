import 'package:flutter/material.dart';
import 'package:flutter_autoupdate/flutter_autoupdate.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var updater = UpdateManager(versionUrl: 'https://raw.githubusercontent.com/Hong1008/flutter_auto_update_test/main/sample.json');

  String? version;

  @override
  void initState() {
    super.initState();
    name();
  }

  Future<void> name() async {
    var result = await updater.fetchUpdates();
    print(result?.latestVersion);
    print(result?.downloadUrl);
    print(result?.releaseNotes);
    print(result?.releaseDate);
    setState(() {
      version = result?.latestVersion.build;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text(version ?? 'null'),
      ),
    );
  }
}
