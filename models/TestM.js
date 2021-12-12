var mongoose=require('mongoose')
var schema =mongoose.Schema

var testMschema = new mongoose.Schema({
        iduser : {
                type:Number
        },
        question1 :  {
                type:String
        },
        answer1 :  {
                type:String
        },
        question2 : {
                type:String
        },
        answer2 :  {
                type:String
        },
        question3 : {
                type:String
        },
        answer3 : {
                type:String
        },
        question3 : {
                type:String
        },
        answer3 : {
                type:String
        },
        question4 : {
                type:String
        },
        answer4 : {
                type:String
        },
        question5 : {
                type:String
        },
        answer5 : {
                type:String
        },
        question6 : {
                type:String
        },
        answer6 : {
                type:String
        }
      
        





},{timestamps: true})

const TestM =mongoose.model("TestM",testMschema)
module.exports = TestM