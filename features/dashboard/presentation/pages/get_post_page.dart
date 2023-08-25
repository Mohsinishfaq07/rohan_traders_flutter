import 'dart:convert';

import 'package:flutter/material.dart';

import '../../data/models/GetPostResponseModel.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PostPageContent();
  }
}

class PostPageContent extends StatefulWidget {
  const PostPageContent({Key? key}) : super(key: key);

  @override
  State<PostPageContent> createState() => _PostPageContentState();
}

class _PostPageContentState extends State<PostPageContent> {
  List<GetPostResponseModel> postList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" this is post screen "),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: FutureBuilder(
          //       // future: getPostAPi(),
          //       builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return const Text("loading");
          //     } else {
          //       return ListView.builder(
          //           itemCount: postList.length,
          //           itemBuilder: (context, index) {
          //             return Text(index.toString());
          //           });
          //     }
          //   }),
          // )
        ],
      ),
    );
  }
}
