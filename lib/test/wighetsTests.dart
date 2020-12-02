import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newslash/utils/httpUtil.dart';
import 'package:newslash/utils/snackBarUtil.dart';
import 'package:newslash/utils/enumUtil.dart' as EnumUtil;

//7.网络
void main() {
  runApp(MaterialApp(
    home: MyNetWorkBody(),
  ));
}

class MyNetWorkBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyNetWorkBodyState();
}

class MyNetWorkBodyState extends State<MyNetWorkBody> {
  var _netResponJsonData = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(_netResponJsonData),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '',
        onPressed: () {
          _testNet(context);
        },
      ),
    );
  }

  void _testNet(BuildContext context) {
    HttpUtil.init().httpSearchImage(EnumUtil.SlashSource.Pexels,
        {'page': '1', 'per_page': '1', 'query': 'people'}).then((value) {
      print('mResponJsonData:' + value);
      setState(() {
        _netResponJsonData = value;
      });
    });
    // HttpUtil.init()
    //     .httpSearchImage(EnumUtil.SlashSource.Pexels, {'query': 'people'}).then(
    //         (value) => () {
    //               print('mResponJsonData:' + value);
    //               setState(() {
    //                 _netResponJsonData = value;
    //               });
    //             }());
  }
}

//6、整合在一起
// void main() {
//   runApp(MaterialApp(
//     title: 'Shopping App',
//     home: ShoppingList(
//       products: <Product>[
//         Product(name: 'Eggs'),
//         Product(name: 'Flour'),
//         Product(name: 'Chocolate chips'),
//       ],
//     ),
//   ));
// }

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget
  // appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need to change
      // _shoppingCart inside a setState call to trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.product, this.inCart, this.onCartChanged})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts
    // of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

//5、根据用户输入改变 widget 2
// void main() {
//   runApp(MaterialApp(
//     title: 'MY APP',
//     home: ChangStateByUserInputApp2(),
//   ));
// }

class ChangStateByUserInputApp2 extends StatelessWidget {
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xffffc1cc),
        child: Center(
          child: Counter2(),
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class Counter2 extends StatefulWidget {
  @override
  _CounterState2 createState() => _CounterState2();
}

class _CounterState2 extends State<Counter2> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CounterIncrementor(onPressed: _increment),
      CounterDisplay(count: _counter),
    ]);
  }
}

//4、根据用户输入改变 widget
// void main() {
//   runApp(MaterialApp(
//     title: 'MY APP',
//     home: ChangStateByUserInputApp(),
//   ));
// }

class ChangStateByUserInputApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xffffc1cc),
        child: Center(
          child: Counter(),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If you change _counter without calling
      // setState(), then the build method won't be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance, as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return Row(
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
        Text('Count: $_counter'),
      ],
    );
  }
}

//3、处理手势
// void main() {
//   runApp(MaterialApp(
//     title: 'MY APP',
//     home: MyGuesterApp(),
//   ));
// }

class MyGuesterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: MyGuesterButton(),
        ),
      ),
    );
  }
}

class MyGuesterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        var showMsg = 'MyGuesterButton onTaping... ';
        print(showMsg);
        SnackBarUtil.showSimpleSnackBar(context, showMsg, 1500);
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

// 2、使用 Material 组件
// void main() {
//   runApp(MaterialApp(
//     title: 'MY APP',
//     home: TutorialHome(),
//   ));
// }

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Scaffold是主要材料组件的布局。
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation',
          onPressed: null,
        ),
        title: Text('Example Text'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: Text('Hello World.'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: () {
          _onAddFloatingActionPress(context);
        },
      ),
    );
  }

  // 点击，显示SnackBar提示信息
  _onAddFloatingActionPress(BuildContext context) {
    SnackBar mSnackBar = SnackBar(
      content: Container(
        child: Text(
          'SnackBar showing .....',
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
      ),
      duration: Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(mSnackBar);
  }
}

// // 1、基础 widgets
// void main() {
//   runApp(MaterialApp(
//     title: 'MY APP',
//     home: MyApplication(),
//   ));
// }

class MyAppBar extends StatelessWidget {
  final Widget title;
  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // height: 20, //设置高度
      color: Color(0xFF141414),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            disabledColor: Color(0xffffffff),
            tooltip: 'Navigation button',
            onPressed: null,
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            disabledColor: Color(0xffffffff),
            tooltip: 'search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      //垂直线性布局
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          // Expanded扩展其子级以填充可用空间。
          Expanded(
            child: Container(
              color: Color(0xEE141414),
              child: Center(
                child: Text(
                  'hello world.',
                  style: Theme.of(context).primaryTextTheme.headline5,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are now test this language samples:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onfloatingActionButtonPressed(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onfloatingActionButtonPressed() {
    setState(() {
      _counter = '.........';
    });
  }
}
