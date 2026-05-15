import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/utils/date_utils.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/news_events/data/model/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 16, right: 16),
      child: Container(
        width: 348.w,
        height: 115.h,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFCBCBCB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: TextStyles.textstyle18.copyWith(
                      color: Colors.black,
                      fontSize: 17.sp,
                    ),
                  ),

                  Text(
                    news.content,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textstyle14.copyWith(
                      color: Colors.grey[600],
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 19.h,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                formatDatePretty(news.createdAt),
                style: TextStyles.textstyle8.copyWith(
                  color: Colors.black,
                  fontSize: 9.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



