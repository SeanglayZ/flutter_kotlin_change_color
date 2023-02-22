import 'package:flutter/material.dart';
import 'package:flutter_kotlin_change_color/repository/platform_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _repository = PlatformRepository();
  String colorResult = '0xFFCA2C92';
  Future<String> changeColor(String color) async {
    colorResult = await _repository.changeColor(color);
    return colorResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(int.parse(colorResult)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.heart_broken),
              const Divider(
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const FlutterLogo(
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        changeColor("0xFF2196F3");
                      });
                    },
                  ),
                  ElevatedButton(
                    child: const Icon(Icons.headphones),
                    onPressed: () {
                      setState(() {
                        // Here we are going to set the orange color
                        changeColor("0xFFE65100");
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
