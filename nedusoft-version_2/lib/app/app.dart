
import 'package:nedusoft/UI/Assignment/assignment_detail.dart';
import 'package:nedusoft/UI/Attendance/Attendance.dart';
import 'package:nedusoft/UI/Attendance/subject_report/report_screen.dart';
import 'package:nedusoft/UI/Events/events.dart';
import 'package:nedusoft/UI/FeeDetails/fee_screen.dart';
import 'package:nedusoft/UI/LoginFlow/Sign_in.dart';
import 'package:nedusoft/UI/LoginFlow/add_school_code.dart';
import 'package:nedusoft/UI/Menu/Menu.dart';
import 'package:nedusoft/UI/feedback/add_feedback.dart';
import 'package:nedusoft/UI/feedback/feedback.dart';
import 'package:nedusoft/UI/feedback/feedback_detail.dart';
import 'package:nedusoft/UI/learn/chapter_videos.dart';
import 'package:nedusoft/UI/learn/student_learn.dart';
import 'package:nedusoft/UI/lesson_update/lesson_update.dart';
import 'package:nedusoft/UI/staff/Attendance/Attendance.dart';
import 'package:nedusoft/UI/staff/Attendance/attendance_show.dart';
import 'package:nedusoft/UI/staff/Attendance/edit_attendance/edit_att_show.dart';
import 'package:nedusoft/UI/staff/Attendance/edit_attendance/edit_atte_form.dart';
import 'package:nedusoft/UI/staff/Attendance/monthly_report/report_screen.dart';
import 'package:nedusoft/UI/staff/Menu/Profile.dart';
import 'package:nedusoft/UI/staff/assignment/add_assignmnet.dart';
import 'package:nedusoft/UI/staff/assignment/submit_assignmnet/submit_ass_detail.dart';
import 'package:nedusoft/UI/staff/chapters/add_chapters.dart';
import 'package:nedusoft/UI/staff/chapters/chapters.dart';
import 'package:nedusoft/UI/staff/chapters/edit_chapter.dart';
import 'package:nedusoft/UI/staff/faculty_allocation/add_student.dart';
import 'package:nedusoft/UI/staff/feedback/feedback.dart';
import 'package:nedusoft/UI/staff/feedback/feedback_detail.dart';
import 'package:nedusoft/UI/staff/learn/video_detail.dart';
import 'package:nedusoft/UI/staff/lesson_update/add_lesson_update.dart';
import 'package:nedusoft/UI/staff/lesson_update/edit_lesson_update.dart';
import 'package:nedusoft/UI/staff/lesson_update/lesson_detail.dart';
import 'package:nedusoft/UI/staff/lesson_update/lesson_update_screen.dart';
import 'package:nedusoft/UI/staff/lesson_update/pdf_view.dart';
import 'package:nedusoft/UI/staff/marks/add_marks.dart';
import 'package:nedusoft/UI/staff/marks/edit/edit_marks.dart';
import 'package:nedusoft/UI/staff/marks/edit/update_marks.dart';
import 'package:nedusoft/UI/staff/marks/marks.dart';
import 'package:nedusoft/UI/staff/notifications/notification.dart';
import 'package:nedusoft/UI/staff/notifications/notification_detail.dart';
import 'package:nedusoft/UI/staff/time_table/time_table_screen.dart';
import 'package:nedusoft/UI/time_table/time_table_screen.dart';
import 'package:nedusoft/models/staff/notification_detail.dart';
import 'package:stacked/stacked_annotations.dart';

import '../UI/Assignment/assignment.dart';
import '../UI/Assignment/assignment_history.dart';
import '../UI/Attendance/monthly_report/report_screen.dart';
import '../UI/Attendance/yearly_report/report_screen.dart';
import '../UI/FeeDetails/fees_receipts.dart';
import '../UI/FeeDetails/web_view.dart';
import '../UI/IntroScreen/Intro_screen.dart';
import '../UI/Marks/marks_details.dart';
import '../UI/Menu/Deshboard.dart';
import '../UI/Menu/Profile.dart';
import '../UI/Notification/Notification.dart';
import '../UI/common/setting.dart';
import '../UI/feedback/feedback_history.dart';
import '../UI/learn/student_chapters.dart';
import '../UI/lesson_update/lesson_detail.dart';
import '../UI/staff/Attendance/monthly_report/student_attendance_report.dart';
import '../UI/staff/Attendance/my_attendance/my_attendance_screen.dart';
import '../UI/staff/marks/subject_wise_report/exam_wise_report.dart';
import '../UI/staff/marks/subject_wise_report/student_show_screen.dart';
import '../UI/staff/marks/subject_wise_report/subject_wise_report_screen.dart';
import '../UI/staff/Attendance/yearly_report/report_screen.dart';
import '../UI/staff/Menu/Deshboard.dart';
import '../UI/staff/Menu/Menu.dart';
import '../UI/staff/assignment/assignment.dart';
import '../UI/staff/assignment/edit_assignment.dart';
import '../UI/staff/assignment/submit_assignmnet/submit_assignment.dart';
import '../UI/staff/assignment/submit_assignmnet/submit_assignment_history.dart';
import '../UI/staff/faculty_allocation/delocation/deallocate_student.dart';
import '../UI/staff/faculty_allocation/delocation/faculty_deallocation.dart';
import '../UI/staff/faculty_allocation/faculty_allocation.dart';
import '../UI/staff/feedback/feedback_detail_history.dart';
import '../UI/staff/learn/add_video.dart';
import '../UI/staff/learn/faculty_videos.dart';

@StackedApp(
  routes: [
    ///////////////////

    //new Screens
    AdaptiveRoute(page: Splashscreen, initial: true),
    AdaptiveRoute(page: Onbording,),
    AdaptiveRoute(page: Signin,),
    AdaptiveRoute(page: AddSchoolCode,),
    // AdaptiveRoute(page: Deshboard,),
    AdaptiveRoute(page: Profile,),
    AdaptiveRoute(page: Menu,),
    AdaptiveRoute(page: Attendance,),
    AdaptiveRoute(page: Notificationpage,),
    AdaptiveRoute(page: NotificationDetail,),
    AdaptiveRoute(page: LessonUpdateScreen,),
    // AdaptiveRoute(page: StaffDeshboard,),
    AdaptiveRoute(page: StaffMenu,),
    AdaptiveRoute(page: StaffAttendance,),
    AdaptiveRoute(
      page: StaffAttendanceShow,
    ),
    // AdaptiveRoute(page: DoneAttendance,),
    AdaptiveRoute(page: EditAttFormScreem,),
    AdaptiveRoute(page: EditAttShowScreen,),
    AdaptiveRoute(page: StaffNotification,),
    AdaptiveRoute(page: StaffProfileScreen,),
    AdaptiveRoute(page: StaffAddLessonUpdate,),
    AdaptiveRoute(page: StaffLessonUpdateScreen,),
    AdaptiveRoute(page: StaffAddAssignment,),
    AdaptiveRoute(page: StaffEditAssignment,),
    AdaptiveRoute(
      page: StaffSubmitAssDetail,
    ),
    AdaptiveRoute(
      page: AssignmentDetailScreen,
    ),
    AdaptiveRoute(
      page: StaffNotificationDetail,
    ),
    AdaptiveRoute(
      page: StaffTimeTable,
    ),
    AdaptiveRoute(
      page: StaffMarks,
    ),
    AdaptiveRoute(
      page: StaffFeedBackDetail,
    ),
    AdaptiveRoute(
      page: StaffFeedBack,
    ),
    AdaptiveRoute(
      page: StaffAddMarkScreen,
    ),
    AdaptiveRoute(
      page: StaffEditMarks,
    ),
    AdaptiveRoute(
      page: StudentMarkDetail,
    ),
    AdaptiveRoute(
      page: StaffUpdateMarkScreen,
    ),
    
    AdaptiveRoute(page: PdfViewer,),
    AdaptiveRoute(
      page: SubmitAssignment,
    ),
    AdaptiveRoute(
      page: StudentTimeTable,
    ),
    AdaptiveRoute(
      page: StaffMyChapterScreen,
    ),

    AdaptiveRoute(
      page: StaffAddChapter,
    ),
    AdaptiveRoute(
      page: StaffFacultyAllocationScreen,
    ),
    AdaptiveRoute(
      page: StudentAllocation,
    ),
    AdaptiveRoute(
      page: StaffFacultyDeAllocationScreen,
    ),
    AdaptiveRoute(
      page: StudentDeAllocation,
    ),

    AdaptiveRoute(
      page: StudentFeesDetail,
    ),
    AdaptiveRoute(
      page: StudentFeedBack,
    ),
    AdaptiveRoute(
      page: StudentFeedBackDetail,
    ),
    AdaptiveRoute(
      page: StudentAddFeedback,
    ),
    AdaptiveRoute(
      page: StaffVideosScreen,
    ),
    AdaptiveRoute(
      page: EventDetail,
    ),
    AdaptiveRoute(
      page: VideoDetailScreen,
    ),
    AdaptiveRoute(
      page: AddVideoScreen,
    ),
    AdaptiveRoute(
      page: BuildClasses,
    ),
    AdaptiveRoute(
      page: StudentBuildClasses,
    ),
    AdaptiveRoute(
      page: StudentLearn,
    ),
    AdaptiveRoute(
      page: StudentLearnChapters,
    ),
    AdaptiveRoute(
      page: ChapterVideo,
    ),
    AdaptiveRoute(
      page: VideoScreen,
    ),
    AdaptiveRoute(
      page: StaffAssignmentScreen,
    ),
    AdaptiveRoute(
      page: StaffEditChapter,
    ),
    AdaptiveRoute(
      page: AssignmentHistoryScreen,
    ),
    AdaptiveRoute(
      page: StaffAssignmentHistoryScreen,
    ),
    AdaptiveRoute(
      page: StaffFeedBackHistoryScreen,
    ),
    AdaptiveRoute(
      page: FeedbackHistoryScreen,
    ),
    AdaptiveRoute(
      page: StudentFeesReceipts,
    ),
    AdaptiveRoute(
      page: SettingScreen,
    ),
    AdaptiveRoute(
      page: StudentAssignmentScreen,
    ),
    AdaptiveRoute(
      page: StaffLessonDetail,
    ),
    AdaptiveRoute(
      page: StudentLessonDetail,
    ),
    AdaptiveRoute(
      page: WebviewScreen,
    ),
    AdaptiveRoute(
      page: StaffEditLessonUpdate,
    ),
    AdaptiveRoute(
      page: StudentAttendanceListReportScreen,
    ),
    AdaptiveRoute(
      page: AttendanceYearlyReportScreen,
    ),
    AdaptiveRoute(
      page: StudentAttendanceReportScreen,
    ),
    AdaptiveRoute(
      page: StudentAttendanceYearlyReportScreen,
    ),
    AdaptiveRoute(
      page: CollegeAttendanceYearlyReportScreen,
    ),
    AdaptiveRoute(
      page: StudentWiseAttendanceReportScreen,
    ),
    AdaptiveRoute(
      page: StudentWiseReportScreen,
    ),
    AdaptiveRoute(
      page: StudentShowListReportScreen,
    ),
    AdaptiveRoute(
      page: StudentExamWiseReportScreen,
    ),
    AdaptiveRoute(
      page: MyAttendanceReportScreen,
    ),
    
  ],
)
class App {}
