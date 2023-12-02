import 'package:dio/dio.dart';
import 'package:quiz_app_task/model/request/create_question_model.dart';
import 'package:quiz_app_task/model/response/question_model.dart';
import 'package:quiz_app_task/service/base_service.dart';

abstract class QuestionService extends BaseService {
  Future<List<QuestionModel>> getAllQuestion();
  Future<QuestionModel> getOneQuestion(String id);
  createNewQuestion(CreateQuestionModel newQestion);
  updateOldQuestion(String id, CreateQuestionModel newQestion);
  deleteQuestion(String id);
}

class QuestionServiceImp extends QuestionService {
  @override
  createNewQuestion(CreateQuestionModel newQestion) {
    // TODO: implement createNewQuestion
    throw UnimplementedError();
  }

  @override
  deleteQuestion(String id) {
    // TODO: implement deleteQuestion
    throw UnimplementedError();
  }

  @override
  Future<List<QuestionModel>> getAllQuestion() async {
    Response response = await dio.get(baseUrl);
    print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data;
      List<QuestionModel> questions = List.generate(
          temp.length, (index) => QuestionModel.fromMap(temp[index]));
      return questions;
    } else {
      return [];
    }
  }

  @override
  Future<QuestionModel> getOneQuestion(String id) {
    // TODO: implement getOneQuestion
    throw UnimplementedError();
  }

  @override
  updateOldQuestion(String id, CreateQuestionModel newQestion) {
    // TODO: implement updateOldQuestion
    throw UnimplementedError();
  }
}
