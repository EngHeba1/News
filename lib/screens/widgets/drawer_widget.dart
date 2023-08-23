import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_task/styles/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  //const DrawerWidget({super.key});
 Function onDrawerClick;
 DrawerWidget(this.onDrawerClick);
  static int catogry=1;
  static int setting=2;
 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.7,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 7,
                decoration: BoxDecoration(
                  color: AppCloros.greenColor,
                ),
                child: Center(
                  child: Text("News App !", style: GoogleFonts.novaFlat(
                      fontSize: 22, color: Colors.white),),
                )),
            SizedBox(height: 12.h),
            InkWell(
              onTap: (){
                onDrawerClick(catogry);
              },
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                      children: [Icon(Icons.list), Text("Categories", style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium?.copyWith( fontSize: 18))
                      ])),
            ),
          SizedBox(height: 12.h),
          InkWell(
            child: InkWell(
              onTap: (){
               onDrawerClick(setting);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    children: [Icon(Icons.settings), Text("Settings", style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium?.copyWith( fontSize: 18))
                    ]),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
