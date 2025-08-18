import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_course/features/login/data/models/login_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/login_repo.dart';
import 'login_state.dart' hide Success, Failure;

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  Future<void> login(LoginRequestBody requestBody) async {
    emit(LoginState.loading());
    final result = await _loginRepo.login(requestBody);
    switch (result) {
      case Success<LoginResponse>():
        emit(LoginState.success(result.data));
      case Failure<LoginResponse>():
        emit(
          LoginState.error(
            errMsg: result.errorHandler.apiErrorModel.message ?? "",
          ),
        );
    }
  }
}
