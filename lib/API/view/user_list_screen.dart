import 'package:andippkd_mpro_b2/API/api_flutter_1.dart';
// import 'package:andippkd_mpro_b2/API/model/user_model.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Data Api',
          style: TextStyle(fontFamily: 'Gilroy', color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final users = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: users?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final user = users?[index];
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "${user?.firstName} ${user?.lastName}",
                            style: TextStyle(fontFamily: 'Gilroy'),
                          ),
                          subtitle: Text('${user?.email}'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user?.avatar ?? ""),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text("Error: ${snapshot.error}");
              }
            },
          ),
        ],
      ),
    );
  }
}
