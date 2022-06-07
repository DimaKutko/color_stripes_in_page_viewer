import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color stripes in page viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController? pageController;
  static const links = [
    'https://image.emojisky.com/676/9577676-middle.png',
    'https://koenig-media.raywenderlich.com/uploads/2021/10/Teaching_Dash_.png',
    'https://avatars.githubusercontent.com/u/38634459?v=4',
  ];

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.6);
  }

  @override
  void dispose() {
    pageController?.dispose();

    super.dispose();
  }

  Widget _buildItem(String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.8),
          BlendMode.darken,
        ),
        child: SizedBox(
          height: 150,
          child: Image.network(link),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color stripes in page viewer')),
      backgroundColor: Colors.teal,
      body: Center(
        child: PageView.builder(
          itemCount: links.length,
          controller: pageController,
          itemBuilder: (_, i) => _buildItem(links[i]),
        ),
      ),
    );
  }
}
