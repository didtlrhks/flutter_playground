import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  bool isUserInfoSelected = false;
  bool isStructureSelected = false;
  bool isFileSelected = false;
  bool isEtcSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSelectionTile(
                '사용자 조사 (정량 리서치 등)',
                isUserInfoSelected,
                (value) => setState(() => isUserInfoSelected = value!),
              ),
              _buildSelectionTile(
                '구인 (인터뷰이 모집 등)',
                isStructureSelected,
                (value) => setState(() => isStructureSelected = value!),
              ),
              _buildSelectionTile(
                '파일 수합 (지원서, 자료 수합 등)',
                isFileSelected,
                (value) => setState(() => isFileSelected = value!),
              ),
              _buildSelectionTile(
                '기타',
                isEtcSelected,
                (value) => setState(() => isEtcSelected = value!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionTile(
    String title,
    bool isSelected,
    Function(bool?) onChanged, {
    bool isHighlighted = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE8F5F9) : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: CheckboxListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        value: isSelected,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.blue,
        checkColor: Colors.white,
      ),
    );
  }
}
