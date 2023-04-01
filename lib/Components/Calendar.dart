import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../Constants.dart';

class Calendar extends StatelessWidget {
  RxString startDate;
  RxString endDate;
  Calendar({required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ScrollableCleanCalendar(
              calendarController: CleanCalendarController(
                minDate: DateTime.now(),
                maxDate: DateTime.now().add(const Duration(days: 365)),
                onRangeSelected: (firstDate, secondDate) {
                  var first =
                      "${firstDate.day}-${firstDate.month}-${firstDate.year}";
                  var second;
                  if (secondDate == null) {
                    second = "End Date";
                  } else {
                    second =
                        "${secondDate?.day}-${secondDate?.month}-${secondDate?.year}";
                  }

                  startDate.value = first.toString();
                  endDate.value = second.toString();
                  print(firstDate);
                },
                onDayTapped: (date) {},
                // readOnly: true,
                onPreviousMinDateTapped: (date) {},
                onAfterMaxDateTapped: (date) {},
                weekdayStart: DateTime.monday,
                // initialFocusDate: DateTime(2023, 5),
                // initialDateSelected: DateTime(2022, 3, 15),
                // endDateSelected: DateTime(2022, 3, 20),
              ),
              layout: Layout.DEFAULT,
              calendarCrossAxisSpacing: 0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: padding_m, horizontal: padding_xm),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[850]),
              child: Text(
                "Select Dates",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
