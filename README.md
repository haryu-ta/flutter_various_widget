# widget_various_application

A new Flutter project.

## 基本Widget

### SafeArea

- エッジの部分には表示させないように制御する

```dart
body: SafeArea(
  child: ListView(
    children: [
      Container(),
      Container(),
      Container(),
    ]
  )
)
```

### Stack

- 複数コンポーネントを重ね合わせる
- 上から指定した順に下に配置される。
  - 下記例だとblueが下で、redが上

```dart
body: Center(
    child: Stack(
        alignment: Alignment.center,
        children: [
            Container(width:200,height:200,Color: Colors.blue),
            Container(width:100,height:100,Color: Colors.red),
        ]
    )
)
```

### Container

```dart
Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
        // 罫線
        border: Border(
            top: BorderSide(color: Colors.black, width: 2),
            right: BorderSide(color: Colors.blue, width: 2),
            bottom: BorderSide(color: Colors.yellow, width: 2),
            left: BorderSide(color: Colors.red, width: 2),
        ),
        // Container内の色をグラデーション
        gradient: SweepGradient(
            colors: [
                Color.fromRGBO(226, 113, 7, 0),
                Color.fromRGBO(219, 226, 7, 0.922),
                Color.fromRGBO(95, 226, 7, 0.885),
                Color.fromRGBO(7, 226, 226, 0.749),
                Color.fromRGBO(7, 7, 226, 0.896),
                Colors.pink,
                Colors.purple,
            ],
        ),
    ),
    child: Icon(Icons.access_alarm_outlined)
),
```

### AspectRatio
- 指定された幅、高さ内で指定された割合の横：縦比のオブジェクトを作成

```
Container(
  height: 100,
  child: AspectRatio(
    aspectRatio: 1/2,   // 高さ100で横:縦= 1:2のコンポーネントを作成
    child: Container(color: Colors.red),
  )
)
```

### Padding

- コンポーネント間の空白を定義

```dart
Padding(
    padding: EdgeInsets.all(20)
    //padding: EdgeInsets.all(20)
    //padding: EdgeInsets.only(top: 20,right: 20)
    //padding: EdgeInsets.symmetric(vertical: 20)  // 上と下のみ適用
    //padding: EdgeInsets.symmetric(horizontal: 20)  // 右と左のみ適用
    child: const Text('Padding'),
)
```

### SizedBox

- Contanerとの使い分けが謎？

```dart
SizedBox(
  width: 100,
  height: 100,
  child: Container(
    color: Colors.red,
    child: Text("Hello World"),
  ),
),
```

### ClipRRect

- 画像などの角丸を実現する
- Containerとかでも使えるけど、そちらはdecorateでやればいいよね？

```dart
ClipRRect(
  borderRadius: BorderRadius.circular(50),
  child: Image.asset("assets/mizuhara.jpg"),
)
```

### Spacer

- スペースを設ける
  - flexなどで絶対的な形でスペースサイズ指定が可能
  
```dart
Row(
  // Container間に均等にスペースを設定
  children: [
    Container(width: 30, height: 30, color: Colors.red),
    Spacer(),
    Container(width: 30, height: 30, color: Colors.blue),
    Spacer(),
    Container(width: 30, height: 30, color: Colors.purple),
  ],
),
Row(
  children: [
    // Container間に3:1の割合でスペースを設定
    Container(width: 30, height: 30, color: Colors.blue),
    Spacer(flex:3),
    Container(width: 30, height: 30, color: Colors.purple),
    Spacer(flex:1),
    Container(width: 30, height: 30, color: Colors.red),
  ],
),
```
### Opacity

- 透明度を設定する
  - 0 ： 透明
  - 1 : 非透明

```
Opecity(
    opacity: 0.5,
    child: const Text('透明度')
)
```

### Table

- テーブルを作成する

```dart
Table(
    border: TableBorder.all(), 
    columnWidths: {
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        2: FlexColumnWidth(),
    },
    children: [
        TableRow(children: [
            SizedBox(width: 50, height: 100),
            SizedBox(width: 100, height: 100),
            Container(),
        ]),
        TableRow(children: [
            SizedBox(width: 50, height: 100),
            SizedBox(width: 100, height: 100),
            Container(),
        ]),
    ]
);
```


### Wrap

- 縦幅、横幅に入りきらなくなった子要素を改行して表示させる

```dart
child: Wrap(
    direction: Axis.horizontal,
    children: [
        const Text('0',style: TextStyle(fontSize: 100)),
        const Text('1',style: TextStyle(fontSize: 100)),
        const Text('2',style: TextStyle(fontSize: 100)),
        const Text('3',style: TextStyle(fontSize: 100)),
        const Text('4',style: TextStyle(fontSize: 100)),
        const Text('5',style: TextStyle(fontSize: 100)),
        const Text('6',style: TextStyle(fontSize: 100)),
        const Text('7',style: TextStyle(fontSize: 100)),
        const Text('8',style: TextStyle(fontSize: 100)),
        const Text('9',style: TextStyle(fontSize: 100)),
    ]
)
```

## スクロール＆スワイプ可能なWidget

### ListView

- スクロール可能なウィジェット

```dart
child : ListView.builder(
    itemCount: 2,
    itemBuilder: (context,index) {
        return Container(
            height: 100,
            child: const Text("item" + index)
        )
    }
)
```

### SingleChildScrollView

- スクロール可能なウィジェット
  - ListViewとの違いは、ListViewはスクロールするたびに徐々に描画
  - SingleChildScrollViewは初期表示時に全てを描画

```dart
body: SingleChildScrollView(
  child: Column(
    children: [
      Container(height: 300,color: Colors.blue),
      Container(height: 300,color: Colors.tealAccent),
      Container(height: 300,color: Colors.red),
    ],
  )
),
```

### GridView

```dart
body: GridView.count(
  crossAxisCount: 4,   // 横のGrid数
  crossAxisSpacing: 10,  // 縦スペース
  mainAxisSpacing: 10,   // 横スペース
  children: [
    Container(width: 200,height:200,color: Colors.blue),
    Container(width: 200,height:200,color: Colors.red),
    Container(width: 200,height:200,color: Colors.green),
    Container(width: 200,height:200,color: Colors.blue),
    Container(width: 200,height:200,color: Colors.red),
    Container(width: 200,height:200,color: Colors.green),
    Container(width: 200,height:200,color: Colors.blue),
    Container(width: 200,height:200,color: Colors.red),
    Container(width: 200,height:200,color: Colors.green),
    Container(width: 200,height:200,color: Colors.blue),
    Container(width: 200,height:200,color: Colors.red),
    Container(width: 200,height:200,color: Colors.green),
  ]
)
```

```dart
body: GridView.builder(
  itemCount: 20,
  itemBuilder: (BuildContext context, int index) { 
    Color color = Colors.black;
    switch (index % 4) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.green;
        break;
      case 2:
        color = Colors.blue;
        break;
      case 3:
        color = Colors.yellow;
        break;
    }
    return Container(
      width: 200,
      height: 200,
      color: color,
    );
  }, 
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
)
```

### PageView

- スワイプ可能なページを作る

```dart
body: PageView(
  scrollDirection: Axis.horizontal,  // スクロール方向水平
  controller: PageController(initialPage: 1), 
  onPageChanged: (int index) {
    print("$index ページが表示されました");
  },
  children: [
    Container(width: double.infinity, height: double.infinity, color: Colors.red),
    Container(width: double.infinity, height: double.infinity, color: Colors.green),
    Container(width: double.infinity, height: double.infinity, color: Colors.yellow),
  ],
)
```

```dart
body: PageView.builder(
    itemCount: _pages.length,
    onPageChanged: (int value) {
      print("Page Changed: " + _pages[value]);
    } ,
    itemBuilder: (BuildContext context, int index) {
      Color color = Colors.black;
      switch (index % 4) {
        case 0:
          color = Colors.red;
          break;
        case 1:
          color = Colors.green;
          break;
        case 2:
          color = Colors.blue;
          break;
        case 3:
          color = Colors.yellow;
          break;
      }
      return Container(
          height: double.infinity,
          width: double.infinity,
          color: color);
    })
```

### RefreshIndicator

- スクロール可能なウィジェットと組み合わせて上から下に引っ張った時に内容更新のグルグルを表現

```dart
  // 内容を更新する関数
  Future<void> updatePlayersList() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      ojbList.add("新規追加");
    });
  }

body: RefreshIndicator(
  backgroundColor: Colors.black,
  onRefresh: () async {
    await updateList();
  },
  child: ListView.builder(
    itemCount: ojbList.length,
    itemBuilder: (context, index) {
      return Container(
        height: 100,
        child: Text(objList[index]),
      );
    }
  )
)
```

### Scrollbar

- スクロールできるウィジェットと使用することでスクロールバーを表示させる

```dart
body: Scrollbar(
    thickness: 20,
    child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
            return Continer(child:Text(list[index]));
        }
    )
)
```

### TabBarView

- タブによるページ切り替えを実現(数固定)

```dart
    // Scaffoldの外側に指定
return DefaultTabController(
  length: 3,
  child: Scaffold(
      appBar: AppBar(
        title: Text('Fourth Page'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(233, 112, 19, 0.473),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Container(child: Text("車")),
          Container(child: Text("電車")),
          Container(child: Text("自転車")),
        ],
      ),
);
```

## 入力Form Widget

### Expanded

- RowやColumnの子Widget間の隙間を目一杯に埋めたい時に使用する。  
- Row内にTextFieldなどを配置しようとすると、Rowは幅の制約を持たないために無限の幅を持とうとしてエラーが発生する。  
  したがって、TextFieldをRow内で使用する場合にExpandedで囲む

```dart
body : Row(
  child : TextField(

  )
)
```

### TextField

- 入力フィールドを提供する

```dart
final controller = new TextEditingController();

body: Column(
  children: [
    Row(
      children: [
        Text("名前"),
        // Rowの中でTextFieldを使うためにはFlexibleの中で使う必要がある
        Flexible(
          child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Enter your name',
          ),
          onSubmitted: (text) {
            setState(() {
              inputString = text;
            })
          },
        ),
      ]
    )
  ]
)

// 別の場所で以下で値取得可能
print(controller.text)
```

### GestureDetector

- 任意のWidgetをボタンとして利用可能

```dart
body: GestureDetector(
  onTap: () => {
    setState(() {
      inputString = controller.text;
    })
  },
  child: Icon(Icons.add_a_photo,size:50),
)
```

### ElevatedButton

- 一般的なボタン

```dart
body: ElevatedButton(
  child: Text("追加"),
  onPress: () => {
    print("Tap")
  }
  style: ElevatedButton.styleFrom(
    primary: Colors.red,
  )
)
```

### IconButton

- アイコンをボタンにすることができる

### OutlinedButton

- 外枠のあるボタン

### TextButton

- テキストをボタンにできる

### DropdownButton

- ドロップダウンでボタンができる

```dart
body: DropdownButton(
  value:selectedValue,
  items: 
  [
    DropdownMenuItem(child: Text("男"), value: 0),
    DropdownMenuItem(child: Text("女"), value: 1),
  ], 
  onChanged: (newValuue){
    setState((){
      selectedValue = newValuue as int;
    });
  }
),
```

```dart
List<String> prefectureList = ["北海道","青森","岩手","秋田","宮城","山形","福島"];

body: DropdownButton(
  value:selectedValue,
  items: prefectureList.map((item) => 
    DropdownMenuItem(child: Text(item), value: prefectureList.indexOf(item))
  ).toList(),
```

### PopUpMenuButton

### Slider

- スライダーバーを表示する

```dart
body: Slider(
  min: 0,
  max: 100,
  divisions: 100,
  value: sliderValue,
  onChanged: (newValue) {
    setState(() {
      sliderValue = newValue;
      print(sliderValue);
    });
  },
),
```

### BackButton

- ページの戻るボタンの実装に使う
  - appbarのleading属性にIconButtonなどの指定でも可能だが、BackButtonを使うとiOS/Androidの標準のアイコンが使用される。

```dart
appBar: AppBar(
  title: Text('Next Sub Page'),
  centerTitle: true,
  backgroundColor: Color.fromRGBO(233, 112, 19, 0.473),
  leading: BackButton(
    onPressed: () => {
      print("処理"),
      Navigator.pop(context)
    },
  ),
)

```

### Checkbox

- チェックボックスを表示する

```dart
Checkbox(
    value: isChecked,
    onChanged: (value) {
      setState(() {
        isChecked = value;
      });
    },
    activeColor: Colors.red,
    checkColor: Colors.black,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
    ),
),
```

### Swith

```dart
Switch(
  value: isActive, 
  activeTrackColor: Colors.deepOrange,
  inactiveTrackColor: Colors.greenAccent,
  onChanged: (value){ 
    isActive = value;
    setState(() {});
  }
)
```

## 非同期処理用Widget

### FutureBuilder

```dart
  // 非同期でデータを取得するメソッド
  Future<List<String>> getList() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return [
        "佐々木寿人",
        "滝沢和典",
      ];
    } catch (e) {
      return Future.error(e);
    }
  }


body: FutureBuilder(
  future: getList(),  // 非同期処理のメソッド
  builder: (context, snapshot) {  // 非同期完了後の処理

    // データ取得中の処理
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.greenAccent,
      ));
    }

    // エラーが発生した場合
    if (snapshot.hasError) {
      return Center(child: Text(snapshot.error.toString()));
    }

    // データ取得された場合
    if (snapshot.hasData) {
      if (snapshot.data!.isEmpty) {
        return const Center(child: Text("データが存在しません"));
      }

      return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(snapshot.data![index]),
                ),
                Divider(),
              ],
            );
          });
    }

    // デフォルトの戻り値
    return const Center(child: Text("データが存在しません"));
  }),
```

### StreamBuilder

- setStateすると画面全体に描画がかかりコスト効率が悪いため特定の変数だけ画面リフレッシュをかける時にはこちらが便利


```dart
  final StreamController<int> controller = StreamController<int>();
  int _counter = 0;

body: StreamBuilder<int>(
  stream: controller.stream,
  // 部分的に描画する部分をStreamBuilderで囲む
  builder: (context, snapshot) {
    return Text(
      '$_counter',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: (_counter > 10) ? Colors.red : Colors.black,
      ),
    );
  }
),

// 値の更新
controller.sink.add(_counter++);

```

## 画面割(bodyと同じ階層)

### drawer

```dart
drawer: Drawer(
  backgroundColor: const Color.fromARGB(255, 200, 247, 214),
  child: SafeArea(
    child: Column(
      children: [
        const ListTile(
          title: Text("Item 1"),
          leading: Icon(Icons.account_circle_outlined),
        ),
        Divider(),
        const ListTile(
          title: Text("Item 2"),
          leading: Icon(Icons.account_circle_outlined),
        ),
        Divider(),
        const ListTile(
          title: Text("Item 3"),
          leading: Icon(Icons.account_circle_outlined),
        ),
      ],
    ),
  )
),
```


### showModalBottomSheet

- 画面の下部から出てくるモーダル

```
showModalBottomSheet(
  context: context,
  builder: (context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('編集'),
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: const Text('削除'),
          ),
        ]
      ),
    );
  });
)
```