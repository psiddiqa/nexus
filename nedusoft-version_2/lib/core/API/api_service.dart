
import 'package:dio/dio.dart';
import 'package:nedusoft/UI/staff/Attendance/attendance_view_model.dart';
import 'package:nedusoft/models/attendance_model.dart';
import 'package:nedusoft/models/get_combine_sec_model.dart';
import 'package:nedusoft/models/get_status_model.dart';
import 'package:nedusoft/models/getall_attendance_model.dart';
import 'package:nedusoft/models/getall_section_model.dart';
import 'package:nedusoft/models/getattendance_model.dart';
import 'package:nedusoft/models/getbase_model.dart';
import 'package:nedusoft/models/getlogo_model.dart';
import 'package:nedusoft/models/lesson_update_model.dart';
import 'package:nedusoft/models/login_model.dart';
import 'package:nedusoft/models/notification_model.dart';
import 'package:nedusoft/models/save_attendance_model.dart';
import 'package:nedusoft/models/staff/all_marks_students_model.dart';
import 'package:nedusoft/models/staff/exam_mater_model.dart';
import 'package:nedusoft/models/staff/experience_model.dart';
import 'package:nedusoft/models/staff/family_details_model.dart';
import 'package:nedusoft/models/staff/feedback_detail_model.dart';
import 'package:nedusoft/models/staff/get_chapter_details.dart';
import 'package:nedusoft/models/staff/get_faculty_videos.dart';
import 'package:nedusoft/models/staff/get_publisher_model.dart';
import 'package:nedusoft/models/staff/get_timetable_model.dart';
import 'package:nedusoft/models/staff/get_video_detail_model.dart';
import 'package:nedusoft/models/staff/marks_onpage_model.dart';
import 'package:nedusoft/models/staff/my_chapter_list_model.dart';
import 'package:nedusoft/models/staff/submit_assignment_model.dart';
import 'package:nedusoft/models/staff_info_model.dart';
import 'package:nedusoft/models/staff_notification_model.dart';
import 'package:nedusoft/models/student/attendance_report_model.dart';
import 'package:nedusoft/models/student/family_model.dart';
import 'package:nedusoft/models/student/hospital_model.dart';
import 'package:nedusoft/models/student/student_assignment_model.dart';
import 'package:nedusoft/models/student/student_feedback_model.dart';
import 'package:nedusoft/models/student/student_learn_model.dart';
import 'package:nedusoft/models/user_info_model.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/getall_subject_model.dart';
import '../../models/staff/academices_model.dart';
import '../../models/staff/all_year_model.dart';
import '../../models/staff/assignment_onpage_model.dart';
import '../../models/staff/edit_lesson_update.dart';
import '../../models/staff/faculty_allocation_model.dart';
import '../../models/staff/feedback_list_model.dart';
import '../../models/staff/getFacultySubjectWiseAttnDataModel.dart';
import '../../models/staff/getStudentClassWise_model.dart';
import '../../models/staff/get_specific_assignment.dart';
import '../../models/staff/lesson_onpage_model.dart';
import '../../models/staff/my_attendance_model.dart';
import '../../models/staff/notification_detail.dart';
import '../../models/staff/report_model.dart';
import '../../models/staff/session_model.dart';
import '../../models/staff/student_Show_performance_model.dart';
import '../../models/staff/student_exam_wise_model.dart';
import '../../models/staff/submit_ass_detail_model.dart';
import '../../models/staff/yearly_attendance_report.dart';
import '../../models/student/college_student_model.dart';
import '../../models/student/fees_detail.dart';
import '../../models/student/get_mark_dropdown_model.dart';
import '../../models/student/on_page_receipts_mode.dart';
import '../../models/student/student_assignment_detail_model.dart';
import '../../models/student/student_event_model.dart';
import '../../models/student/student_feedback_detail_model.dart';
import '../../models/student/student_sibling_model.dart';
import '../../models/student/student_staff_model.dart';
import '../service_locator/service_locator.dart';
import '../services/needed_utils.dart';
import 'Interceptor.dart';

part 'api_service.g.dart';

@lazySingleton
@RestApi(baseUrl: 'https://baseapi.schoolerp.mobi')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @factoryMethod
  static ApiService create() {
    final dio = locator<NeededVariables>().dio
      ..interceptors.add(PrettyDioLogger(requestBody: true));
    dio.options = BaseOptions(receiveTimeout: 20000, connectTimeout: 20000, headers: {});
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    dio.interceptors.add(throughOutInterceptorsWrapper(dio));
    return ApiService(dio);
  }

  @POST('/api/login/getserviceurl')
  Future<GetBaseUrl> getBaseUrl(@Body() Map<String,dynamic> body); 

  
  
  @POST('api/login/GetLogo')
  Future<GetLogoModel> getLogo();  
  
  @POST('api/login/ValidateUser')
  Future<LoginModel> getLogin(@Body() Map<String,dynamic> body); 
  
  @POST('api/login/ValidateEmployee')
  Future<LoginModel> getStaffLogin(@Body() Map<String,dynamic> body); 
  
  @POST('api/AcademicAPI/GetStudentPersonalInfo')
  Future<UserPerInfoModel> getUserInfo(@Body() Map<String,dynamic> body);

  @POST('api/AcademicAPI/GetStudentAttendance')
  Future<AttendanceModel> getAttendance(@Body() Map<String,dynamic> body);
  
  @POST('api/FacultyAPI/GetAllNoticationAPI')
  Future<NotificationModel> getNotification(@Body() Map<String,dynamic> body);  
  
  @POST('api/AcademicAPI/GetAllLessonUpdate')
  Future<LessonUpdateModel> getLessonUpdateOnLoad(@Body() Map<String,dynamic> body);  
  
  @POST('api/FacultyAPI/GetEnterAttendanceDropdowns')
  Future<GetEnterAttendanceDropdownsModel> getEnterAttendanceDropdowns(@Body() Map<String,dynamic> body);

  @POST('api/FacultyAPI/GetAllSectionCasAPI')
  Future<GetAllSectionModal> getAllSection(@Body() Map<String,dynamic> body); 
  
  @POST('api/FacultyAPI/GetAllSubjectsCasAPI')
  Future<GetAllSubjectModal> getAllSubject(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAllShortClassesAPI')
  Future<GetAllClassesModel> getAllClass(@Body() Map<String, dynamic> body);  
  
  @POST('api/FacultyAPI/GetAllStudentsAPI')
  Future<GetAllStudentAtteListModel> getAllStudentAttendanceList(@Body() Map<String,dynamic> body); 
  
  
  @POST('api/FacultyAPI/GetAllAttendanceAPI')
  Future<GetAllStudentAtteListModel> getAllAttendanceList(@Body() Map<String,dynamic> body);


  @POST('api/FacultyAPI/GetAllCombinedSectionAPI')
  Future<GetAllCombineSectionModel> getAllCombineSection(@Body() Map<String,dynamic> body);


  @POST('api/FacultyAPI/GetAllCombinedSubjectsAPI')
  Future<GetAllCombineSubjectModel> getAllCombineSubject(@Body() Map<String,dynamic> body);
  
  @POST('api/FacultyAPI/GetAllCombinedClassAPI')
  Future<GetAllCombineClassModel> getAllCombineClass(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAllAttendanceStatus')
  Future<GetAllStatusModel> getAllStatus(@Body() Map<String,dynamic> body);  
  
  @POST('api/FacultyAPI/GetAllChaptersAPI')
  Future<GetAllStatusModel> getAllChapters(@Body() Map<String,dynamic> body);

  @POST('api/FacultyAPI/GetAllAttendanceRemarks')
  Future<GetAllRemarkModel> getAllRemark(@Body() Map<String,dynamic> body); 
  
  @POST('api/FacultyAPI/AddStudentAttendanceAPI')
  Future<SaveAttendanceResult> saveAttendance(@Body() Map<String,dynamic> body);
  
  @POST('api/FacultyAPI/UpdateStudentAttendanceAPI')
  Future<OutputModel> updateAttendance(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetFacultySubjectStudents')
  Future<GetFacultySubjectWiseAttnDataModel> getFacultySubjectWiseAttnData(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetFacultySubjectWiseAttnData')
  Future<GetFacultySubjectAttnDataModel> getFacultySubjectAttnData(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetFacultyStudentCalendarDays')
  Future<GetFacultyStudentCalendarDaysModel> getFacultyStudentCalendarDays(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetStudentClassWisePerformanceData')
  Future<GetStudentClassWisePerformanceDataModel> getStudentClassWisePerformanceDataModel(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetStudentWisePerformanceData')
  Future<StudentShowMarkListModel> getStudentPerformanceDataModel(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetStudentExamWisePerformanceData')
  Future<GetStudentExamWisePerformanceData> getStudentExamWisePerformanceData(@Body() Map<String, dynamic> body);  
  
  


  @POST('api/FacultyAPI/GetNotifications')
  Future<StaffNotificationModel> staffAllNotification(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetANotificationAPI')
  Future<StaffNotificationDetailModel> staffNotificationDetail(@Body() Map<String, dynamic> body);

  @POST('api/HRMSAPI/GetAEmployee')
  Future<StaffPersonalInfoModel> getStaffPersonalInfo(@Body() Map<String,dynamic> body);

  @POST('api/FacultyAPI/AddManualLessonUpdate')
  Future<OutputModel> addStaffLessonUpdate(@Body() Map<String,dynamic> body);
  
  @POST('api/FacultyAPI/AddStudentAssignment')
  Future<OutputModel> addStaffAssignment(@Body() Map<String,dynamic> body);  
  
  @POST('api/FacultyAPI/GetAllManualLessonAPI')
  Future<LessonUpdateOnPageLoadModel> onPageStaffLessonUpdate(@Body() Map<String,dynamic> body);


  @POST('api/FacultyAPI/GetFacultyAssignments')
  Future<StaffAssignmentModel> onPageStaffAssignment(@Body() Map<String,dynamic> body);

  @POST('api/FacultyAPI/GetAManualLessonAPI')
  Future<EditLessonUpdateModel> editStaffLessonUpdate(@Body() Map<String,dynamic> body); 
  
  @POST('api/FacultyAPI/UpdateManualLessonAPI')
  Future<OutputModel> updateStaffLessonUpdate(@Body() Map<String,dynamic> body); 
  
  @POST('api/FacultyAPI/UpdateStudentAssignment')
  Future<OutputModel> updateStaffAssignment(@Body() Map<String,dynamic> body);  
  
  @POST('api/FacultyAPI/GetEditAssignmentDetails')
  Future<GetSpecificAssignmentModel> getSpecificAssignmentDetail(@Body() Map<String,dynamic> body);

  @POST('api/FacultyAPI/GetSubmittedAssignments')
  Future<GetSubmitAssignmentListModel> submitAssignment(@Body() Map<String,dynamic> body);

  @POST('api/FacultyAPI/GetSubmittedAssignmentDetails')
  Future<GetSubmittedAssignmentDetailsModel> getSubmitAssignmentDetail(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/UpdateAssignmentStatus')
  Future<OutputModel> updateSubmitAssignment(@Body() Map<String, dynamic> body); 
  
  @POST('api/HRMSAPI/GetAllFamilyAPI')
  Future<FamilyDetailsModel> familyDetails(@Body() Map<String, dynamic> body);

  @POST('api/HRMSAPI/GetEmpWorkExperience')
  Future<ExperienceDetailsModel> experienceDetails(@Body() Map<String, dynamic> body);

  @POST('api/HRMSAPI/GetAllAcademicsAPI')
  Future<AcademicsDetailsModel> academicesDetails(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetFacultyTimeTable')
  Future<TimeTableModel> getTimeTable(@Body() Map<String, dynamic> body);    
  
  @POST('api/AcademicAPI/GetFacultyTimeTableJson')
  Future<GetFacultyTimeTableModel> getTimeTableInJson(@Body() Map<String, dynamic> body);  
  
  @POST('api/AcademicAPI/GetStudentTimeTable')
  Future<TimeTableModel> getStudentTimeTable(@Body() Map<String, dynamic> body);
  
  @POST('api/AcademicAPI/GetStudentTimeTableJson')
  Future<GetFacultyTimeTableModel> getStudentTimeTableJson(@Body() Map<String, dynamic> body);

  @POST('api/EventsAPI/GetFacultyFeedbacks')
  Future<FeebbackListModel> getFeedbackList(@Body() Map<String, dynamic> body);

  @POST('api/EventsAPI/GetFeedbackDetailsAPI')
  Future<FeedbackDetailModel> getFeedbackDetail(@Body() Map<String, dynamic> body);

  @POST('api/EventsAPI/AddFeedbackResponseAPI')
  Future<OutputModel> addFeedback(@Body() Map<String, dynamic> body);  
  
  @POST('api/FacultyAPI/GetMarksAllocationDropdowns')
  Future<MarksOnPageModel> marksOnPageDropdown(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetMarksAllocationDropdowns')
  Future<MarksOnPageModel> editMarksOnPageDropdown(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAllExamMasterAPI')
  Future<GetExamMasterModel> examMaster(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAllExamTypeAPI')
  Future<GetExamMasterModel> examTypeResult(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAllAPIFacultyAllocatedStudents')
  Future<AllStudentMarksList> getAllMarkStudentsList(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetIssuedMarks')
  Future<AllUpdateStudentMarksList> getAllUpdateMarkStudentsList(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/AddStudentMarksAPI')
  Future<OutputModel> submitMarks(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/UpdateStudentMarksAPI')
  Future<OutputModel> submitUpdateMarks(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAllChapterAPI')
  Future<MyChaptersListModel> myChapterList(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAllYearAPI')
  Future<AllYearListModel> allYearList(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/SaveUpdateChapterAPI')
  Future<OutputModel> saveChapters(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/SaveUpdateChapterAPI')
  Future<OutputModel> updateChapters(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetAChapterAPI')
  Future<GetChapterDetailModel> chaptersDetails(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetClassAllocatedStudentsAPI')
  Future<FacultyAllocationList> getFacultyAllocationList(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/GetFacultyAllocatedStudents')
  Future<FacultyAllocationList> getAllocatedStudent(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/AddFacultyAllocationAPI')
  Future<OutputModel> addFacultyAllocation(@Body() Map<String, dynamic> body);

  @POST('api/FacultyAPI/FacultyDeAllocationAPI')
  Future<OutputModel> facultyDeAllocation(@Body() Map<String, dynamic> body);

  @POST('api/LearnAPI/GetFacultyVideos')
  Future<GetFacultyVideoModel> getFacultyVideo(@Body() Map<String, dynamic> body);
  
  @POST('api/LearnAPI/GetPublishers')
  Future<GetPublisherModel> getPublisher(@Body() Map<String, dynamic> body);

  @POST('api/LearnAPI/PublishVideo')
  Future<OutputModel> publishVideo(@Body() Map<String, dynamic> body);

  @POST('api/LearnAPI/AddUpdateFacultyVideo')
  Future<OutputModel> addVideo(@Body() Map<String, dynamic> body);

  @POST('api/LearnAPI/GetVideoDetails')
  Future<GetVideoDetailModel> videoDetail(@Body() Map<String, dynamic> body);  

  @POST('api/FacultyAPI/GetNoOfSession')
  Future<SessionModelForStaff> sessionList(@Body() Map<String, dynamic> body);    
  
  @POST('api/ReportAPI/GetFacultyAttendanceSummarisedReport')
  Future<ReportModel> getStaffReport(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetStudentAttnOverviewReport')
  Future<YearAttendanceReport> getYearlyAttendanceReport(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetStudentAttendanceForCalendar')
  Future<YearAttendanceReport> getMonthlyAttendanceReport(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetStudentSubjectWiseAttnReport')
  Future<CollegeStudentReportModel> getCollegeStudentReport(@Body() Map<String, dynamic> body);

  @POST('api/ReportAPI/GetFacultyEnteredAttnDetails')
  Future<MyAttendanceReportModel> myAttendanceReport(@Body() Map<String, dynamic> body);  




  


  @POST('api/AcademicAPI/GetStudentAssignments')
  Future<StudentAssignmentModel> getStudentsAssignment(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetAssignmentDetails')
  Future<GetStudentAssignmentDetailsModel> getAssignmentDetail(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/SubmitStudentAssignment')
  Future<OutputModel> submitStudentAssignment(@Body() Map<String, dynamic> body);  
  
  @POST('api/AcademicAPI/GetStudentSections')
  Future<GetMarksDropDownModel> markDropDownList(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetExamsNames')
  Future<GetStudentExamList> getStudentsExamList(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetStudentMarks')
  Future<GetStudentMarksList> getStudentMarkList(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetStudentFamilyInfo')
  Future<StudentFamilyModel> getStudentFamilyDetail(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetStudentHospitalInfo')
  Future<StudentHospitalModel> getStudentHospitalDetail(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetStudentFeeDetails')
  Future<StudentFeesModel> getFeesDetail(@Body() Map<String, dynamic> body);
  
  @POST('api/AcademicAPI/GetStudentTermsFeeDetails')
  Future<StudentFeesModel> getTermsFeesDetail(@Body() Map<String, dynamic> body);

  @POST('api/EventsAPI/GetStudentFeedbacks')
  Future<StudentFeedbackListModel> getStudentFeedbackList(@Body() Map<String, dynamic> body);
  @POST('api/EventsAPI/GetFeedbackDetailsAPI')
  Future<StudentFeedbackDetail> getStudentFeedbackDetail(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetAllEventsAPI')
  Future<StudentEventModel> getEventList(@Body() Map<String, dynamic> body);  
  
  @POST('api/AcademicAPI/GetStudentSubjects')
  Future<StudentLearnStubjectModel> getStudentLearnSubject(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetChapters')
  Future<StudentLearnChapterModel> getStudentLearnChapters(@Body() Map<String, dynamic> body);
  @POST('api/LearnAPI/GetStudentChapterVideos')
  Future<ChapterVideosModel> chaptervideos(@Body() Map<String, dynamic> body);  
  
  @POST('api/AcademicAPI/GetStudentAttendanceReport')
  Future<StudentAttendanceReportModel> attendanceReport(@Body() Map<String, dynamic> body);  
  
  @POST('api/AcademicAPI/GetStudentFacultyAPI')
  Future<StudentStaffModel> studentStaff(@Body() Map<String, dynamic> body);

  @POST('api/EventsAPI/AddStudentFeedbackAPI')
  Future<OutputModel> addStudentFeedback(@Body() Map<String, dynamic> body);

  @POST('api/FeesAPI/GetStudentFeeReceipts')
  Future<OnPageReceiptsModel> onPageReceipts(@Body() Map<String, dynamic> body);

  @POST('api/FeesAPI/GetStudentFeeReceiptFile')
  Future<OutputModel> studentReceiptsFile(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetStudentSiblingsAPI')
  Future<StudentSiblings> studentSibling(@Body() Map<String, dynamic> body);

  @POST('api/AcademicAPI/GetStudentLoginDetailsAPI')
  Future<LoginModel> getStudentInfo(@Body() Map<String, dynamic> body);

  @POST('api/FeesAPI/GetStudentFeeDetails')
  Future<StudentFeeModel> getStudentFee(@Body() Map<String, dynamic> body);  
  
  @POST('api/LearnAPI/GetVideoSynopsisFile')
  Future<SynopsisModel> getSynopsis(@Body() Map<String, dynamic> body);

  


  /////////////////////////
  ///// GET REQs ////////
  ///////////////////////
  
}
