// import 'dart:ffi';
// import 'dart:io';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // var _counter = 0;
//   var _counter = '';

//   // void _incrementCounter() {
//   //   setState(() {
//   //     // This call to setState tells the Flutter framework that something has
//   //     // changed in this State, which causes it to rerun the build method below
//   //     // so that the display can reflect the updated values. If we changed
//   //     // _counter without calling setState(), then the build method would not be
//   //     // called again, and so nothing would appear to happen.
//   //     _counter++;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You are now test this language samples:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _testNow,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   // 1.1、Hello World
//   void _a_a() {
//     var helloWorld = 'Hello World';
//     setState(() {
//       _counter = helloWorld;
//     });
//   }

//   //1.2、Variables
//   void _a_b() {
//     var a_sting = 'wxl';
//     var a_int = 1997;
//     var a_double = 3.7;
//     var a_array = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
//     var a_json = {
//       'tags': ['saturn'],
//       'url': '//path/to/saturn.jpg'
//     };
//     setState(() {
//       _counter = a_sting +
//           a_int.toString() +
//           a_double.toString() +
//           a_array.toString() +
//           a_json.toString();
//     });
//   }

//   //1.3、Control flow statements
//   void _a_c() {
//     var a_sting = 'wxl';
//     var a_int = 1997;
//     var a_double = 3.7;
//     var a_array = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
//     var a_json = {
//       'tags': ['saturn'],
//       'url': '//path/to/saturn.jpg'
//     };
//     var result = '';
//     // if
//     if (a_int > 2000) {
//       result += '>2000';
//     } else {
//       result += '<=2000';
//     }
//     // for
//     for (var object in a_array) {
//       result += object;
//     }
//     // for 2
//     for (int month = 1; month <= 12; month++) {
//       result += month.toString();
//     }
//     //while
//     var year = 0;
//     while (year < 2020) {
//       year += 1;
//     }
//     result += year.toString();

//     setState(() {
//       _counter = result;
//     });
//   }

//   //1.4、Functions
//   void _a_d() {
//     setState(() {
//       _counter = fibonacci(200).toString();
//     });
//   }

//   int fibonacci(int n) {
//     if (n == 0 || n == 1) return n;
//     return fibonacci(n - 1) + fibonacci(n - 2);
//   }

//   // 1.5、A shorthand => (arrow) syntax is handy for function
//   void _a_e() {
//     setState(() {
//       // _counter=()=>{return '11111'};
//     });
//   }

//   //1.6、Comments
//   void _a_f() {
//     setState(() {
//       _counter = '''
//         // This is a normal, one-line comment.
//         /// This is a documentation comment, used to document libraries,
//         /// classes, and their members. Tools like IDEs and dartdoc treat
//         /// doc comments specially.
//         /* Comments like these are also supported. */
//       ''';
//     });
//   }

//   //1.7、Imports
//   void _a_g() {
//     setState(() {
//       _counter = '''
//       To access APIs defined in other libraries, use import.
//       // Importing core libraries
//       import 'dart:math';

//       // Importing libraries from external packages
//       import 'package:test/test.dart';

//       // Importing files
//       import 'path/to/my_other_file.dart';
//       ''';
//     });
//   }

//   //1.8、Classes
//   void _a_h() {
//     setState(() {
//       var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
//       voyager.describe();
//       var voyager3 = Spacecraft.unlaunched('Voyager III');
//       voyager3.describe();

//       var myClass = MyClass(1000000);
//       myClass.gMethod();
//     });
//   }

//   //1.9、Classes
//   void _a_i() {
//     var aColor = Color.blue;
//     var printStr = '';
//     switch (aColor) {
//       case Color.red:
//         printStr = 'Red as roses!';
//         print(printStr);
//         break;
//       case Color.green:
//         printStr = 'Green as grass!';
//         print(printStr);
//         break;
//       default: // Without this, you see a WARNING.
//         print(aColor); // 'Color.blue'
//         printStr = aColor.toString();
//     }
//     setState(() {
//       _counter = printStr;
//     });
//   }

//   //1.10、Inheritance，继承
//   void _a_j() {
//     var mOrbiter = Orbiter('this Is Name ', new DateTime(3000), 1000.00);
//     setState(() {
//       _counter = mOrbiter.describe();
//     });
//   }

//   //1.11、Mixins,混合继承
//   void _a_k() {
//     var mPilotedCraft = new PilotedCraft('this Is Name ', new DateTime(100));
//     setState(() {
//       _counter = mPilotedCraft.describe();
//     });
//   }

//   //1.12、Interfaces and abstract classes,接口和抽象类
//   void _a_l() {
//     var mMockSpaceshipDoto = MockSpaceshipDoto();
//   }

//   //1.13、Async,异步
//   void _a_m() {
//     // const mOneSecond = Duration(seconds: 3);
//     // _incrementCounter(mOneSecond);
//     _timeChange(3);
//     var iteranleStr = ["11111", "22222"];
//     createDescriptions(iteranleStr);
//   }

//   Future<void> _incrementCounter(mOneSecond) async {
//     setState(() {
//       _counter = 'Plese wait :$mOneSecond';
//     });
//     await Future.delayed(mOneSecond);
//     setState(() {
//       _counter = 'I am change!';
//     });
//   }

//   Future<void> _timeChange(mOneSecond) async {
//     for (int counter = 0; counter <= mOneSecond; counter++) {
//       await Future.delayed(Duration(seconds: 1));
//       setState(() {
//         _counter = (mOneSecond - counter).toString();
//       });
//       print(counter);
//     }
//   }

//   // 文件夹及文件操作
//   Future<void> createDescriptions(Iterable<String> objects) async {
//     for (var object in objects) {
//       try {
//         // 创建一个文件夹

//         Directory tempDir = await Directory.current;
//         Directory directory = new Directory('${tempDir.path}/test');
//         if (!directory.existsSync()) {
//           directory.createSync();
//           print('文档初始化成功，文件保存路径为 ${directory.path}');
//         }
//         var file = File('${directory.path}/$object.txt');
//         if (await file.exists()) {
//           var modified = await file.lastModified();
//           print(
//               'File for $object.txt already exists. It was modified on $modified.');
//           var path = await file.uri;
//           print(path);
//           continue;
//         }
//         await file.create();
//         await file.writeAsString('Start describing $object.txt in this file.');
//       } on IOException catch (e) {
//         print('Cannot create description for $object: $e');
//       }
//     }
//   }

//   //1.14、异常
//   void _testNow() {
//     // 1、直接抛出异常
//     // throw new Exception();
//     //2、To catch an exception, use a try statement with on or catch (or both):
//     try {
//       throw new Exception();
//     } on Exception catch (e) {
//       print('catch a exception.');
//     } finally {
//       print('try catch end!!!');
//     }
//   }
// }

// class MockSpaceshipDoto implements MockSpaceship {
//   @override
//   DateTime? launchDate;

//   @override
//   String? name;

//   @override
//   String aToB() {
//     // TODO: implement aToB
//     throw UnimplementedError();
//   }

//   @override
//   int bToB() {
//     // TODO: implement bToB
//     throw UnimplementedError();
//   }

//   @override
//   double cToB() {
//     // TODO: implement cToB
//     throw UnimplementedError();
//   }

//   @override
//   T dToJson<T>() {
//     // TODO: implement dToJson
//     throw UnimplementedError();
//   }

//   @override
//   String describe() {
//     // TODO: implement describe
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement launchYear
//   int get launchYear => throw UnimplementedError();
// }

// abstract class MockSpaceship implements Spacecraft {
//   // ···
//   String aToB() {}
//   int bToB() {}
//   double cToB() {}
//   T dToJson<T>() {}
// }

// class PilotedCraft extends Spacecraft with Piloted {
//   PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
//   @override
//   String describe() {
//     // TODO: implement describe
//     return 'From Piloted :' +
//         describeCrew() +
//         '\n From Super Reslt is : ' +
//         super.describe();
//   }
// }

// class Orbiter extends Spacecraft {
//   double altitude;
//   Orbiter(String name, DateTime launchDate, this.altitude)
//       : super(name, launchDate);
//   //重载
//   @override
//   String describe() {
//     // TODO: implement describe
//     return 'I am inheritance from Spacecraft , and super result is : \n\n\n' +
//         super.describe();
//   }
// }

// class Piloted {
//   int astronauts = 1;
//   String describeCrew() {
//     var mResult = 'Number of astronauts: $astronauts';
//     print(mResult);
//     return mResult;
//   }
// }

// class MyClass {
//   //args
//   int pointer;

//   //Constructor
//   MyClass(this.pointer) {}

//   int get gPointer => pointer;

//   //Method
//   void gMethod() {
//     print(this.pointer);
//   }
// }

// class Spacecraft {
//   String name;
//   DateTime launchDate;

//   // Constructor, with syntactic sugar for assignment to members.
//   Spacecraft(this.name, this.launchDate) {
//     // Initialization code goes here.
//   }

//   // Named constructor that forwards to the default one.
//   Spacecraft.unlaunched(String name) : this(name, null);

//   int? get launchYear => launchDate?.year; // read-only non-final property

//   // Method.
//   String describe() {
//     var mPrint = '';
//     mPrint += 'Spacecraft: $name';
//     print(mPrint);
//     if (launchDate != null) {
//       int years = DateTime.now().difference(launchDate).inDays ~/ 365;
//       print('Launched: $launchYear ($years years ago)');
//       mPrint += 'Launched: $launchYear ($years years ago)';
//     } else {
//       print('Unlaunched');
//       mPrint += 'Unlaunched';
//     }
//     return mPrint;
//   }
// }

// // Enumerated types,枚举
// enum Color { red, green, blue }
