// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i88;
import 'dart:typed_data' as _i76;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i81;
import 'package:nedusoft/models/attendance_model.dart' as _i83;
import 'package:nedusoft/models/getall_attendance_model.dart' as _i78;
import 'package:nedusoft/models/getall_section_model.dart' as _i79;
import 'package:nedusoft/models/getall_subject_model.dart' as _i82;
import 'package:nedusoft/models/getattendance_model.dart' as _i80;
import 'package:nedusoft/models/lesson_update_model.dart' as _i100;
import 'package:nedusoft/models/notification_model.dart' as _i77;
import 'package:nedusoft/models/staff/all_marks_students_model.dart' as _i86;
import 'package:nedusoft/models/staff/faculty_allocation_model.dart' as _i90;
import 'package:nedusoft/models/staff/feedback_detail_model.dart' as _i98;
import 'package:nedusoft/models/staff/get_faculty_videos.dart' as _i92;
import 'package:nedusoft/models/staff/get_timetable_model.dart' as _i94;
import 'package:nedusoft/models/staff/get_video_detail_model.dart' as _i93;
import 'package:nedusoft/models/staff/lesson_onpage_model.dart' as _i85;
import 'package:nedusoft/models/staff/my_chapter_list_model.dart' as _i89;
import 'package:nedusoft/models/staff/submit_ass_detail_model.dart' as _i97;
import 'package:nedusoft/models/staff_info_model.dart' as _i84;
import 'package:nedusoft/models/student/get_mark_dropdown_model.dart' as _i87;
import 'package:nedusoft/models/student/student_assignment_detail_model.dart'
    as _i96;
import 'package:nedusoft/models/student/student_event_model.dart' as _i91;
import 'package:nedusoft/models/student/student_feedback_detail_model.dart'
    as _i99;
import 'package:nedusoft/models/student/student_learn_model.dart' as _i95;
import 'package:nedusoft/models/user_info_model.dart' as _i75;
import 'package:nedusoft/UI/Assignment/assignment.dart' as _i60;
import 'package:nedusoft/UI/Assignment/assignment_detail.dart' as _i22;
import 'package:nedusoft/UI/Assignment/assignment_history.dart' as _i54;
import 'package:nedusoft/UI/Attendance/Attendance.dart' as _i7;
import 'package:nedusoft/UI/Attendance/monthly_report/report_screen.dart'
    as _i67;
import 'package:nedusoft/UI/Attendance/subject_report/report_screen.dart'
    as _i69;
import 'package:nedusoft/UI/Attendance/yearly_report/report_screen.dart'
    as _i68;
import 'package:nedusoft/UI/common/setting.dart' as _i59;
import 'package:nedusoft/UI/Events/events.dart' as _i46;
import 'package:nedusoft/UI/feedback/add_feedback.dart' as _i44;
import 'package:nedusoft/UI/feedback/feedback.dart' as _i42;
import 'package:nedusoft/UI/feedback/feedback_detail.dart' as _i43;
import 'package:nedusoft/UI/feedback/feedback_history.dart' as _i57;
import 'package:nedusoft/UI/FeeDetails/fee_screen.dart' as _i41;
import 'package:nedusoft/UI/FeeDetails/fees_receipts.dart' as _i58;
import 'package:nedusoft/UI/FeeDetails/web_view.dart' as _i63;
import 'package:nedusoft/UI/IntroScreen/Intro_screen.dart' as _i2;
import 'package:nedusoft/UI/learn/chapter_videos.dart' as _i51;
import 'package:nedusoft/UI/learn/student_chapters.dart' as _i50;
import 'package:nedusoft/UI/learn/student_learn.dart' as _i49;
import 'package:nedusoft/UI/lesson_update/lesson_detail.dart' as _i62;
import 'package:nedusoft/UI/lesson_update/lesson_update.dart' as _i9;
import 'package:nedusoft/UI/LoginFlow/add_school_code.dart' as _i4;
import 'package:nedusoft/UI/LoginFlow/Sign_in.dart' as _i3;
import 'package:nedusoft/UI/Marks/marks_details.dart' as _i30;
import 'package:nedusoft/UI/Menu/Menu.dart' as _i6;
import 'package:nedusoft/UI/Menu/Profile.dart' as _i5;
import 'package:nedusoft/UI/Notification/Notification.dart' as _i8;
import 'package:nedusoft/UI/staff/assignment/add_assignmnet.dart' as _i19;
import 'package:nedusoft/UI/staff/assignment/assignment.dart' as _i52;
import 'package:nedusoft/UI/staff/assignment/edit_assignment.dart' as _i20;
import 'package:nedusoft/UI/staff/assignment/submit_assignmnet/submit_ass_detail.dart'
    as _i21;
import 'package:nedusoft/UI/staff/assignment/submit_assignmnet/submit_assignment.dart'
    as _i33;
import 'package:nedusoft/UI/staff/assignment/submit_assignmnet/submit_assignment_history.dart'
    as _i55;
import 'package:nedusoft/UI/staff/Attendance/Attendance.dart' as _i11;
import 'package:nedusoft/UI/staff/Attendance/attendance_show.dart' as _i12;
import 'package:nedusoft/UI/staff/Attendance/edit_attendance/edit_att_show.dart'
    as _i14;
import 'package:nedusoft/UI/staff/Attendance/edit_attendance/edit_atte_form.dart'
    as _i13;
import 'package:nedusoft/UI/staff/Attendance/monthly_report/report_screen.dart'
    as _i65;
import 'package:nedusoft/UI/staff/Attendance/monthly_report/student_attendance_report.dart'
    as _i70;
import 'package:nedusoft/UI/staff/Attendance/my_attendance/my_attendance_screen.dart'
    as _i74;
import 'package:nedusoft/UI/staff/Attendance/yearly_report/report_screen.dart'
    as _i66;
import 'package:nedusoft/UI/staff/chapters/add_chapters.dart' as _i36;
import 'package:nedusoft/UI/staff/chapters/chapters.dart' as _i35;
import 'package:nedusoft/UI/staff/chapters/edit_chapter.dart' as _i53;
import 'package:nedusoft/UI/staff/faculty_allocation/add_student.dart' as _i38;
import 'package:nedusoft/UI/staff/faculty_allocation/delocation/deallocate_student.dart'
    as _i40;
import 'package:nedusoft/UI/staff/faculty_allocation/delocation/faculty_deallocation.dart'
    as _i39;
import 'package:nedusoft/UI/staff/faculty_allocation/faculty_allocation.dart'
    as _i37;
import 'package:nedusoft/UI/staff/feedback/feedback.dart' as _i27;
import 'package:nedusoft/UI/staff/feedback/feedback_detail.dart' as _i26;
import 'package:nedusoft/UI/staff/feedback/feedback_detail_history.dart'
    as _i56;
import 'package:nedusoft/UI/staff/learn/add_video.dart' as _i48;
import 'package:nedusoft/UI/staff/learn/faculty_videos.dart' as _i45;
import 'package:nedusoft/UI/staff/learn/video_detail.dart' as _i47;
import 'package:nedusoft/UI/staff/lesson_update/add_lesson_update.dart' as _i17;
import 'package:nedusoft/UI/staff/lesson_update/edit_lesson_update.dart'
    as _i64;
import 'package:nedusoft/UI/staff/lesson_update/lesson_detail.dart' as _i61;
import 'package:nedusoft/UI/staff/lesson_update/lesson_update_screen.dart'
    as _i18;
import 'package:nedusoft/UI/staff/lesson_update/pdf_view.dart' as _i32;
import 'package:nedusoft/UI/staff/marks/add_marks.dart' as _i28;
import 'package:nedusoft/UI/staff/marks/edit/edit_marks.dart' as _i29;
import 'package:nedusoft/UI/staff/marks/edit/update_marks.dart' as _i31;
import 'package:nedusoft/UI/staff/marks/marks.dart' as _i25;
import 'package:nedusoft/UI/staff/marks/subject_wise_report/exam_wise_report.dart'
    as _i73;
import 'package:nedusoft/UI/staff/marks/subject_wise_report/student_show_screen.dart'
    as _i72;
import 'package:nedusoft/UI/staff/marks/subject_wise_report/subject_wise_report_screen.dart'
    as _i71;
import 'package:nedusoft/UI/staff/Menu/Menu.dart' as _i10;
import 'package:nedusoft/UI/staff/Menu/Profile.dart' as _i16;
import 'package:nedusoft/UI/staff/notifications/notification.dart' as _i15;
import 'package:nedusoft/UI/staff/notifications/notification_detail.dart'
    as _i23;
import 'package:nedusoft/UI/staff/time_table/time_table_screen.dart' as _i24;
import 'package:nedusoft/UI/time_table/time_table_screen.dart' as _i34;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i101;

class Routes {
  static const splashscreen = '/';

  static const onbording = '/Onbording';

  static const signin = '/Signin';

  static const addSchoolCode = '/add-school-code';

  static const profile = '/Profile';

  static const menu = '/Menu';

  static const attendance = '/Attendance';

  static const notificationpage = '/Notificationpage';

  static const notificationDetail = '/notification-detail';

  static const lessonUpdateScreen = '/lesson-update-screen';

  static const staffMenu = '/staff-menu';

  static const staffAttendance = '/staff-attendance';

  static const staffAttendanceShow = '/staff-attendance-show';

  static const editAttFormScreem = '/edit-att-form-screem';

  static const editAttShowScreen = '/edit-att-show-screen';

  static const staffNotification = '/staff-notification';

  static const staffProfileScreen = '/staff-profile-screen';

  static const staffAddLessonUpdate = '/staff-add-lesson-update';

  static const staffLessonUpdateScreen = '/staff-lesson-update-screen';

  static const staffAddAssignment = '/staff-add-assignment';

  static const staffEditAssignment = '/staff-edit-assignment';

  static const staffSubmitAssDetail = '/staff-submit-ass-detail';

  static const assignmentDetailScreen = '/assignment-detail-screen';

  static const staffNotificationDetail = '/staff-notification-detail';

  static const staffTimeTable = '/staff-time-table';

  static const staffMarks = '/staff-marks';

  static const staffFeedBackDetail = '/staff-feed-back-detail';

  static const staffFeedBack = '/staff-feed-back';

  static const staffAddMarkScreen = '/staff-add-mark-screen';

  static const staffEditMarks = '/staff-edit-marks';

  static const studentMarkDetail = '/student-mark-detail';

  static const staffUpdateMarkScreen = '/staff-update-mark-screen';

  static const pdfViewer = '/pdf-viewer';

  static const submitAssignment = '/submit-assignment';

  static const studentTimeTable = '/student-time-table';

  static const staffMyChapterScreen = '/staff-my-chapter-screen';

  static const staffAddChapter = '/staff-add-chapter';

  static const staffFacultyAllocationScreen =
      '/staff-faculty-allocation-screen';

  static const studentAllocation = '/student-allocation';

  static const staffFacultyDeAllocationScreen =
      '/staff-faculty-de-allocation-screen';

  static const studentDeAllocation = '/student-de-allocation';

  static const studentFeesDetail = '/student-fees-detail';

  static const studentFeedBack = '/student-feed-back';

  static const studentFeedBackDetail = '/student-feed-back-detail';

  static const studentAddFeedback = '/student-add-feedback';

  static const staffVideosScreen = '/staff-videos-screen';

  static const eventDetail = '/event-detail';

  static const videoDetailScreen = '/video-detail-screen';

  static const addVideoScreen = '/add-video-screen';

  static const buildClasses = '/build-classes';

  static const studentBuildClasses = '/student-build-classes';

  static const studentLearn = '/student-learn';

  static const studentLearnChapters = '/student-learn-chapters';

  static const chapterVideo = '/chapter-video';

  static const videoScreen = '/video-screen';

  static const staffAssignmentScreen = '/staff-assignment-screen';

  static const staffEditChapter = '/staff-edit-chapter';

  static const assignmentHistoryScreen = '/assignment-history-screen';

  static const staffAssignmentHistoryScreen =
      '/staff-assignment-history-screen';

  static const staffFeedBackHistoryScreen = '/staff-feed-back-history-screen';

  static const feedbackHistoryScreen = '/feedback-history-screen';

  static const studentFeesReceipts = '/student-fees-receipts';

  static const settingScreen = '/setting-screen';

  static const studentAssignmentScreen = '/student-assignment-screen';

  static const staffLessonDetail = '/staff-lesson-detail';

  static const studentLessonDetail = '/student-lesson-detail';

  static const webviewScreen = '/webview-screen';

  static const staffEditLessonUpdate = '/staff-edit-lesson-update';

  static const studentAttendanceListReportScreen =
      '/student-attendance-list-report-screen';

  static const attendanceYearlyReportScreen =
      '/attendance-yearly-report-screen';

  static const studentAttendanceReportScreen =
      '/student-attendance-report-screen';

  static const studentAttendanceYearlyReportScreen =
      '/student-attendance-yearly-report-screen';

  static const collegeAttendanceYearlyReportScreen =
      '/college-attendance-yearly-report-screen';

  static const studentWiseAttendanceReportScreen =
      '/student-wise-attendance-report-screen';

  static const studentWiseReportScreen = '/student-wise-report-screen';

  static const studentShowListReportScreen = '/student-show-list-report-screen';

  static const studentExamWiseReportScreen = '/student-exam-wise-report-screen';

  static const myAttendanceReportScreen = '/my-attendance-report-screen';

  static const all = <String>{
    splashscreen,
    onbording,
    signin,
    addSchoolCode,
    profile,
    menu,
    attendance,
    notificationpage,
    notificationDetail,
    lessonUpdateScreen,
    staffMenu,
    staffAttendance,
    staffAttendanceShow,
    editAttFormScreem,
    editAttShowScreen,
    staffNotification,
    staffProfileScreen,
    staffAddLessonUpdate,
    staffLessonUpdateScreen,
    staffAddAssignment,
    staffEditAssignment,
    staffSubmitAssDetail,
    assignmentDetailScreen,
    staffNotificationDetail,
    staffTimeTable,
    staffMarks,
    staffFeedBackDetail,
    staffFeedBack,
    staffAddMarkScreen,
    staffEditMarks,
    studentMarkDetail,
    staffUpdateMarkScreen,
    pdfViewer,
    submitAssignment,
    studentTimeTable,
    staffMyChapterScreen,
    staffAddChapter,
    staffFacultyAllocationScreen,
    studentAllocation,
    staffFacultyDeAllocationScreen,
    studentDeAllocation,
    studentFeesDetail,
    studentFeedBack,
    studentFeedBackDetail,
    studentAddFeedback,
    staffVideosScreen,
    eventDetail,
    videoDetailScreen,
    addVideoScreen,
    buildClasses,
    studentBuildClasses,
    studentLearn,
    studentLearnChapters,
    chapterVideo,
    videoScreen,
    staffAssignmentScreen,
    staffEditChapter,
    assignmentHistoryScreen,
    staffAssignmentHistoryScreen,
    staffFeedBackHistoryScreen,
    feedbackHistoryScreen,
    studentFeesReceipts,
    settingScreen,
    studentAssignmentScreen,
    staffLessonDetail,
    studentLessonDetail,
    webviewScreen,
    staffEditLessonUpdate,
    studentAttendanceListReportScreen,
    attendanceYearlyReportScreen,
    studentAttendanceReportScreen,
    studentAttendanceYearlyReportScreen,
    collegeAttendanceYearlyReportScreen,
    studentWiseAttendanceReportScreen,
    studentWiseReportScreen,
    studentShowListReportScreen,
    studentExamWiseReportScreen,
    myAttendanceReportScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashscreen,
      page: _i2.Splashscreen,
    ),
    _i1.RouteDef(
      Routes.onbording,
      page: _i2.Onbording,
    ),
    _i1.RouteDef(
      Routes.signin,
      page: _i3.Signin,
    ),
    _i1.RouteDef(
      Routes.addSchoolCode,
      page: _i4.AddSchoolCode,
    ),
    _i1.RouteDef(
      Routes.profile,
      page: _i5.Profile,
    ),
    _i1.RouteDef(
      Routes.menu,
      page: _i6.Menu,
    ),
    _i1.RouteDef(
      Routes.attendance,
      page: _i7.Attendance,
    ),
    _i1.RouteDef(
      Routes.notificationpage,
      page: _i8.Notificationpage,
    ),
    _i1.RouteDef(
      Routes.notificationDetail,
      page: _i8.NotificationDetail,
    ),
    _i1.RouteDef(
      Routes.lessonUpdateScreen,
      page: _i9.LessonUpdateScreen,
    ),
    _i1.RouteDef(
      Routes.staffMenu,
      page: _i10.StaffMenu,
    ),
    _i1.RouteDef(
      Routes.staffAttendance,
      page: _i11.StaffAttendance,
    ),
    _i1.RouteDef(
      Routes.staffAttendanceShow,
      page: _i12.StaffAttendanceShow,
    ),
    _i1.RouteDef(
      Routes.editAttFormScreem,
      page: _i13.EditAttFormScreem,
    ),
    _i1.RouteDef(
      Routes.editAttShowScreen,
      page: _i14.EditAttShowScreen,
    ),
    _i1.RouteDef(
      Routes.staffNotification,
      page: _i15.StaffNotification,
    ),
    _i1.RouteDef(
      Routes.staffProfileScreen,
      page: _i16.StaffProfileScreen,
    ),
    _i1.RouteDef(
      Routes.staffAddLessonUpdate,
      page: _i17.StaffAddLessonUpdate,
    ),
    _i1.RouteDef(
      Routes.staffLessonUpdateScreen,
      page: _i18.StaffLessonUpdateScreen,
    ),
    _i1.RouteDef(
      Routes.staffAddAssignment,
      page: _i19.StaffAddAssignment,
    ),
    _i1.RouteDef(
      Routes.staffEditAssignment,
      page: _i20.StaffEditAssignment,
    ),
    _i1.RouteDef(
      Routes.staffSubmitAssDetail,
      page: _i21.StaffSubmitAssDetail,
    ),
    _i1.RouteDef(
      Routes.assignmentDetailScreen,
      page: _i22.AssignmentDetailScreen,
    ),
    _i1.RouteDef(
      Routes.staffNotificationDetail,
      page: _i23.StaffNotificationDetail,
    ),
    _i1.RouteDef(
      Routes.staffTimeTable,
      page: _i24.StaffTimeTable,
    ),
    _i1.RouteDef(
      Routes.staffMarks,
      page: _i25.StaffMarks,
    ),
    _i1.RouteDef(
      Routes.staffFeedBackDetail,
      page: _i26.StaffFeedBackDetail,
    ),
    _i1.RouteDef(
      Routes.staffFeedBack,
      page: _i27.StaffFeedBack,
    ),
    _i1.RouteDef(
      Routes.staffAddMarkScreen,
      page: _i28.StaffAddMarkScreen,
    ),
    _i1.RouteDef(
      Routes.staffEditMarks,
      page: _i29.StaffEditMarks,
    ),
    _i1.RouteDef(
      Routes.studentMarkDetail,
      page: _i30.StudentMarkDetail,
    ),
    _i1.RouteDef(
      Routes.staffUpdateMarkScreen,
      page: _i31.StaffUpdateMarkScreen,
    ),
    _i1.RouteDef(
      Routes.pdfViewer,
      page: _i32.PdfViewer,
    ),
    _i1.RouteDef(
      Routes.submitAssignment,
      page: _i33.SubmitAssignment,
    ),
    _i1.RouteDef(
      Routes.studentTimeTable,
      page: _i34.StudentTimeTable,
    ),
    _i1.RouteDef(
      Routes.staffMyChapterScreen,
      page: _i35.StaffMyChapterScreen,
    ),
    _i1.RouteDef(
      Routes.staffAddChapter,
      page: _i36.StaffAddChapter,
    ),
    _i1.RouteDef(
      Routes.staffFacultyAllocationScreen,
      page: _i37.StaffFacultyAllocationScreen,
    ),
    _i1.RouteDef(
      Routes.studentAllocation,
      page: _i38.StudentAllocation,
    ),
    _i1.RouteDef(
      Routes.staffFacultyDeAllocationScreen,
      page: _i39.StaffFacultyDeAllocationScreen,
    ),
    _i1.RouteDef(
      Routes.studentDeAllocation,
      page: _i40.StudentDeAllocation,
    ),
    _i1.RouteDef(
      Routes.studentFeesDetail,
      page: _i41.StudentFeesDetail,
    ),
    _i1.RouteDef(
      Routes.studentFeedBack,
      page: _i42.StudentFeedBack,
    ),
    _i1.RouteDef(
      Routes.studentFeedBackDetail,
      page: _i43.StudentFeedBackDetail,
    ),
    _i1.RouteDef(
      Routes.studentAddFeedback,
      page: _i44.StudentAddFeedback,
    ),
    _i1.RouteDef(
      Routes.staffVideosScreen,
      page: _i45.StaffVideosScreen,
    ),
    _i1.RouteDef(
      Routes.eventDetail,
      page: _i46.EventDetail,
    ),
    _i1.RouteDef(
      Routes.videoDetailScreen,
      page: _i47.VideoDetailScreen,
    ),
    _i1.RouteDef(
      Routes.addVideoScreen,
      page: _i48.AddVideoScreen,
    ),
    _i1.RouteDef(
      Routes.buildClasses,
      page: _i24.BuildClasses,
    ),
    _i1.RouteDef(
      Routes.studentBuildClasses,
      page: _i34.StudentBuildClasses,
    ),
    _i1.RouteDef(
      Routes.studentLearn,
      page: _i49.StudentLearn,
    ),
    _i1.RouteDef(
      Routes.studentLearnChapters,
      page: _i50.StudentLearnChapters,
    ),
    _i1.RouteDef(
      Routes.chapterVideo,
      page: _i51.ChapterVideo,
    ),
    _i1.RouteDef(
      Routes.videoScreen,
      page: _i51.VideoScreen,
    ),
    _i1.RouteDef(
      Routes.staffAssignmentScreen,
      page: _i52.StaffAssignmentScreen,
    ),
    _i1.RouteDef(
      Routes.staffEditChapter,
      page: _i53.StaffEditChapter,
    ),
    _i1.RouteDef(
      Routes.assignmentHistoryScreen,
      page: _i54.AssignmentHistoryScreen,
    ),
    _i1.RouteDef(
      Routes.staffAssignmentHistoryScreen,
      page: _i55.StaffAssignmentHistoryScreen,
    ),
    _i1.RouteDef(
      Routes.staffFeedBackHistoryScreen,
      page: _i56.StaffFeedBackHistoryScreen,
    ),
    _i1.RouteDef(
      Routes.feedbackHistoryScreen,
      page: _i57.FeedbackHistoryScreen,
    ),
    _i1.RouteDef(
      Routes.studentFeesReceipts,
      page: _i58.StudentFeesReceipts,
    ),
    _i1.RouteDef(
      Routes.settingScreen,
      page: _i59.SettingScreen,
    ),
    _i1.RouteDef(
      Routes.studentAssignmentScreen,
      page: _i60.StudentAssignmentScreen,
    ),
    _i1.RouteDef(
      Routes.staffLessonDetail,
      page: _i61.StaffLessonDetail,
    ),
    _i1.RouteDef(
      Routes.studentLessonDetail,
      page: _i62.StudentLessonDetail,
    ),
    _i1.RouteDef(
      Routes.webviewScreen,
      page: _i63.WebviewScreen,
    ),
    _i1.RouteDef(
      Routes.staffEditLessonUpdate,
      page: _i64.StaffEditLessonUpdate,
    ),
    _i1.RouteDef(
      Routes.studentAttendanceListReportScreen,
      page: _i65.StudentAttendanceListReportScreen,
    ),
    _i1.RouteDef(
      Routes.attendanceYearlyReportScreen,
      page: _i66.AttendanceYearlyReportScreen,
    ),
    _i1.RouteDef(
      Routes.studentAttendanceReportScreen,
      page: _i67.StudentAttendanceReportScreen,
    ),
    _i1.RouteDef(
      Routes.studentAttendanceYearlyReportScreen,
      page: _i68.StudentAttendanceYearlyReportScreen,
    ),
    _i1.RouteDef(
      Routes.collegeAttendanceYearlyReportScreen,
      page: _i69.CollegeAttendanceYearlyReportScreen,
    ),
    _i1.RouteDef(
      Routes.studentWiseAttendanceReportScreen,
      page: _i70.StudentWiseAttendanceReportScreen,
    ),
    _i1.RouteDef(
      Routes.studentWiseReportScreen,
      page: _i71.StudentWiseReportScreen,
    ),
    _i1.RouteDef(
      Routes.studentShowListReportScreen,
      page: _i72.StudentShowListReportScreen,
    ),
    _i1.RouteDef(
      Routes.studentExamWiseReportScreen,
      page: _i73.StudentExamWiseReportScreen,
    ),
    _i1.RouteDef(
      Routes.myAttendanceReportScreen,
      page: _i74.MyAttendanceReportScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Splashscreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.Splashscreen(),
        settings: data,
      );
    },
    _i2.Onbording: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.Onbording(),
        settings: data,
      );
    },
    _i3.Signin: (data) {
      final args = data.getArgs<SigninArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i3.Signin(asFor: args.asFor, image: args.image),
        settings: data,
      );
    },
    _i4.AddSchoolCode: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.AddSchoolCode(),
        settings: data,
      );
    },
    _i5.Profile: (data) {
      final args = data.getArgs<ProfileArguments>(
        orElse: () => const ProfileArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i5.Profile(model: args.model, bytesImage: args.bytesImage),
        settings: data,
      );
    },
    _i6.Menu: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i6.Menu(),
        settings: data,
      );
    },
    _i7.Attendance: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i7.Attendance(),
        settings: data,
      );
    },
    _i8.Notificationpage: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i8.Notificationpage(),
        settings: data,
      );
    },
    _i8.NotificationDetail: (data) {
      final args = data.getArgs<NotificationDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i8.NotificationDetail(listElement: args.listElement),
        settings: data,
      );
    },
    _i9.LessonUpdateScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i9.LessonUpdateScreen(),
        settings: data,
      );
    },
    _i10.StaffMenu: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i10.StaffMenu(),
        settings: data,
      );
    },
    _i11.StaffAttendance: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i11.StaffAttendance(),
        settings: data,
      );
    },
    _i12.StaffAttendanceShow: (data) {
      final args = data.getArgs<StaffAttendanceShowArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i12.StaffAttendanceShow(
            dataModel: args.dataModel,
            date: args.date,
            sectionList: args.sectionList,
            session: args.session,
            from: args.from,
            to: args.to,
            subjectList: args.subjectList,
            year: args.year,
            saveStudentAttendanceModel: args.saveStudentAttendanceModel),
        settings: data,
      );
    },
    _i13.EditAttFormScreem: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i13.EditAttFormScreem(),
        settings: data,
      );
    },
    _i14.EditAttShowScreen: (data) {
      final args = data.getArgs<EditAttShowScreenArguments>(
        orElse: () => const EditAttShowScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i14.EditAttShowScreen(
            key: args.key,
            dataModel: args.dataModel,
            sectionList: args.sectionList,
            subjectList: args.subjectList,
            session: args.session,
            year: args.year,
            date: args.date,
            from: args.from,
            to: args.to,
            saveStudentAttendanceModel: args.saveStudentAttendanceModel),
        settings: data,
      );
    },
    _i15.StaffNotification: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i15.StaffNotification(),
        settings: data,
      );
    },
    _i16.StaffProfileScreen: (data) {
      final args = data.getArgs<StaffProfileScreenArguments>(
        orElse: () => const StaffProfileScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i16.StaffProfileScreen(
            key: args.key, model: args.model, bytesImage: args.bytesImage),
        settings: data,
      );
    },
    _i17.StaffAddLessonUpdate: (data) {
      final args = data.getArgs<StaffAddLessonUpdateArguments>(
        orElse: () => const StaffAddLessonUpdateArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i17.StaffAddLessonUpdate(
            edit: args.edit,
            lessonUpdateOnPageLoadModel: args.lessonUpdateOnPageLoadModel),
        settings: data,
      );
    },
    _i18.StaffLessonUpdateScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i18.StaffLessonUpdateScreen(),
        settings: data,
      );
    },
    _i19.StaffAddAssignment: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i19.StaffAddAssignment(),
        settings: data,
      );
    },
    _i20.StaffEditAssignment: (data) {
      final args = data.getArgs<StaffEditAssignmentArguments>(
        orElse: () => const StaffEditAssignmentArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i20.StaffEditAssignment(key: args.key, assignId: args.assignId),
        settings: data,
      );
    },
    _i21.StaffSubmitAssDetail: (data) {
      final args = data.getArgs<StaffSubmitAssDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i21.StaffSubmitAssDetail(assignId: args.assignId, key: args.key),
        settings: data,
      );
    },
    _i22.AssignmentDetailScreen: (data) {
      final args = data.getArgs<AssignmentDetailScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i22.AssignmentDetailScreen(
            assignId: args.assignId, complete: args.complete, key: args.key),
        settings: data,
      );
    },
    _i23.StaffNotificationDetail: (data) {
      final args =
          data.getArgs<StaffNotificationDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i23.StaffNotificationDetail(nId: args.nId),
        settings: data,
      );
    },
    _i24.StaffTimeTable: (data) {
      final args = data.getArgs<StaffTimeTableArguments>(
        orElse: () => const StaffTimeTableArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i24.StaffTimeTable(key: args.key),
        settings: data,
      );
    },
    _i25.StaffMarks: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i25.StaffMarks(),
        settings: data,
      );
    },
    _i26.StaffFeedBackDetail: (data) {
      final args = data.getArgs<StaffFeedBackDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i26.StaffFeedBackDetail(key: args.key, nId: args.nId),
        settings: data,
      );
    },
    _i27.StaffFeedBack: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i27.StaffFeedBack(),
        settings: data,
      );
    },
    _i28.StaffAddMarkScreen: (data) {
      final args = data.getArgs<StaffAddMarkScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i28.StaffAddMarkScreen(
            addMarksModel: args.addMarksModel,
            dataModel: args.dataModel,
            section: args.section,
            subject: args.subject,
            exam: args.exam,
            assesment: args.assesment,
            classId: args.classId,
            yearId: args.yearId),
        settings: data,
      );
    },
    _i29.StaffEditMarks: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i29.StaffEditMarks(),
        settings: data,
      );
    },
    _i30.StudentMarkDetail: (data) {
      final args = data.getArgs<StudentMarkDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i30.StudentMarkDetail(
            key: args.key,
            getStudentMarksList: args.getStudentMarksList,
            examName: args.examName),
        settings: data,
      );
    },
    _i31.StaffUpdateMarkScreen: (data) {
      final args = data.getArgs<StaffUpdateMarkScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i31.StaffUpdateMarkScreen(
            addMarksModel: args.addMarksModel,
            dataModel: args.dataModel,
            section: args.section,
            subject: args.subject,
            exam: args.exam,
            assesment: args.assesment,
            classId: args.classId),
        settings: data,
      );
    },
    _i32.PdfViewer: (data) {
      final args = data.getArgs<PdfViewerArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i32.PdfViewer(
            key: args.key,
            file: args.file,
            url: args.url,
            fileName: args.fileName),
        settings: data,
      );
    },
    _i33.SubmitAssignment: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i33.SubmitAssignment(),
        settings: data,
      );
    },
    _i34.StudentTimeTable: (data) {
      final args = data.getArgs<StudentTimeTableArguments>(
        orElse: () => const StudentTimeTableArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i34.StudentTimeTable(key: args.key),
        settings: data,
      );
    },
    _i35.StaffMyChapterScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i35.StaffMyChapterScreen(),
        settings: data,
      );
    },
    _i36.StaffAddChapter: (data) {
      final args = data.getArgs<StaffAddChapterArguments>(
        orElse: () => const StaffAddChapterArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i36.StaffAddChapter(edit: args.edit, chapter: args.chapter),
        settings: data,
      );
    },
    _i37.StaffFacultyAllocationScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i37.StaffFacultyAllocationScreen(),
        settings: data,
      );
    },
    _i38.StudentAllocation: (data) {
      final args = data.getArgs<StudentAllocationArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i38.StudentAllocation(
            studentList: args.studentList,
            sectionList: args.sectionList,
            subjectList: args.subjectList,
            year: args.year,
            classes: args.classes),
        settings: data,
      );
    },
    _i39.StaffFacultyDeAllocationScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i39.StaffFacultyDeAllocationScreen(),
        settings: data,
      );
    },
    _i40.StudentDeAllocation: (data) {
      final args = data.getArgs<StudentDeAllocationArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i40.StudentDeAllocation(
            studentList: args.studentList,
            sectionList: args.sectionList,
            subjectList: args.subjectList,
            year: args.year,
            classes: args.classes),
        settings: data,
      );
    },
    _i41.StudentFeesDetail: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i41.StudentFeesDetail(),
        settings: data,
      );
    },
    _i42.StudentFeedBack: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i42.StudentFeedBack(),
        settings: data,
      );
    },
    _i43.StudentFeedBackDetail: (data) {
      final args = data.getArgs<StudentFeedBackDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i43.StudentFeedBackDetail(key: args.key, nId: args.nId),
        settings: data,
      );
    },
    _i44.StudentAddFeedback: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i44.StudentAddFeedback(),
        settings: data,
      );
    },
    _i45.StaffVideosScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i45.StaffVideosScreen(),
        settings: data,
      );
    },
    _i46.EventDetail: (data) {
      final args = data.getArgs<EventDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i46.EventDetail(listElement: args.listElement),
        settings: data,
      );
    },
    _i47.VideoDetailScreen: (data) {
      final args = data.getArgs<VideoDetailScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i47.VideoDetailScreen(model: args.model, key: args.key),
        settings: data,
      );
    },
    _i48.AddVideoScreen: (data) {
      final args = data.getArgs<AddVideoScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i48.AddVideoScreen(edit: args.edit, videoDetail: args.videoDetail),
        settings: data,
      );
    },
    _i24.BuildClasses: (data) {
      final args = data.getArgs<BuildClassesArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i24.BuildClasses(
            heading: args.heading,
            schedulesList: args.schedulesList,
            today: args.today),
        settings: data,
      );
    },
    _i34.StudentBuildClasses: (data) {
      final args = data.getArgs<StudentBuildClassesArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i34.StudentBuildClasses(
            heading: args.heading,
            schedulesList: args.schedulesList,
            today: args.today),
        settings: data,
      );
    },
    _i49.StudentLearn: (data) {
      final args = data.getArgs<StudentLearnArguments>(
        orElse: () => const StudentLearnArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i49.StudentLearn(key: args.key),
        settings: data,
      );
    },
    _i50.StudentLearnChapters: (data) {
      final args = data.getArgs<StudentLearnChaptersArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i50.StudentLearnChapters(model: args.model),
        settings: data,
      );
    },
    _i51.ChapterVideo: (data) {
      final args = data.getArgs<ChapterVideoArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i51.ChapterVideo(chapterId: args.chapterId),
        settings: data,
      );
    },
    _i51.VideoScreen: (data) {
      final args = data.getArgs<VideoScreenArguments>(
        orElse: () => const VideoScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i51.VideoScreen(id: args.id),
        settings: data,
      );
    },
    _i52.StaffAssignmentScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i52.StaffAssignmentScreen(),
        settings: data,
      );
    },
    _i53.StaffEditChapter: (data) {
      final args = data.getArgs<StaffEditChapterArguments>(
        orElse: () => const StaffEditChapterArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i53.StaffEditChapter(chapterId: args.chapterId),
        settings: data,
      );
    },
    _i54.AssignmentHistoryScreen: (data) {
      final args =
          data.getArgs<AssignmentHistoryScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i54.AssignmentHistoryScreen(
            assignId: args.assignId,
            subject: args.subject,
            dataList: args.dataList,
            key: args.key),
        settings: data,
      );
    },
    _i55.StaffAssignmentHistoryScreen: (data) {
      final args =
          data.getArgs<StaffAssignmentHistoryScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i55.StaffAssignmentHistoryScreen(
            assignId: args.assignId,
            subject: args.subject,
            dataList: args.dataList,
            key: args.key),
        settings: data,
      );
    },
    _i56.StaffFeedBackHistoryScreen: (data) {
      final args =
          data.getArgs<StaffFeedBackHistoryScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i56.StaffFeedBackHistoryScreen(
            assignId: args.assignId,
            subject: args.subject,
            dataList: args.dataList,
            key: args.key),
        settings: data,
      );
    },
    _i57.FeedbackHistoryScreen: (data) {
      final args = data.getArgs<FeedbackHistoryScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i57.FeedbackHistoryScreen(
            assignId: args.assignId,
            subject: args.subject,
            dataList: args.dataList,
            key: args.key),
        settings: data,
      );
    },
    _i58.StudentFeesReceipts: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i58.StudentFeesReceipts(),
        settings: data,
      );
    },
    _i59.SettingScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i59.SettingScreen(),
        settings: data,
      );
    },
    _i60.StudentAssignmentScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i60.StudentAssignmentScreen(),
        settings: data,
      );
    },
    _i61.StaffLessonDetail: (data) {
      final args = data.getArgs<StaffLessonDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i61.StaffLessonDetail(model: args.model, key: args.key),
        settings: data,
      );
    },
    _i62.StudentLessonDetail: (data) {
      final args = data.getArgs<StudentLessonDetailArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i62.StudentLessonDetail(model: args.model, key: args.key),
        settings: data,
      );
    },
    _i63.WebviewScreen: (data) {
      final args = data.getArgs<WebviewScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i63.WebviewScreen(url: args.url),
        settings: data,
      );
    },
    _i64.StaffEditLessonUpdate: (data) {
      final args = data.getArgs<StaffEditLessonUpdateArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i64.StaffEditLessonUpdate(id: args.id),
        settings: data,
      );
    },
    _i65.StudentAttendanceListReportScreen: (data) {
      final args = data.getArgs<StudentAttendanceListReportScreenArguments>(
          nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i65.StudentAttendanceListReportScreen(
            classId: args.classId,
            subjectId: args.subjectId,
            yearId: args.yearId,
            name: args.name,
            totalClasses: args.totalClasses),
        settings: data,
      );
    },
    _i66.AttendanceYearlyReportScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i66.AttendanceYearlyReportScreen(),
        settings: data,
      );
    },
    _i67.StudentAttendanceReportScreen: (data) {
      final args = data.getArgs<StudentAttendanceReportScreenArguments>(
        orElse: () => const StudentAttendanceReportScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i67.StudentAttendanceReportScreen(key: args.key),
        settings: data,
      );
    },
    _i68.StudentAttendanceYearlyReportScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i68.StudentAttendanceYearlyReportScreen(),
        settings: data,
      );
    },
    _i69.CollegeAttendanceYearlyReportScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i69.CollegeAttendanceYearlyReportScreen(),
        settings: data,
      );
    },
    _i70.StudentWiseAttendanceReportScreen: (data) {
      final args = data.getArgs<StudentWiseAttendanceReportScreenArguments>(
          nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i70.StudentWiseAttendanceReportScreen(
            studentId: args.studentId,
            classId: args.classId,
            subjectId: args.subjectId,
            yearId: args.yearId),
        settings: data,
      );
    },
    _i71.StudentWiseReportScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i71.StudentWiseReportScreen(),
        settings: data,
      );
    },
    _i72.StudentShowListReportScreen: (data) {
      final args =
          data.getArgs<StudentShowListReportScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i72.StudentShowListReportScreen(
            classId: args.classId,
            subjectId: args.subjectId,
            yearId: args.yearId,
            name: args.name,
            sectionId: args.sectionId),
        settings: data,
      );
    },
    _i73.StudentExamWiseReportScreen: (data) {
      final args =
          data.getArgs<StudentExamWiseReportScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i73.StudentExamWiseReportScreen(
            classId: args.classId,
            studentId: args.studentId,
            subjectId: args.subjectId,
            yearId: args.yearId,
            name: args.name,
            sectionId: args.sectionId),
        settings: data,
      );
    },
    _i74.MyAttendanceReportScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i74.MyAttendanceReportScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SigninArguments {
  const SigninArguments({
    required this.asFor,
    required this.image,
  });

  final String asFor;

  final String? image;

  @override
  String toString() {
    return '{"asFor": "$asFor", "image": "$image"}';
  }

  @override
  bool operator ==(covariant SigninArguments other) {
    if (identical(this, other)) return true;
    return other.asFor == asFor && other.image == image;
  }

  @override
  int get hashCode {
    return asFor.hashCode ^ image.hashCode;
  }
}

class ProfileArguments {
  const ProfileArguments({
    this.model,
    this.bytesImage,
  });

  final _i75.UserPerInfoModel? model;

  final _i76.Uint8List? bytesImage;

  @override
  String toString() {
    return '{"model": "$model", "bytesImage": "$bytesImage"}';
  }

  @override
  bool operator ==(covariant ProfileArguments other) {
    if (identical(this, other)) return true;
    return other.model == model && other.bytesImage == bytesImage;
  }

  @override
  int get hashCode {
    return model.hashCode ^ bytesImage.hashCode;
  }
}

class NotificationDetailArguments {
  const NotificationDetailArguments({required this.listElement});

  final _i77.ListElement? listElement;

  @override
  String toString() {
    return '{"listElement": "$listElement"}';
  }

  @override
  bool operator ==(covariant NotificationDetailArguments other) {
    if (identical(this, other)) return true;
    return other.listElement == listElement;
  }

  @override
  int get hashCode {
    return listElement.hashCode;
  }
}

class StaffAttendanceShowArguments {
  const StaffAttendanceShowArguments({
    required this.dataModel,
    required this.date,
    required this.sectionList,
    this.session,
    this.from,
    this.to,
    required this.subjectList,
    required this.year,
    required this.saveStudentAttendanceModel,
  });

  final _i78.GetAllStudentAtteListModel? dataModel;

  final String? date;

  final _i79.SectionList? sectionList;

  final _i80.Cl? session;

  final _i81.TimeOfDay? from;

  final _i81.TimeOfDay? to;

  final _i82.SubjectList? subjectList;

  final _i80.Year? year;

  final List<_i83.SaveStudentAttendanceModel>? saveStudentAttendanceModel;

  @override
  String toString() {
    return '{"dataModel": "$dataModel", "date": "$date", "sectionList": "$sectionList", "session": "$session", "from": "$from", "to": "$to", "subjectList": "$subjectList", "year": "$year", "saveStudentAttendanceModel": "$saveStudentAttendanceModel"}';
  }

  @override
  bool operator ==(covariant StaffAttendanceShowArguments other) {
    if (identical(this, other)) return true;
    return other.dataModel == dataModel &&
        other.date == date &&
        other.sectionList == sectionList &&
        other.session == session &&
        other.from == from &&
        other.to == to &&
        other.subjectList == subjectList &&
        other.year == year &&
        other.saveStudentAttendanceModel == saveStudentAttendanceModel;
  }

  @override
  int get hashCode {
    return dataModel.hashCode ^
        date.hashCode ^
        sectionList.hashCode ^
        session.hashCode ^
        from.hashCode ^
        to.hashCode ^
        subjectList.hashCode ^
        year.hashCode ^
        saveStudentAttendanceModel.hashCode;
  }
}

class EditAttShowScreenArguments {
  const EditAttShowScreenArguments({
    this.key,
    this.dataModel,
    this.sectionList,
    this.subjectList,
    this.session,
    this.year,
    this.date,
    this.from,
    this.to,
    this.saveStudentAttendanceModel,
  });

  final _i81.Key? key;

  final _i78.GetAllStudentAtteListModel? dataModel;

  final _i79.SectionList? sectionList;

  final _i82.SubjectList? subjectList;

  final _i80.Cl? session;

  final _i80.Year? year;

  final String? date;

  final _i81.TimeOfDay? from;

  final _i81.TimeOfDay? to;

  final List<_i83.SaveAttendanceModel>? saveStudentAttendanceModel;

  @override
  String toString() {
    return '{"key": "$key", "dataModel": "$dataModel", "sectionList": "$sectionList", "subjectList": "$subjectList", "session": "$session", "year": "$year", "date": "$date", "from": "$from", "to": "$to", "saveStudentAttendanceModel": "$saveStudentAttendanceModel"}';
  }

  @override
  bool operator ==(covariant EditAttShowScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.dataModel == dataModel &&
        other.sectionList == sectionList &&
        other.subjectList == subjectList &&
        other.session == session &&
        other.year == year &&
        other.date == date &&
        other.from == from &&
        other.to == to &&
        other.saveStudentAttendanceModel == saveStudentAttendanceModel;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        dataModel.hashCode ^
        sectionList.hashCode ^
        subjectList.hashCode ^
        session.hashCode ^
        year.hashCode ^
        date.hashCode ^
        from.hashCode ^
        to.hashCode ^
        saveStudentAttendanceModel.hashCode;
  }
}

class StaffProfileScreenArguments {
  const StaffProfileScreenArguments({
    this.key,
    this.model,
    this.bytesImage,
  });

  final _i81.Key? key;

  final _i84.StaffPersonalInfoModel? model;

  final _i76.Uint8List? bytesImage;

  @override
  String toString() {
    return '{"key": "$key", "model": "$model", "bytesImage": "$bytesImage"}';
  }

  @override
  bool operator ==(covariant StaffProfileScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.model == model &&
        other.bytesImage == bytesImage;
  }

  @override
  int get hashCode {
    return key.hashCode ^ model.hashCode ^ bytesImage.hashCode;
  }
}

class StaffAddLessonUpdateArguments {
  const StaffAddLessonUpdateArguments({
    this.edit = false,
    this.lessonUpdateOnPageLoadModel,
  });

  final bool edit;

  final _i85.LessonUpdateOnPageLoadModel? lessonUpdateOnPageLoadModel;

  @override
  String toString() {
    return '{"edit": "$edit", "lessonUpdateOnPageLoadModel": "$lessonUpdateOnPageLoadModel"}';
  }

  @override
  bool operator ==(covariant StaffAddLessonUpdateArguments other) {
    if (identical(this, other)) return true;
    return other.edit == edit &&
        other.lessonUpdateOnPageLoadModel == lessonUpdateOnPageLoadModel;
  }

  @override
  int get hashCode {
    return edit.hashCode ^ lessonUpdateOnPageLoadModel.hashCode;
  }
}

class StaffEditAssignmentArguments {
  const StaffEditAssignmentArguments({
    this.key,
    this.assignId,
  });

  final _i81.Key? key;

  final String? assignId;

  @override
  String toString() {
    return '{"key": "$key", "assignId": "$assignId"}';
  }

  @override
  bool operator ==(covariant StaffEditAssignmentArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.assignId == assignId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ assignId.hashCode;
  }
}

class StaffSubmitAssDetailArguments {
  const StaffSubmitAssDetailArguments({
    required this.assignId,
    this.key,
  });

  final String assignId;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"assignId": "$assignId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StaffSubmitAssDetailArguments other) {
    if (identical(this, other)) return true;
    return other.assignId == assignId && other.key == key;
  }

  @override
  int get hashCode {
    return assignId.hashCode ^ key.hashCode;
  }
}

class AssignmentDetailScreenArguments {
  const AssignmentDetailScreenArguments({
    required this.assignId,
    required this.complete,
    this.key,
  });

  final String assignId;

  final bool complete;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"assignId": "$assignId", "complete": "$complete", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AssignmentDetailScreenArguments other) {
    if (identical(this, other)) return true;
    return other.assignId == assignId &&
        other.complete == complete &&
        other.key == key;
  }

  @override
  int get hashCode {
    return assignId.hashCode ^ complete.hashCode ^ key.hashCode;
  }
}

class StaffNotificationDetailArguments {
  const StaffNotificationDetailArguments({required this.nId});

  final String nId;

  @override
  String toString() {
    return '{"nId": "$nId"}';
  }

  @override
  bool operator ==(covariant StaffNotificationDetailArguments other) {
    if (identical(this, other)) return true;
    return other.nId == nId;
  }

  @override
  int get hashCode {
    return nId.hashCode;
  }
}

class StaffTimeTableArguments {
  const StaffTimeTableArguments({this.key});

  final _i81.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant StaffTimeTableArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class StaffFeedBackDetailArguments {
  const StaffFeedBackDetailArguments({
    this.key,
    required this.nId,
  });

  final _i81.Key? key;

  final String nId;

  @override
  String toString() {
    return '{"key": "$key", "nId": "$nId"}';
  }

  @override
  bool operator ==(covariant StaffFeedBackDetailArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.nId == nId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ nId.hashCode;
  }
}

class StaffAddMarkScreenArguments {
  const StaffAddMarkScreenArguments({
    required this.addMarksModel,
    required this.dataModel,
    required this.section,
    required this.subject,
    required this.exam,
    required this.assesment,
    required this.classId,
    required this.yearId,
  });

  final List<_i86.AddMarksModel>? addMarksModel;

  final _i86.AllStudentMarksList? dataModel;

  final int? section;

  final int? subject;

  final int? exam;

  final int? assesment;

  final int? classId;

  final int? yearId;

  @override
  String toString() {
    return '{"addMarksModel": "$addMarksModel", "dataModel": "$dataModel", "section": "$section", "subject": "$subject", "exam": "$exam", "assesment": "$assesment", "classId": "$classId", "yearId": "$yearId"}';
  }

  @override
  bool operator ==(covariant StaffAddMarkScreenArguments other) {
    if (identical(this, other)) return true;
    return other.addMarksModel == addMarksModel &&
        other.dataModel == dataModel &&
        other.section == section &&
        other.subject == subject &&
        other.exam == exam &&
        other.assesment == assesment &&
        other.classId == classId &&
        other.yearId == yearId;
  }

  @override
  int get hashCode {
    return addMarksModel.hashCode ^
        dataModel.hashCode ^
        section.hashCode ^
        subject.hashCode ^
        exam.hashCode ^
        assesment.hashCode ^
        classId.hashCode ^
        yearId.hashCode;
  }
}

class StudentMarkDetailArguments {
  const StudentMarkDetailArguments({
    this.key,
    required this.getStudentMarksList,
    required this.examName,
  });

  final _i81.Key? key;

  final _i87.GetStudentMarksList getStudentMarksList;

  final String examName;

  @override
  String toString() {
    return '{"key": "$key", "getStudentMarksList": "$getStudentMarksList", "examName": "$examName"}';
  }

  @override
  bool operator ==(covariant StudentMarkDetailArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.getStudentMarksList == getStudentMarksList &&
        other.examName == examName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ getStudentMarksList.hashCode ^ examName.hashCode;
  }
}

class StaffUpdateMarkScreenArguments {
  const StaffUpdateMarkScreenArguments({
    required this.addMarksModel,
    required this.dataModel,
    required this.section,
    required this.subject,
    required this.exam,
    required this.assesment,
    required this.classId,
  });

  final List<_i86.AddMarksModel>? addMarksModel;

  final _i86.AllUpdateStudentMarksList? dataModel;

  final int? section;

  final int? subject;

  final int? exam;

  final int? assesment;

  final int? classId;

  @override
  String toString() {
    return '{"addMarksModel": "$addMarksModel", "dataModel": "$dataModel", "section": "$section", "subject": "$subject", "exam": "$exam", "assesment": "$assesment", "classId": "$classId"}';
  }

  @override
  bool operator ==(covariant StaffUpdateMarkScreenArguments other) {
    if (identical(this, other)) return true;
    return other.addMarksModel == addMarksModel &&
        other.dataModel == dataModel &&
        other.section == section &&
        other.subject == subject &&
        other.exam == exam &&
        other.assesment == assesment &&
        other.classId == classId;
  }

  @override
  int get hashCode {
    return addMarksModel.hashCode ^
        dataModel.hashCode ^
        section.hashCode ^
        subject.hashCode ^
        exam.hashCode ^
        assesment.hashCode ^
        classId.hashCode;
  }
}

class PdfViewerArguments {
  const PdfViewerArguments({
    this.key,
    required this.file,
    required this.url,
    required this.fileName,
  });

  final _i81.Key? key;

  final _i88.File file;

  final String url;

  final String fileName;

  @override
  String toString() {
    return '{"key": "$key", "file": "$file", "url": "$url", "fileName": "$fileName"}';
  }

  @override
  bool operator ==(covariant PdfViewerArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.file == file &&
        other.url == url &&
        other.fileName == fileName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ file.hashCode ^ url.hashCode ^ fileName.hashCode;
  }
}

class StudentTimeTableArguments {
  const StudentTimeTableArguments({this.key});

  final _i81.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentTimeTableArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class StaffAddChapterArguments {
  const StaffAddChapterArguments({
    this.edit = false,
    this.chapter,
  });

  final bool edit;

  final _i89.Chapter? chapter;

  @override
  String toString() {
    return '{"edit": "$edit", "chapter": "$chapter"}';
  }

  @override
  bool operator ==(covariant StaffAddChapterArguments other) {
    if (identical(this, other)) return true;
    return other.edit == edit && other.chapter == chapter;
  }

  @override
  int get hashCode {
    return edit.hashCode ^ chapter.hashCode;
  }
}

class StudentAllocationArguments {
  const StudentAllocationArguments({
    required this.studentList,
    required this.sectionList,
    required this.subjectList,
    required this.year,
    required this.classes,
  });

  final List<_i90.FacultyAllocationStudentList>? studentList;

  final _i79.SectionList? sectionList;

  final _i82.SubjectList? subjectList;

  final _i80.Year? year;

  final _i80.Cl? classes;

  @override
  String toString() {
    return '{"studentList": "$studentList", "sectionList": "$sectionList", "subjectList": "$subjectList", "year": "$year", "classes": "$classes"}';
  }

  @override
  bool operator ==(covariant StudentAllocationArguments other) {
    if (identical(this, other)) return true;
    return other.studentList == studentList &&
        other.sectionList == sectionList &&
        other.subjectList == subjectList &&
        other.year == year &&
        other.classes == classes;
  }

  @override
  int get hashCode {
    return studentList.hashCode ^
        sectionList.hashCode ^
        subjectList.hashCode ^
        year.hashCode ^
        classes.hashCode;
  }
}

class StudentDeAllocationArguments {
  const StudentDeAllocationArguments({
    required this.studentList,
    required this.sectionList,
    required this.subjectList,
    required this.year,
    required this.classes,
  });

  final List<_i90.FacultyDeAllocationStudentList>? studentList;

  final _i79.SectionList? sectionList;

  final _i82.SubjectList? subjectList;

  final _i80.Year? year;

  final _i80.Cl? classes;

  @override
  String toString() {
    return '{"studentList": "$studentList", "sectionList": "$sectionList", "subjectList": "$subjectList", "year": "$year", "classes": "$classes"}';
  }

  @override
  bool operator ==(covariant StudentDeAllocationArguments other) {
    if (identical(this, other)) return true;
    return other.studentList == studentList &&
        other.sectionList == sectionList &&
        other.subjectList == subjectList &&
        other.year == year &&
        other.classes == classes;
  }

  @override
  int get hashCode {
    return studentList.hashCode ^
        sectionList.hashCode ^
        subjectList.hashCode ^
        year.hashCode ^
        classes.hashCode;
  }
}

class StudentFeedBackDetailArguments {
  const StudentFeedBackDetailArguments({
    this.key,
    required this.nId,
  });

  final _i81.Key? key;

  final String nId;

  @override
  String toString() {
    return '{"key": "$key", "nId": "$nId"}';
  }

  @override
  bool operator ==(covariant StudentFeedBackDetailArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.nId == nId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ nId.hashCode;
  }
}

class EventDetailArguments {
  const EventDetailArguments({required this.listElement});

  final _i91.ListElement? listElement;

  @override
  String toString() {
    return '{"listElement": "$listElement"}';
  }

  @override
  bool operator ==(covariant EventDetailArguments other) {
    if (identical(this, other)) return true;
    return other.listElement == listElement;
  }

  @override
  int get hashCode {
    return listElement.hashCode;
  }
}

class VideoDetailScreenArguments {
  const VideoDetailScreenArguments({
    required this.model,
    this.key,
  });

  final _i92.ListElement model;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"model": "$model", "key": "$key"}';
  }

  @override
  bool operator ==(covariant VideoDetailScreenArguments other) {
    if (identical(this, other)) return true;
    return other.model == model && other.key == key;
  }

  @override
  int get hashCode {
    return model.hashCode ^ key.hashCode;
  }
}

class AddVideoScreenArguments {
  const AddVideoScreenArguments({
    this.edit = false,
    required this.videoDetail,
  });

  final bool edit;

  final _i93.GetVideoDetailModel? videoDetail;

  @override
  String toString() {
    return '{"edit": "$edit", "videoDetail": "$videoDetail"}';
  }

  @override
  bool operator ==(covariant AddVideoScreenArguments other) {
    if (identical(this, other)) return true;
    return other.edit == edit && other.videoDetail == videoDetail;
  }

  @override
  int get hashCode {
    return edit.hashCode ^ videoDetail.hashCode;
  }
}

class BuildClassesArguments {
  const BuildClassesArguments({
    required this.heading,
    required this.schedulesList,
    required this.today,
  });

  final String heading;

  final List<_i94.Schedule> schedulesList;

  final bool today;

  @override
  String toString() {
    return '{"heading": "$heading", "schedulesList": "$schedulesList", "today": "$today"}';
  }

  @override
  bool operator ==(covariant BuildClassesArguments other) {
    if (identical(this, other)) return true;
    return other.heading == heading &&
        other.schedulesList == schedulesList &&
        other.today == today;
  }

  @override
  int get hashCode {
    return heading.hashCode ^ schedulesList.hashCode ^ today.hashCode;
  }
}

class StudentBuildClassesArguments {
  const StudentBuildClassesArguments({
    required this.heading,
    required this.schedulesList,
    required this.today,
  });

  final String heading;

  final List<_i94.Schedule> schedulesList;

  final bool today;

  @override
  String toString() {
    return '{"heading": "$heading", "schedulesList": "$schedulesList", "today": "$today"}';
  }

  @override
  bool operator ==(covariant StudentBuildClassesArguments other) {
    if (identical(this, other)) return true;
    return other.heading == heading &&
        other.schedulesList == schedulesList &&
        other.today == today;
  }

  @override
  int get hashCode {
    return heading.hashCode ^ schedulesList.hashCode ^ today.hashCode;
  }
}

class StudentLearnArguments {
  const StudentLearnArguments({this.key});

  final _i81.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentLearnArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class StudentLearnChaptersArguments {
  const StudentLearnChaptersArguments({required this.model});

  final _i95.StudentLearnChapterModel? model;

  @override
  String toString() {
    return '{"model": "$model"}';
  }

  @override
  bool operator ==(covariant StudentLearnChaptersArguments other) {
    if (identical(this, other)) return true;
    return other.model == model;
  }

  @override
  int get hashCode {
    return model.hashCode;
  }
}

class ChapterVideoArguments {
  const ChapterVideoArguments({required this.chapterId});

  final String chapterId;

  @override
  String toString() {
    return '{"chapterId": "$chapterId"}';
  }

  @override
  bool operator ==(covariant ChapterVideoArguments other) {
    if (identical(this, other)) return true;
    return other.chapterId == chapterId;
  }

  @override
  int get hashCode {
    return chapterId.hashCode;
  }
}

class VideoScreenArguments {
  const VideoScreenArguments({this.id});

  final String? id;

  @override
  String toString() {
    return '{"id": "$id"}';
  }

  @override
  bool operator ==(covariant VideoScreenArguments other) {
    if (identical(this, other)) return true;
    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

class StaffEditChapterArguments {
  const StaffEditChapterArguments({this.chapterId});

  final String? chapterId;

  @override
  String toString() {
    return '{"chapterId": "$chapterId"}';
  }

  @override
  bool operator ==(covariant StaffEditChapterArguments other) {
    if (identical(this, other)) return true;
    return other.chapterId == chapterId;
  }

  @override
  int get hashCode {
    return chapterId.hashCode;
  }
}

class AssignmentHistoryScreenArguments {
  const AssignmentHistoryScreenArguments({
    required this.assignId,
    required this.subject,
    required this.dataList,
    this.key,
  });

  final String assignId;

  final String subject;

  final List<_i96.Data> dataList;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"assignId": "$assignId", "subject": "$subject", "dataList": "$dataList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AssignmentHistoryScreenArguments other) {
    if (identical(this, other)) return true;
    return other.assignId == assignId &&
        other.subject == subject &&
        other.dataList == dataList &&
        other.key == key;
  }

  @override
  int get hashCode {
    return assignId.hashCode ^
        subject.hashCode ^
        dataList.hashCode ^
        key.hashCode;
  }
}

class StaffAssignmentHistoryScreenArguments {
  const StaffAssignmentHistoryScreenArguments({
    required this.assignId,
    required this.subject,
    required this.dataList,
    this.key,
  });

  final String assignId;

  final String subject;

  final List<_i97.Data> dataList;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"assignId": "$assignId", "subject": "$subject", "dataList": "$dataList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StaffAssignmentHistoryScreenArguments other) {
    if (identical(this, other)) return true;
    return other.assignId == assignId &&
        other.subject == subject &&
        other.dataList == dataList &&
        other.key == key;
  }

  @override
  int get hashCode {
    return assignId.hashCode ^
        subject.hashCode ^
        dataList.hashCode ^
        key.hashCode;
  }
}

class StaffFeedBackHistoryScreenArguments {
  const StaffFeedBackHistoryScreenArguments({
    required this.assignId,
    required this.subject,
    required this.dataList,
    this.key,
  });

  final String assignId;

  final String subject;

  final List<_i98.Data> dataList;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"assignId": "$assignId", "subject": "$subject", "dataList": "$dataList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StaffFeedBackHistoryScreenArguments other) {
    if (identical(this, other)) return true;
    return other.assignId == assignId &&
        other.subject == subject &&
        other.dataList == dataList &&
        other.key == key;
  }

  @override
  int get hashCode {
    return assignId.hashCode ^
        subject.hashCode ^
        dataList.hashCode ^
        key.hashCode;
  }
}

class FeedbackHistoryScreenArguments {
  const FeedbackHistoryScreenArguments({
    required this.assignId,
    required this.subject,
    required this.dataList,
    this.key,
  });

  final String assignId;

  final String subject;

  final List<_i99.Data> dataList;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"assignId": "$assignId", "subject": "$subject", "dataList": "$dataList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant FeedbackHistoryScreenArguments other) {
    if (identical(this, other)) return true;
    return other.assignId == assignId &&
        other.subject == subject &&
        other.dataList == dataList &&
        other.key == key;
  }

  @override
  int get hashCode {
    return assignId.hashCode ^
        subject.hashCode ^
        dataList.hashCode ^
        key.hashCode;
  }
}

class StaffLessonDetailArguments {
  const StaffLessonDetailArguments({
    required this.model,
    this.key,
  });

  final _i85.LessonUpdateOnPageLoadModel model;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"model": "$model", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StaffLessonDetailArguments other) {
    if (identical(this, other)) return true;
    return other.model == model && other.key == key;
  }

  @override
  int get hashCode {
    return model.hashCode ^ key.hashCode;
  }
}

class StudentLessonDetailArguments {
  const StudentLessonDetailArguments({
    required this.model,
    this.key,
  });

  final _i100.LessonList model;

  final _i81.Key? key;

  @override
  String toString() {
    return '{"model": "$model", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentLessonDetailArguments other) {
    if (identical(this, other)) return true;
    return other.model == model && other.key == key;
  }

  @override
  int get hashCode {
    return model.hashCode ^ key.hashCode;
  }
}

class WebviewScreenArguments {
  const WebviewScreenArguments({required this.url});

  final String url;

  @override
  String toString() {
    return '{"url": "$url"}';
  }

  @override
  bool operator ==(covariant WebviewScreenArguments other) {
    if (identical(this, other)) return true;
    return other.url == url;
  }

  @override
  int get hashCode {
    return url.hashCode;
  }
}

class StaffEditLessonUpdateArguments {
  const StaffEditLessonUpdateArguments({required this.id});

  final int id;

  @override
  String toString() {
    return '{"id": "$id"}';
  }

  @override
  bool operator ==(covariant StaffEditLessonUpdateArguments other) {
    if (identical(this, other)) return true;
    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

class StudentAttendanceListReportScreenArguments {
  const StudentAttendanceListReportScreenArguments({
    required this.classId,
    required this.subjectId,
    required this.yearId,
    required this.name,
    required this.totalClasses,
  });

  final String classId;

  final String subjectId;

  final String yearId;

  final String name;

  final String totalClasses;

  @override
  String toString() {
    return '{"classId": "$classId", "subjectId": "$subjectId", "yearId": "$yearId", "name": "$name", "totalClasses": "$totalClasses"}';
  }

  @override
  bool operator ==(covariant StudentAttendanceListReportScreenArguments other) {
    if (identical(this, other)) return true;
    return other.classId == classId &&
        other.subjectId == subjectId &&
        other.yearId == yearId &&
        other.name == name &&
        other.totalClasses == totalClasses;
  }

  @override
  int get hashCode {
    return classId.hashCode ^
        subjectId.hashCode ^
        yearId.hashCode ^
        name.hashCode ^
        totalClasses.hashCode;
  }
}

class StudentAttendanceReportScreenArguments {
  const StudentAttendanceReportScreenArguments({this.key});

  final _i81.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentAttendanceReportScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class StudentWiseAttendanceReportScreenArguments {
  const StudentWiseAttendanceReportScreenArguments({
    required this.studentId,
    required this.classId,
    required this.subjectId,
    required this.yearId,
  });

  final int studentId;

  final String classId;

  final String subjectId;

  final String yearId;

  @override
  String toString() {
    return '{"studentId": "$studentId", "classId": "$classId", "subjectId": "$subjectId", "yearId": "$yearId"}';
  }

  @override
  bool operator ==(covariant StudentWiseAttendanceReportScreenArguments other) {
    if (identical(this, other)) return true;
    return other.studentId == studentId &&
        other.classId == classId &&
        other.subjectId == subjectId &&
        other.yearId == yearId;
  }

  @override
  int get hashCode {
    return studentId.hashCode ^
        classId.hashCode ^
        subjectId.hashCode ^
        yearId.hashCode;
  }
}

class StudentShowListReportScreenArguments {
  const StudentShowListReportScreenArguments({
    required this.classId,
    required this.subjectId,
    required this.yearId,
    required this.name,
    required this.sectionId,
  });

  final String classId;

  final String subjectId;

  final String yearId;

  final String name;

  final String sectionId;

  @override
  String toString() {
    return '{"classId": "$classId", "subjectId": "$subjectId", "yearId": "$yearId", "name": "$name", "sectionId": "$sectionId"}';
  }

  @override
  bool operator ==(covariant StudentShowListReportScreenArguments other) {
    if (identical(this, other)) return true;
    return other.classId == classId &&
        other.subjectId == subjectId &&
        other.yearId == yearId &&
        other.name == name &&
        other.sectionId == sectionId;
  }

  @override
  int get hashCode {
    return classId.hashCode ^
        subjectId.hashCode ^
        yearId.hashCode ^
        name.hashCode ^
        sectionId.hashCode;
  }
}

class StudentExamWiseReportScreenArguments {
  const StudentExamWiseReportScreenArguments({
    required this.classId,
    required this.studentId,
    required this.subjectId,
    required this.yearId,
    required this.name,
    required this.sectionId,
  });

  final String classId;

  final int studentId;

  final String subjectId;

  final String yearId;

  final String name;

  final String sectionId;

  @override
  String toString() {
    return '{"classId": "$classId", "studentId": "$studentId", "subjectId": "$subjectId", "yearId": "$yearId", "name": "$name", "sectionId": "$sectionId"}';
  }

  @override
  bool operator ==(covariant StudentExamWiseReportScreenArguments other) {
    if (identical(this, other)) return true;
    return other.classId == classId &&
        other.studentId == studentId &&
        other.subjectId == subjectId &&
        other.yearId == yearId &&
        other.name == name &&
        other.sectionId == sectionId;
  }

  @override
  int get hashCode {
    return classId.hashCode ^
        studentId.hashCode ^
        subjectId.hashCode ^
        yearId.hashCode ^
        name.hashCode ^
        sectionId.hashCode;
  }
}

extension NavigatorStateExtension on _i101.NavigationService {
  Future<dynamic> navigateToSplashscreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashscreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnbording([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onbording,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignin({
    required String asFor,
    required String? image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signin,
        arguments: SigninArguments(asFor: asFor, image: image),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddSchoolCode([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addSchoolCode,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfile({
    _i75.UserPerInfoModel? model,
    _i76.Uint8List? bytesImage,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.profile,
        arguments: ProfileArguments(model: model, bytesImage: bytesImage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMenu([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.menu,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAttendance([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.attendance,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationpage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationpage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationDetail({
    required _i77.ListElement? listElement,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.notificationDetail,
        arguments: NotificationDetailArguments(listElement: listElement),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLessonUpdateScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.lessonUpdateScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffMenu([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffMenu,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAttendance([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffAttendance,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAttendanceShow({
    required _i78.GetAllStudentAtteListModel? dataModel,
    required String? date,
    required _i79.SectionList? sectionList,
    _i80.Cl? session,
    _i81.TimeOfDay? from,
    _i81.TimeOfDay? to,
    required _i82.SubjectList? subjectList,
    required _i80.Year? year,
    required List<_i83.SaveStudentAttendanceModel>? saveStudentAttendanceModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffAttendanceShow,
        arguments: StaffAttendanceShowArguments(
            dataModel: dataModel,
            date: date,
            sectionList: sectionList,
            session: session,
            from: from,
            to: to,
            subjectList: subjectList,
            year: year,
            saveStudentAttendanceModel: saveStudentAttendanceModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditAttFormScreem([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editAttFormScreem,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditAttShowScreen({
    _i81.Key? key,
    _i78.GetAllStudentAtteListModel? dataModel,
    _i79.SectionList? sectionList,
    _i82.SubjectList? subjectList,
    _i80.Cl? session,
    _i80.Year? year,
    String? date,
    _i81.TimeOfDay? from,
    _i81.TimeOfDay? to,
    List<_i83.SaveAttendanceModel>? saveStudentAttendanceModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editAttShowScreen,
        arguments: EditAttShowScreenArguments(
            key: key,
            dataModel: dataModel,
            sectionList: sectionList,
            subjectList: subjectList,
            session: session,
            year: year,
            date: date,
            from: from,
            to: to,
            saveStudentAttendanceModel: saveStudentAttendanceModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffNotification([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffNotification,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffProfileScreen({
    _i81.Key? key,
    _i84.StaffPersonalInfoModel? model,
    _i76.Uint8List? bytesImage,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffProfileScreen,
        arguments: StaffProfileScreenArguments(
            key: key, model: model, bytesImage: bytesImage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAddLessonUpdate({
    bool edit = false,
    _i85.LessonUpdateOnPageLoadModel? lessonUpdateOnPageLoadModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffAddLessonUpdate,
        arguments: StaffAddLessonUpdateArguments(
            edit: edit,
            lessonUpdateOnPageLoadModel: lessonUpdateOnPageLoadModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffLessonUpdateScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffLessonUpdateScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAddAssignment([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffAddAssignment,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffEditAssignment({
    _i81.Key? key,
    String? assignId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffEditAssignment,
        arguments: StaffEditAssignmentArguments(key: key, assignId: assignId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffSubmitAssDetail({
    required String assignId,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffSubmitAssDetail,
        arguments: StaffSubmitAssDetailArguments(assignId: assignId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAssignmentDetailScreen({
    required String assignId,
    required bool complete,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.assignmentDetailScreen,
        arguments: AssignmentDetailScreenArguments(
            assignId: assignId, complete: complete, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffNotificationDetail({
    required String nId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffNotificationDetail,
        arguments: StaffNotificationDetailArguments(nId: nId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffTimeTable({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffTimeTable,
        arguments: StaffTimeTableArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffMarks([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffMarks,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffFeedBackDetail({
    _i81.Key? key,
    required String nId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffFeedBackDetail,
        arguments: StaffFeedBackDetailArguments(key: key, nId: nId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffFeedBack([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffFeedBack,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAddMarkScreen({
    required List<_i86.AddMarksModel>? addMarksModel,
    required _i86.AllStudentMarksList? dataModel,
    required int? section,
    required int? subject,
    required int? exam,
    required int? assesment,
    required int? classId,
    required int? yearId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffAddMarkScreen,
        arguments: StaffAddMarkScreenArguments(
            addMarksModel: addMarksModel,
            dataModel: dataModel,
            section: section,
            subject: subject,
            exam: exam,
            assesment: assesment,
            classId: classId,
            yearId: yearId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffEditMarks([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffEditMarks,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentMarkDetail({
    _i81.Key? key,
    required _i87.GetStudentMarksList getStudentMarksList,
    required String examName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentMarkDetail,
        arguments: StudentMarkDetailArguments(
            key: key,
            getStudentMarksList: getStudentMarksList,
            examName: examName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffUpdateMarkScreen({
    required List<_i86.AddMarksModel>? addMarksModel,
    required _i86.AllUpdateStudentMarksList? dataModel,
    required int? section,
    required int? subject,
    required int? exam,
    required int? assesment,
    required int? classId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffUpdateMarkScreen,
        arguments: StaffUpdateMarkScreenArguments(
            addMarksModel: addMarksModel,
            dataModel: dataModel,
            section: section,
            subject: subject,
            exam: exam,
            assesment: assesment,
            classId: classId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPdfViewer({
    _i81.Key? key,
    required _i88.File file,
    required String url,
    required String fileName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pdfViewer,
        arguments: PdfViewerArguments(
            key: key, file: file, url: url, fileName: fileName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSubmitAssignment([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.submitAssignment,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentTimeTable({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentTimeTable,
        arguments: StudentTimeTableArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffMyChapterScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffMyChapterScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAddChapter({
    bool edit = false,
    _i89.Chapter? chapter,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffAddChapter,
        arguments: StaffAddChapterArguments(edit: edit, chapter: chapter),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffFacultyAllocationScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffFacultyAllocationScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentAllocation({
    required List<_i90.FacultyAllocationStudentList>? studentList,
    required _i79.SectionList? sectionList,
    required _i82.SubjectList? subjectList,
    required _i80.Year? year,
    required _i80.Cl? classes,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentAllocation,
        arguments: StudentAllocationArguments(
            studentList: studentList,
            sectionList: sectionList,
            subjectList: subjectList,
            year: year,
            classes: classes),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffFacultyDeAllocationScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffFacultyDeAllocationScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentDeAllocation({
    required List<_i90.FacultyDeAllocationStudentList>? studentList,
    required _i79.SectionList? sectionList,
    required _i82.SubjectList? subjectList,
    required _i80.Year? year,
    required _i80.Cl? classes,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentDeAllocation,
        arguments: StudentDeAllocationArguments(
            studentList: studentList,
            sectionList: sectionList,
            subjectList: subjectList,
            year: year,
            classes: classes),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentFeesDetail([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentFeesDetail,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentFeedBack([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentFeedBack,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentFeedBackDetail({
    _i81.Key? key,
    required String nId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentFeedBackDetail,
        arguments: StudentFeedBackDetailArguments(key: key, nId: nId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentAddFeedback([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentAddFeedback,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffVideosScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffVideosScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEventDetail({
    required _i91.ListElement? listElement,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.eventDetail,
        arguments: EventDetailArguments(listElement: listElement),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVideoDetailScreen({
    required _i92.ListElement model,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.videoDetailScreen,
        arguments: VideoDetailScreenArguments(model: model, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddVideoScreen({
    bool edit = false,
    required _i93.GetVideoDetailModel? videoDetail,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addVideoScreen,
        arguments:
            AddVideoScreenArguments(edit: edit, videoDetail: videoDetail),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuildClasses({
    required String heading,
    required List<_i94.Schedule> schedulesList,
    required bool today,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.buildClasses,
        arguments: BuildClassesArguments(
            heading: heading, schedulesList: schedulesList, today: today),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentBuildClasses({
    required String heading,
    required List<_i94.Schedule> schedulesList,
    required bool today,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentBuildClasses,
        arguments: StudentBuildClassesArguments(
            heading: heading, schedulesList: schedulesList, today: today),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentLearn({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentLearn,
        arguments: StudentLearnArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentLearnChapters({
    required _i95.StudentLearnChapterModel? model,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentLearnChapters,
        arguments: StudentLearnChaptersArguments(model: model),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChapterVideo({
    required String chapterId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chapterVideo,
        arguments: ChapterVideoArguments(chapterId: chapterId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVideoScreen({
    String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.videoScreen,
        arguments: VideoScreenArguments(id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAssignmentScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.staffAssignmentScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffEditChapter({
    String? chapterId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffEditChapter,
        arguments: StaffEditChapterArguments(chapterId: chapterId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAssignmentHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i96.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.assignmentHistoryScreen,
        arguments: AssignmentHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffAssignmentHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i97.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffAssignmentHistoryScreen,
        arguments: StaffAssignmentHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffFeedBackHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i98.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffFeedBackHistoryScreen,
        arguments: StaffFeedBackHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFeedbackHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i99.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.feedbackHistoryScreen,
        arguments: FeedbackHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentFeesReceipts([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentFeesReceipts,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentAssignmentScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentAssignmentScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffLessonDetail({
    required _i85.LessonUpdateOnPageLoadModel model,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffLessonDetail,
        arguments: StaffLessonDetailArguments(model: model, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentLessonDetail({
    required _i100.LessonList model,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentLessonDetail,
        arguments: StudentLessonDetailArguments(model: model, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebviewScreen({
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.webviewScreen,
        arguments: WebviewScreenArguments(url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStaffEditLessonUpdate({
    required int id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.staffEditLessonUpdate,
        arguments: StaffEditLessonUpdateArguments(id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentAttendanceListReportScreen({
    required String classId,
    required String subjectId,
    required String yearId,
    required String name,
    required String totalClasses,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentAttendanceListReportScreen,
        arguments: StudentAttendanceListReportScreenArguments(
            classId: classId,
            subjectId: subjectId,
            yearId: yearId,
            name: name,
            totalClasses: totalClasses),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAttendanceYearlyReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.attendanceYearlyReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentAttendanceReportScreen({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentAttendanceReportScreen,
        arguments: StudentAttendanceReportScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentAttendanceYearlyReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentAttendanceYearlyReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCollegeAttendanceYearlyReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.collegeAttendanceYearlyReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentWiseAttendanceReportScreen({
    required int studentId,
    required String classId,
    required String subjectId,
    required String yearId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentWiseAttendanceReportScreen,
        arguments: StudentWiseAttendanceReportScreenArguments(
            studentId: studentId,
            classId: classId,
            subjectId: subjectId,
            yearId: yearId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentWiseReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentWiseReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentShowListReportScreen({
    required String classId,
    required String subjectId,
    required String yearId,
    required String name,
    required String sectionId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentShowListReportScreen,
        arguments: StudentShowListReportScreenArguments(
            classId: classId,
            subjectId: subjectId,
            yearId: yearId,
            name: name,
            sectionId: sectionId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentExamWiseReportScreen({
    required String classId,
    required int studentId,
    required String subjectId,
    required String yearId,
    required String name,
    required String sectionId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentExamWiseReportScreen,
        arguments: StudentExamWiseReportScreenArguments(
            classId: classId,
            studentId: studentId,
            subjectId: subjectId,
            yearId: yearId,
            name: name,
            sectionId: sectionId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyAttendanceReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myAttendanceReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashscreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashscreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnbording([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onbording,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignin({
    required String asFor,
    required String? image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signin,
        arguments: SigninArguments(asFor: asFor, image: image),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddSchoolCode([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addSchoolCode,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfile({
    _i75.UserPerInfoModel? model,
    _i76.Uint8List? bytesImage,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.profile,
        arguments: ProfileArguments(model: model, bytesImage: bytesImage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMenu([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.menu,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAttendance([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.attendance,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationpage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationpage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationDetail({
    required _i77.ListElement? listElement,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.notificationDetail,
        arguments: NotificationDetailArguments(listElement: listElement),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLessonUpdateScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.lessonUpdateScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffMenu([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffMenu,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAttendance([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffAttendance,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAttendanceShow({
    required _i78.GetAllStudentAtteListModel? dataModel,
    required String? date,
    required _i79.SectionList? sectionList,
    _i80.Cl? session,
    _i81.TimeOfDay? from,
    _i81.TimeOfDay? to,
    required _i82.SubjectList? subjectList,
    required _i80.Year? year,
    required List<_i83.SaveStudentAttendanceModel>? saveStudentAttendanceModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffAttendanceShow,
        arguments: StaffAttendanceShowArguments(
            dataModel: dataModel,
            date: date,
            sectionList: sectionList,
            session: session,
            from: from,
            to: to,
            subjectList: subjectList,
            year: year,
            saveStudentAttendanceModel: saveStudentAttendanceModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditAttFormScreem([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editAttFormScreem,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditAttShowScreen({
    _i81.Key? key,
    _i78.GetAllStudentAtteListModel? dataModel,
    _i79.SectionList? sectionList,
    _i82.SubjectList? subjectList,
    _i80.Cl? session,
    _i80.Year? year,
    String? date,
    _i81.TimeOfDay? from,
    _i81.TimeOfDay? to,
    List<_i83.SaveAttendanceModel>? saveStudentAttendanceModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editAttShowScreen,
        arguments: EditAttShowScreenArguments(
            key: key,
            dataModel: dataModel,
            sectionList: sectionList,
            subjectList: subjectList,
            session: session,
            year: year,
            date: date,
            from: from,
            to: to,
            saveStudentAttendanceModel: saveStudentAttendanceModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffNotification([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffNotification,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffProfileScreen({
    _i81.Key? key,
    _i84.StaffPersonalInfoModel? model,
    _i76.Uint8List? bytesImage,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffProfileScreen,
        arguments: StaffProfileScreenArguments(
            key: key, model: model, bytesImage: bytesImage),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAddLessonUpdate({
    bool edit = false,
    _i85.LessonUpdateOnPageLoadModel? lessonUpdateOnPageLoadModel,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffAddLessonUpdate,
        arguments: StaffAddLessonUpdateArguments(
            edit: edit,
            lessonUpdateOnPageLoadModel: lessonUpdateOnPageLoadModel),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffLessonUpdateScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffLessonUpdateScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAddAssignment([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffAddAssignment,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffEditAssignment({
    _i81.Key? key,
    String? assignId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffEditAssignment,
        arguments: StaffEditAssignmentArguments(key: key, assignId: assignId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffSubmitAssDetail({
    required String assignId,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffSubmitAssDetail,
        arguments: StaffSubmitAssDetailArguments(assignId: assignId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAssignmentDetailScreen({
    required String assignId,
    required bool complete,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.assignmentDetailScreen,
        arguments: AssignmentDetailScreenArguments(
            assignId: assignId, complete: complete, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffNotificationDetail({
    required String nId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffNotificationDetail,
        arguments: StaffNotificationDetailArguments(nId: nId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffTimeTable({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffTimeTable,
        arguments: StaffTimeTableArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffMarks([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffMarks,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffFeedBackDetail({
    _i81.Key? key,
    required String nId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffFeedBackDetail,
        arguments: StaffFeedBackDetailArguments(key: key, nId: nId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffFeedBack([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffFeedBack,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAddMarkScreen({
    required List<_i86.AddMarksModel>? addMarksModel,
    required _i86.AllStudentMarksList? dataModel,
    required int? section,
    required int? subject,
    required int? exam,
    required int? assesment,
    required int? classId,
    required int? yearId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffAddMarkScreen,
        arguments: StaffAddMarkScreenArguments(
            addMarksModel: addMarksModel,
            dataModel: dataModel,
            section: section,
            subject: subject,
            exam: exam,
            assesment: assesment,
            classId: classId,
            yearId: yearId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffEditMarks([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffEditMarks,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentMarkDetail({
    _i81.Key? key,
    required _i87.GetStudentMarksList getStudentMarksList,
    required String examName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentMarkDetail,
        arguments: StudentMarkDetailArguments(
            key: key,
            getStudentMarksList: getStudentMarksList,
            examName: examName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffUpdateMarkScreen({
    required List<_i86.AddMarksModel>? addMarksModel,
    required _i86.AllUpdateStudentMarksList? dataModel,
    required int? section,
    required int? subject,
    required int? exam,
    required int? assesment,
    required int? classId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffUpdateMarkScreen,
        arguments: StaffUpdateMarkScreenArguments(
            addMarksModel: addMarksModel,
            dataModel: dataModel,
            section: section,
            subject: subject,
            exam: exam,
            assesment: assesment,
            classId: classId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPdfViewer({
    _i81.Key? key,
    required _i88.File file,
    required String url,
    required String fileName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.pdfViewer,
        arguments: PdfViewerArguments(
            key: key, file: file, url: url, fileName: fileName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSubmitAssignment([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.submitAssignment,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentTimeTable({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentTimeTable,
        arguments: StudentTimeTableArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffMyChapterScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffMyChapterScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAddChapter({
    bool edit = false,
    _i89.Chapter? chapter,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffAddChapter,
        arguments: StaffAddChapterArguments(edit: edit, chapter: chapter),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffFacultyAllocationScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffFacultyAllocationScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentAllocation({
    required List<_i90.FacultyAllocationStudentList>? studentList,
    required _i79.SectionList? sectionList,
    required _i82.SubjectList? subjectList,
    required _i80.Year? year,
    required _i80.Cl? classes,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentAllocation,
        arguments: StudentAllocationArguments(
            studentList: studentList,
            sectionList: sectionList,
            subjectList: subjectList,
            year: year,
            classes: classes),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffFacultyDeAllocationScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffFacultyDeAllocationScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentDeAllocation({
    required List<_i90.FacultyDeAllocationStudentList>? studentList,
    required _i79.SectionList? sectionList,
    required _i82.SubjectList? subjectList,
    required _i80.Year? year,
    required _i80.Cl? classes,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentDeAllocation,
        arguments: StudentDeAllocationArguments(
            studentList: studentList,
            sectionList: sectionList,
            subjectList: subjectList,
            year: year,
            classes: classes),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentFeesDetail([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentFeesDetail,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentFeedBack([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentFeedBack,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentFeedBackDetail({
    _i81.Key? key,
    required String nId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentFeedBackDetail,
        arguments: StudentFeedBackDetailArguments(key: key, nId: nId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentAddFeedback([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentAddFeedback,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffVideosScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffVideosScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEventDetail({
    required _i91.ListElement? listElement,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.eventDetail,
        arguments: EventDetailArguments(listElement: listElement),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVideoDetailScreen({
    required _i92.ListElement model,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.videoDetailScreen,
        arguments: VideoDetailScreenArguments(model: model, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddVideoScreen({
    bool edit = false,
    required _i93.GetVideoDetailModel? videoDetail,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addVideoScreen,
        arguments:
            AddVideoScreenArguments(edit: edit, videoDetail: videoDetail),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuildClasses({
    required String heading,
    required List<_i94.Schedule> schedulesList,
    required bool today,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.buildClasses,
        arguments: BuildClassesArguments(
            heading: heading, schedulesList: schedulesList, today: today),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentBuildClasses({
    required String heading,
    required List<_i94.Schedule> schedulesList,
    required bool today,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentBuildClasses,
        arguments: StudentBuildClassesArguments(
            heading: heading, schedulesList: schedulesList, today: today),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentLearn({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentLearn,
        arguments: StudentLearnArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentLearnChapters({
    required _i95.StudentLearnChapterModel? model,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentLearnChapters,
        arguments: StudentLearnChaptersArguments(model: model),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChapterVideo({
    required String chapterId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chapterVideo,
        arguments: ChapterVideoArguments(chapterId: chapterId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVideoScreen({
    String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.videoScreen,
        arguments: VideoScreenArguments(id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAssignmentScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.staffAssignmentScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffEditChapter({
    String? chapterId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffEditChapter,
        arguments: StaffEditChapterArguments(chapterId: chapterId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAssignmentHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i96.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.assignmentHistoryScreen,
        arguments: AssignmentHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffAssignmentHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i97.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffAssignmentHistoryScreen,
        arguments: StaffAssignmentHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffFeedBackHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i98.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffFeedBackHistoryScreen,
        arguments: StaffFeedBackHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFeedbackHistoryScreen({
    required String assignId,
    required String subject,
    required List<_i99.Data> dataList,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.feedbackHistoryScreen,
        arguments: FeedbackHistoryScreenArguments(
            assignId: assignId, subject: subject, dataList: dataList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentFeesReceipts([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentFeesReceipts,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentAssignmentScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentAssignmentScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffLessonDetail({
    required _i85.LessonUpdateOnPageLoadModel model,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffLessonDetail,
        arguments: StaffLessonDetailArguments(model: model, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentLessonDetail({
    required _i100.LessonList model,
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentLessonDetail,
        arguments: StudentLessonDetailArguments(model: model, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWebviewScreen({
    required String url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.webviewScreen,
        arguments: WebviewScreenArguments(url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStaffEditLessonUpdate({
    required int id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.staffEditLessonUpdate,
        arguments: StaffEditLessonUpdateArguments(id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentAttendanceListReportScreen({
    required String classId,
    required String subjectId,
    required String yearId,
    required String name,
    required String totalClasses,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentAttendanceListReportScreen,
        arguments: StudentAttendanceListReportScreenArguments(
            classId: classId,
            subjectId: subjectId,
            yearId: yearId,
            name: name,
            totalClasses: totalClasses),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAttendanceYearlyReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.attendanceYearlyReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentAttendanceReportScreen({
    _i81.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentAttendanceReportScreen,
        arguments: StudentAttendanceReportScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentAttendanceYearlyReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentAttendanceYearlyReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCollegeAttendanceYearlyReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.collegeAttendanceYearlyReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentWiseAttendanceReportScreen({
    required int studentId,
    required String classId,
    required String subjectId,
    required String yearId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentWiseAttendanceReportScreen,
        arguments: StudentWiseAttendanceReportScreenArguments(
            studentId: studentId,
            classId: classId,
            subjectId: subjectId,
            yearId: yearId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentWiseReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentWiseReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentShowListReportScreen({
    required String classId,
    required String subjectId,
    required String yearId,
    required String name,
    required String sectionId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentShowListReportScreen,
        arguments: StudentShowListReportScreenArguments(
            classId: classId,
            subjectId: subjectId,
            yearId: yearId,
            name: name,
            sectionId: sectionId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentExamWiseReportScreen({
    required String classId,
    required int studentId,
    required String subjectId,
    required String yearId,
    required String name,
    required String sectionId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentExamWiseReportScreen,
        arguments: StudentExamWiseReportScreenArguments(
            classId: classId,
            studentId: studentId,
            subjectId: subjectId,
            yearId: yearId,
            name: name,
            sectionId: sectionId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyAttendanceReportScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myAttendanceReportScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
