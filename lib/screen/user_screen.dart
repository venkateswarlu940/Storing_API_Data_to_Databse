
import 'package:api_storage/model/user_model2.dart';
import 'package:api_storage/screen/splash.dart';
import 'package:api_storage/service/user_service.dart';
import 'package:flutter/material.dart';
class User_Api extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
              child: JSONListView()
          ),
        ));
  }
}
class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      appBar: AppBar(
        title: Text('JSON ListView in Flutter'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Employee>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: splash_data());

          return ListView(
            children: snapshot.data
                .map((user) => ListTile(
              title: Text(user.name),
              trailing: Text(user.email),
              onTap: ()
              { print(user.name); },
              subtitle: Text(user.address.city + '\n' + user.address.street +'\n'+user.phone),

            ),

            )
                .toList(),




          );
        },
      ),
      ),
    );
  }
}