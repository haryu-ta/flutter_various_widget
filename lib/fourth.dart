import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FourthPage extends StatefulWidget {
  FourthPage({super.key});

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final List<String> _pages = ["Page1", "Page2", "Page3", "Page4"];
  final List<String> prefectureList = [
    "北海道",
    "青森",
    "岩手",
    "秋田",
    "宮城",
    "山形",
    "福島"
  ];

  String inputString = "初期値";
  final textController = TextEditingController();
  final numberController = TextEditingController();
  final pwController = TextEditingController();

  int strLength = 0;
  String? textErrorMessage = null;
  int selectedValue = 0;
  double sliderValue = 0;
  bool? isChecked = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Fourth Page'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(233, 112, 19, 0.473),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      ..._pages.map((page) {
                        return PopupMenuItem(
                          child: Text(page),
                          value: page,
                        );
                      }).toList()
                    ])
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("名前："),
                Flexible(
                  child: TextField(
                    controller: textController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      errorText: textErrorMessage,
                      errorStyle: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                    textInputAction: TextInputAction.done, // キーボードの完了ボタンのカスタマイズ
                    onEditingComplete: () => {
                      setState(() {
                        textErrorMessage = validate();
                      })
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("年齢："),
                Flexible(
                  child: TextField(
                    controller: numberController,
                    decoration: InputDecoration(
                      hintText: '20',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]')), // 数値の入力のみを許可
                      //FilteringTextInputFormatter.deny(RegExp(r'[a-zA-z]')) // 英字以外のみを許可
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("パスワード："),
                Flexible(
                  child: TextField(
                    controller: pwController,
                    decoration: InputDecoration(
                      hintText: '1234',
                      counterText: strLength.toString() + "文字",
                      counterStyle: TextStyle(color: Colors.red),
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9a-zA-Z@#]')),
                    ],
                    maxLength: 8,
                    maxLengthEnforcement: MaxLengthEnforcement.none,
                    obscureText: true, // パスワードを隠す
                    obscuringCharacter: '＊', // パスワードを隠す文字
                    onChanged: (value) => {
                      setState(() {
                        strLength = pwController.text.length;
                      })
                    },
                  ),
                ),
              ],
            ),
            DropdownButton(
                value: selectedValue,
                // items:
                // [
                //   DropdownMenuItem(child: Text("男"), value: 0),
                //   DropdownMenuItem(child: Text("女"), value: 1),
                // ],
                items: prefectureList
                    .map((item) => DropdownMenuItem(
                        child: Text(item), value: prefectureList.indexOf(item)))
                    .toList(),
                onChanged: (newValuue) {
                  setState(() {
                    selectedValue = newValuue as int;
                  });
                }),
            Slider(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("同意："),
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
                Switch(
                  value: isActive, 
                  activeTrackColor: Colors.deepOrange,
                  inactiveTrackColor: Colors.greenAccent,
                  onChanged: (value){ 
                    isActive = value;
                    setState(() {});
                  }
                )
              ],
            ),
            Text(
              inputString,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(height: 50),
            GestureDetector(
              onTap: () => {
                setState(() {
                  inputString = textController.text;
                }),
                print(selectedValue)
              },
              child: Icon(Icons.add_a_photo, size: 50),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NextSubPage(inputString)))
        },
        child: Icon(Icons.arrow_right),
      ),
    );
  }

  String? validate() {
    if (textController.text.isEmpty) {
      return "名前を入力してください";
    } else if (textController.text.length < 3) {
      return "名前は3文字以上で入力してください";
    } else {
      return null;
    }
  }
}

class NextSubPage extends StatelessWidget {
  final String inputString;
  const NextSubPage(this.inputString);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Sub Page'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(233, 112, 19, 0.473),
        leading: BackButton(
          onPressed: () => {print("処理"), Navigator.pop(context)},
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Text("ページ表示")
      ),
    );
  }
}
