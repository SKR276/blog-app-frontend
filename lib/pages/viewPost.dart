
import 'package:blogapp/models/postViewModel.dart';
import 'package:blogapp/services/postServices.dart';
import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  Future<List<ViewList>> ? data;
  @override
  void initState(){
    super.initState();
    data=PostApiService().getPostData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: data,
          builder: (context,snapshot){
            if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (value,index){
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Post:"+ snapshot.data![index].post),
                              subtitle: Text("Post Date:"+snapshot.data![index].postDate.toLocal().toString()),
                            )
                          ],
                        ),
                      );
                    });
              }
            else
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }),
    );
  }
}
