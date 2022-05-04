import 'package:clean_code_architecture/providerSetup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/error/status.dart';
import 'features/weatherdailyupdate/presenatation/provider/numberProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {

    super.initState();
    apiCall();

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
   /* NumberProvider provider=NumberProvider(usesCase: Provider.of(context));
    provider.getNumber();*/
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<NumberProvider>(builder: (context, data, child) {
        return data.uiState == UIState.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : data.uiState == UIState.error
                ? const Center(
                    child: Text('error'),
                  )
                : Center(
                    child: Text(data.data!.number.toString()),
                  );
      }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void apiCall() {
Provider.of<NumberProvider>(context,listen: false).getNumber();
  }
}
