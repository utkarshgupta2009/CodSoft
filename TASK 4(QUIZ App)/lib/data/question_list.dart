import 'package:quizzy/model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel('1', "WHAT IS 2+2?", {
    "2": false,
    "3": false,
    "4": true,
    "5": false,
  }),
  QuestionModel('1', "WHAT IS 5X10?", {
    "55": false,
    "50": true,
    "70": false,
    "40": false,
  }),
  QuestionModel('1', "WHAT IS 105-20?", {
    "80": false,
    "90": false,
    "100": false,
    "85": true,
  }),
  QuestionModel('1', "WHAT IS 27/3?", {
    "3": false,
    "9": true,
    "6": false,
    "15": false,
  }),
  QuestionModel('1', "WHAT IS 21-5?", {
    "15": false,
    "20": false,
    "12": false,
    "16": true,
  }),
  QuestionModel('2', "___ HAS 8 LEGS", {
    "OCTOPUS": true,
    "FROG": false,
    "LION": false,
    "DOG": false,
  }),
  QuestionModel('2', "___ BARKS", {
    "DOG": true,
    "CAT": false,
    "RABBIT": false,
    "CHEETAH": false,
  }),
  QuestionModel('2', "WHICH OF THESE PRODUCE HONEY?", {
    "ANT": false,
    "BEES": true,
    "SPIDER": false,
    "GRASSHOPER": false,
  }),
  QuestionModel('2', "WHICH OF THESE RUNS FASTER?", {
    "LION": false,
    "BEAR": false,
    "WOLF": false,
    "CHEETAH": true,
  }),
  QuestionModel('2', "WHICH IS THE TALLEST ANIMAL IN THE WORLD", {
    "LION": false,
    "WHALE": false,
    "GIRAFFE": true,
    "CHEETAH": false,
  }),
  QuestionModel('3', '____ IS THE HOLDER OF SUDARSHAN CHAKRA', {
    "VISHNU JI": true,
    "SHIV JI": false,
    "BRAHMDEV JI": false,
    "HANUMAN JI": false,
  }),
  QuestionModel('3', '____ HAS WRITTEN HANUMAN CHALISA', {
    "TULSIDAS JI": true,
    "SHIV JI": false,
    "RAVIDAS JI": false,
    "HANUMAN JI": false,
  }),
  QuestionModel('3', '____ HAS THREE EYES', {
    "VISHNU JI": false,
    "SAI NATH": false,
    "SHIV JI": true,
    "BRAHMDEV JI": false,
  }),
  QuestionModel('3', 'NAVRATRE IS CELEBRATED FOR ___ DAYS', {
    "10": false,
    "1": false,
    "11": false,
    "9": true,
  }),
  QuestionModel('3', 'KRISHNA JI PLAYS WHICH INSTRUMENT?', {
    "FLUTE": true,
    "TABLA": false,
    "DHOL": false,
    "HARMONIUM": false,
  }),
];
