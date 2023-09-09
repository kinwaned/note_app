import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'notes_state_authentication.dart';

class AuthNotesCubit extends Cubit<AuthNotesState> {
  AuthNotesCubit() : super(NotesInitial());
  final passwordController = TextEditingController();

  final emailController = TextEditingController();



  Future signIn() async {
    emit(NotesLoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      emit(NotesLoginSuccess());
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found'){
        emit(NotesLoginFailure(errMessage: 'User not found!'));
      }else if(e.code == 'wrong-password'){
        emit(NotesLoginFailure(errMessage: 'Wrong password!'));
      }

    }catch (e){
      emit(NotesLoginFailure(errMessage: 'There was an error, Please try again!'));
    }
  }

  Future<void> signUp({required String email, required  String password}) async {
    emit(NotesRegisterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(NotesRegisterSuccess());
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password'){
        emit(NotesRegisterFailure(errMessage: 'Weak password!'));
      }else if(e.code == 'email-already-in-use'){
        emit(NotesRegisterFailure(errMessage: 'Email already in use!'));
      }

    }catch (e){
      emit(NotesRegisterFailure(errMessage: 'There was an error, Please try again!'));
    }
  }
}
