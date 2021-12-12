var mongoose=require('mongoose')
var Schema =mongoose.Schema

var lvl4schema = new mongoose.Schema({
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

const lvl4 =mongoose.model("lvl4",lvl4schema)
module.exports = lvl4