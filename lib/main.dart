import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:modu/features/map/map_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://gbzqvrdhwwvjegxtvyzk.supabase.co';
String supabaseKey = String.fromEnvironment(dotenv.get('SUPABASE_KEY'));

Future<void> main() async {
  //supabase 초기화 하기 전 앱 초기화
  WidgetsFlutterBinding.ensureInitialized();

  //dotenv 파일에서 변수 가져오기
  await dotenv.load(fileName: ".env");

  //supabase 적용
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapScreen(),
    );
  }
}
