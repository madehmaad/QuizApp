import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_task/UI/widgets.dart';
import 'package:quiz_app_task/model/request/create_question_model.dart';
import 'package:quiz_app_task/model/response/question_model.dart';

import 'package:quiz_app_task/service/question_service.dart';

String name = '';
String paword = '';
PageController controller = PageController();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();

    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -124,
              top: -91,
              child: Container(
                width: 428,
                height: 374,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.43, -0.90),
                    end: Alignment(0.43, 0.9),
                    colors: [Color(0xFFF3BD6B), Color(0xFFDA8BD9)],
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 46,
              top: -13,
              child: Container(
                width: 258,
                height: 258,
                decoration: ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 2, color: Color(0xFFA05674)),
                  ),
                ),
              ),
            ),
            Positioned(left: -15, top: -7, child: gradiantCircle(110, 110)),
            Positioned(
              left: 47.85,
              top: 132,
              child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(0.67),
                  child: gradiantCircle(41.78, 41.78)),
            ),
            Positioned(
              left: 251.85,
              top: 31,
              child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(0.67),
                  child: gradiantCircle(20, 20)),
            ),
            Positioned(
              left: 130,
              top: 103,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Color(0xFF914576),
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 329,
              child: Container(
                width: 287,
                height: 59,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 414,
              child: Container(
                width: 287,
                height: 59,
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 499,
              child: InkWell(
                onTap: () async => {
                  name = username.text,
                  paword = password.text,
                  if (name == "" || paword == "")
                    {}
                  else
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(),
                        ),
                      )
                    }
                },
                child: Container(
                  width: 287,
                  height: 59,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(1.00, -0.00),
                      end: Alignment(-1, 0),
                      colors: [Color(0xFFDA8BD9), Color(0xFFF3BD6B)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 389.67,
              top: 734.23,
              child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(2.94),
                  child: gradiantCircle(135, 135)),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: QuestionServiceImp().getAllQuestion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            dynamic temp = snapshot.data;

            List<QuestionModel> data = temp as List<QuestionModel>;

            print(temp);
            if (temp.isEmpty) {
              return Center(
                child: Text('Empty'),
              );
            } else {
              return PageView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Scaffold(
                  body: Column(
                    children: [
                      Text(data[index].question),
                      SizedBox(
                        height: 500,
                        child: ListView.separated(
                            itemBuilder: (context, ind) => ListTile(
                              onTap: (){
                                
                              },
                                  title: Text(data[index].answers[ind].answer),
                                ),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: data[index].answers.length),
                      )
                    ],
                  ),
                ),
              );
            }
          } else {
            print(snapshot.error);
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
