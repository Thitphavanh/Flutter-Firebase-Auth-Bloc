import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_bloc/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_auth_bloc/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Home'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.account_circle,
                // color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignoutRequestedEvent());
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/anitocorn.jpg',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              Text(
                'ຂ້ອຍຕອ້ງການຝຶກໂຕເອງໃຫ້ມີຄວາມຮູ້ ແລະ \nເຂົ້າໃຈພາບລວມຂອງການຂຽນ code ແລະ\n ການສ້າງນະວັດຕະກຳ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
