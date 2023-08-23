import 'package:flutter/material.dart';
import 'package:news_task/screens/widgets/new_item.dart';

import '../models/newsResponse.dart';
import '../network/remot/api_manger.dart';

class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions           //search icon
    return [IconButton(onPressed: (){showResults(context);},
        icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading            //close icon
   return IconButton(onPressed: (){Navigator.pop(context);},
       icon: Icon(Icons.close))    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults      //screen of search contain news iteme //future builder
    return FutureBuilder(
      future: ApiManger.getNews(searchKey: query ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text("Sorry something Wrong"),
              TextButton(onPressed: () {}, child: Text("TRY again"))
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text("Sorry something Wrong"),
              TextButton(onPressed: () {}, child: Text("TRY again"))
            ],
          );
        }
        List<Articles> artical = snapshot.data?.articles ?? [];
        return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return
                  // Text(artical[index]?.title??"");
                  NewsItem(artical[index]);
              },
              itemCount: artical.length,
            ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return const Center(
          child: Text("Please Enter word to search"));
    }
    else{return FutureBuilder(
      future: ApiManger.getNews(searchKey: query ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text("Sorry something Wrong"),
              TextButton(onPressed: () {}, child: Text("TRY again"))
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              Text("Sorry something Wrong"),
              TextButton(onPressed: () {}, child: Text("TRY again"))
            ],
          );
        }
        List<Articles> artical = snapshot.data?.articles ?? [];
        return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return
                  // Text(artical[index]?.title??"");
                  NewsItem(artical[index]);
              },
              itemCount: artical.length,
            ));
      },
    );}

  }
  
}