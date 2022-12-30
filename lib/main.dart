import 'package:plants/state/objectbox_state.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'helper/objectbox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // create an object for ObjectBoxInstance
  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();
  runApp(
    const MyApp(
      debugShowCheckedModeBanner: false,
    ),
  );
}
