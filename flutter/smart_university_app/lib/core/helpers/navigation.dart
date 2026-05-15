import 'package:smart_university_app/features/home/data/model/navigation_item.dart';
import 'package:smart_university_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/courses_view_body.dart';
import 'package:smart_university_app/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/result_view_body.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/schedule_view_body.dart';

const navigationItems = [
  NavigationItem(title: "Home", page: HomeViewBody()),
  NavigationItem(title: "Courses", page: CoursesViewBody()),
  NavigationItem(title: "Schedule", page: Scheduleviewbody()),
  NavigationItem(title: "Result", page: ResultViewBody()),
  NavigationItem(title: "Profile", page: ProfileViewBody()),
];


