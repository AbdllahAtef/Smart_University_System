import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/schedule/presentation/schedule_constants.dart';

class AddLectureForm extends StatelessWidget {
  const AddLectureForm({
    super.key,
    required this.titleController,
    required this.subtitleController,
    required this.instructorController,
    required this.roomController,
    required this.selectedDay,
    required this.onDayChanged,
    required this.startTime,
    required this.endTime,
    required this.onPickStartTime,
    required this.onPickEndTime,
    required this.onSave,
    required this.isLoading,
  });

  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TextEditingController instructorController;
  final TextEditingController roomController;

  final int selectedDay;

  final ValueChanged<int?> onDayChanged;

  final String startTime;
  final String endTime;

  final VoidCallback onPickStartTime;
  final VoidCallback onPickEndTime;

  final VoidCallback onSave;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: "Title",
              hintText: "e.g. Memory Management",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          TextFormField(
            controller: subtitleController,
            decoration: InputDecoration(
              labelText: "Subtitle",
              hintText: "e.g. Advanced C++ Pointers",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          TextFormField(
            controller: instructorController,
            decoration: InputDecoration(
              labelText: "Instructor",
              hintText: "e.g. Dr. Jane Smith",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: roomController,
                  decoration: InputDecoration(
                    labelText: "Room",
                    hintText: "Lab 302",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: DropdownButtonFormField<int>(
                  value: selectedDay,
                  decoration: InputDecoration(
                    labelText: "Day",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  items: List.generate(
                    days.length,
                    (index) => DropdownMenuItem(
                      value: index ,
                      child: Text(days[index]),
                    ),
                  ),
                  onChanged: onDayChanged,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onPickStartTime,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 18.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Text(startTime),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: GestureDetector(
                  onTap: onPickEndTime,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 18.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Text(endTime),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30.h),

          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: ElevatedButton(
              onPressed: isLoading ? null : onSave,

              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Save Lecture Date"),
            ),
          ),
        ],
      ),
    );
  }
}
