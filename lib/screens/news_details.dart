import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/newsResponse.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  static const String routName = "NewsDetails";

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff39A552),
        title: Text("News Titel"),
        elevation: 0,
        toolbarHeight: 90,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Card(
          elevation: 16,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(22),
                      bottomLeft: Radius.circular(22)),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? "",
                    height: 160,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ), //image
                SizedBox(height: 10),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Title: ",
                        style: GoogleFonts.novaSquare(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: article.title ?? "",
                        style: GoogleFonts.aBeeZee(
                            color: Color(0xff707070),
                            // color: provider.themeMode == ThemeMode.light
                            // ? const Color(0xff707070)
                            //: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                RichText(
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Description: ",
                        style: GoogleFonts.novaSquare(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: article.description ?? "",
                        style: GoogleFonts.aBeeZee(
                            color: Color(0xff707070),
                            // color: provider.themeMode == ThemeMode.light
                            // ? const Color(0xff707070)
                            //: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Auther :",
                          style: GoogleFonts.novaSquare(
                              color: Colors.red, fontSize: 18)),
                      TextSpan(
                        text: article.author ?? "",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.blue,
                            // color: provider.themeMode == ThemeMode.light
                            // ? const Color(0xff707070)
                            //: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${article.publishedAt?.substring(0, 10)}",
                        style: TextStyle(
                            color: //provider.themeMode == ThemeMode.dark?
                                Colors.black45
                            // : Colors.white70,
                            ,
                            fontSize: 16)),
                    Text("${article.publishedAt?.substring(12, 16)}",
                        style: TextStyle(
                            color: // provider.themeMode == ThemeMode.dark?
                                Colors.black45
                            //: Colors.white70,
                            ,
                            fontSize: 16)),
                    SizedBox(
                      height: 80.h,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: () {showUrl(article.url);},
                        child: Text(
                          "View Full Artical",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                    SizedBox(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showUrl(String? url) async {
    if(url==null){return;}
   var uri= Uri.parse(url);
   if(await canLaunchUrl(uri)){
    launchUrl(uri);
   }
  }
}
