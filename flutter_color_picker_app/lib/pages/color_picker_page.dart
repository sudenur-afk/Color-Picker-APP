import 'dart:math';

import 'package:flutter/material.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.pink;
  bool isCircular = false;
  bool isShowColorName = true;
  void _rastgeleRenkSec() {
    final colors = renkler.keys.toList();
    final rastgeleSayi = Random().nextInt(colors.length);
    final randomColor = colors[rastgeleSayi];
    setState(() {
      selectedColor = randomColor;
      debugPrint(rastgeleSayi.toString());
    });
  }

  void _containerSekliniDegistir() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  final Map<Color, String> renkler = {
    Colors.pink: 'Pembe',
    Colors.red: 'Kırmızı',
    Colors.blue: 'Mavi',
    Colors.green: 'Yeşil',
    Colors.yellow: 'Sarı',
    Colors.orange: 'Turuncu',
    Colors.purple: 'Mor',
    Colors.black: 'Siyah',
  };
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    debugPrint(deviceSize.toString());
    final containerSize = deviceSize.shortestSide * 0.4;
    debugPrint(containerSize.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isShowColorName = !isShowColorName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'a',
                  child: Row(children: [Text('Renk adını Göster / Gizle')]),
                ),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: containerSize,
                height: containerSize,
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.circular(
                    isCircular ? containerSize / 2 : 10,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: selectedColor,
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              isShowColorName
                  ? Text(
                    renkler[selectedColor] ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: selectedColor,
                    ),
                  )
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<Color>(
                      value: selectedColor,
                      items:
                          renkler.entries.map((entry) {
                            return DropdownMenuItem(
                              value: entry.key,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    color: entry.key,
                                  ),
                                  SizedBox(width: 4),
                                  Text(entry.value),
                                ],
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _rastgeleRenkSec,
                      child: Text('random'),
                    ),
                    IconButton(
                      onPressed: () {
                        // ignore: deprecated_member_use
                        final r = selectedColor.red;
                        // ignore: deprecated_member_use
                        final g = selectedColor.green;
                        // ignore: deprecated_member_use
                        final b = selectedColor.blue;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: selectedColor,
                            content: Text(
                              'Renk Kodları: $r, $g, $b',
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: selectedColor,
                              ),
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      icon: Icon(Icons.info),
                    ),
                    IconButton(
                      onPressed: () {
                        _containerSekliniDegistir();
                      },
                      icon: Icon(
                        isCircular
                            ? Icons.square_outlined
                            : Icons.circle_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
