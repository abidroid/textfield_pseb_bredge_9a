import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var fullName = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Concatenation'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: firstController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(height: 15,),
              TextField(
                controller: lastController,
                decoration: const InputDecoration(
                  hintText: 'Last Name'
                ),
              ),
              const SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(child: ElevatedButton(
                    onPressed: (){

                      firstController.clear();
                      lastController.clear();

                      setState((){
                        fullName = '';
                      });

                    },
                    child: const Text('Clear'),
                  )),
                  const SizedBox(width: 15,),
                  Expanded(child: ElevatedButton(
                    onPressed: (){

                      String firstName = firstController.text.trim();
                      String lastName = lastController.text.trim();

                      if( firstName.isEmpty || lastName.isEmpty){

                        Fluttertoast.showToast(msg: 'Please provide both names');
                      }else{

                        setState((){
                          fullName = '$firstName $lastName';
                        });
                      }
                    },
                    child: const Text('Combine'),
                  )),
                ],
              ),

              const SizedBox(height: 15,),

              Text(fullName)

            ],
          ),
        ),
      ),
    );
  }
}
