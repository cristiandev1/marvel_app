import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/modules/home/domain/entities/character.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeStateLoading extends HomeState {}

class HomeStateFailure extends HomeState {
  final String message;

  HomeStateFailure({@required this.message = ''});
}

class HomeStateSuccess extends HomeState {
  final List<Character>? characters;

  HomeStateSuccess({@required this.characters});
}
