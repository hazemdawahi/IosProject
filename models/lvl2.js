var mongoose=require('mongoose')
var Schema =mongoose.Schema

var lvl2schema = new mongoose.Schema({
        iduser : {
                type : String
        },
        question1 :  {
                type : String
        },
        answer1 :  {
                type : String
        },
        question2 : {
                type : String
        },
        answer2:  {
                type : String
        },
        question3 : {
                type : String
        },
        answer3 : {
                type : String
        },
        
        question4 : {
                type : String
        },
        answer4 : {
                type : String
        },
        question5 : {
                type : String
        },
        answer5 : {
                type : String
        },
        question6 : {
                type : String
        },
        answer6 : {
                type : String
        },
        question7 : {
                type : String
        },
        answer7 : {
                type : String
        },
        question8 : {
                type : String
        },
        answer8 : {
                type : String
        },
        question9 : {
                type : String
        },
        answer9 : {
                type : String
        },
        question10 : {
                type : String
        },
        answer10 : {
                type : String
        },
       nbrstore:{
                type : Number
        }






},{timestamps: true})

const lvl2 =mongoose.model("lvl2",lvl2schema)
module.exports = lvl2