import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX 예제',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// 상태 관리를 위한 컨트롤러
class CounterController extends GetxController {
  RxInt count = 0.obs; // Observable 변수

  void increment() {
    count++;
  }

  void reset() {
    count.value = 0;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 컨트롤러 등록
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('GetX 기능 예제'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Obx를 사용한 반응형 상태 관리
            Obx(() => Text(
                  '현재 카운트: ${controller.count}',
                  style: const TextStyle(fontSize: 24),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(() => const SecondPage()),
              child: const Text('두 번째 페이지로 이동'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => const ThirdPage()),
              child: const Text('세 번째 페이지로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  '알림',
                  'GetX Snackbar 예제',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Snackbar 보여주기'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 이미 등록된 컨트롤러 가져오기
    final CounterController controller = Get.find<CounterController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('두 번째 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 상태 공유 예제
            Obx(() => Text(
                  '공유된 카운트: ${controller.count}',
                  style: const TextStyle(fontSize: 24),
                )),
            ElevatedButton(
              onPressed: () => Get.back(), // 뒤로가기
              child: const Text('뒤로가기'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(() => const ThirdPage()); // 현재 페이지 제거하고 이동
              },
              child: const Text('세 번째 페이지로 이동 (현재 페이지 제거)'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('세 번째 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => const HomePage()); // 모든 페이지 제거하고 홈으로
              },
              child: const Text('홈으로 돌아가기 (모든 페이지 제거)'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: '다이얼로그',
                  middleText: 'GetX Dialog 예제',
                  textConfirm: '확인',
                  textCancel: '취소',
                );
              },
              child: const Text('다이얼로그 보여주기'),
            ),
          ],
        ),
      ),
    );
  }
}
