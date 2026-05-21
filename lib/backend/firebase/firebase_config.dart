import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCPiUK1-H-L9IfxpzDQam2V8g6STAPCcmE",
            authDomain: "quickart-customer.firebaseapp.com",
            projectId: "quickart-customer",
            storageBucket: "quickart-customer.appspot.com",
            messagingSenderId: "616864050624",
            appId: "1:616864050624:web:92356ffdf2872d47b92c25",
            measurementId: "G-GNWL8Y3SGE"));
  } else {
    await Firebase.initializeApp();
  }
}
