import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var controllerName = TextEditingController();
  var status = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getString();
  }

  @override
  
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor:const Color.fromARGB(255, 216, 245, 231),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Save Name',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 6, 30, 49)),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
                  child: TextField(
                    controller: controllerName,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.00)
                      )
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 24, 50, 94),
                    foregroundColor: Colors.white,
                    elevation: 20
                  ),
                  onPressed: () async{
                    var name = controllerName.text.toString();
                    var prefs =await SharedPreferences.getInstance();
                    prefs.setString("name", name);
                  }, 
                  child:const Text('Save Name',style: TextStyle(fontSize: 20),)),
                 Padding(
                  padding:const EdgeInsets.symmetric(vertical: 20),
                  child:Text(status,style:const TextStyle(fontSize: 25)),
                )
              ],
            ))));
  }
  void getString() async{
    var prefs =await SharedPreferences.getInstance();
    var valuee = prefs.getString("name");
    status = valuee != "" ? valuee.toString():'No Name Saved';
    setState(() {
      
    });
  }
}
