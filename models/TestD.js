var mongoose=require('mongoose')
var schema =mongoose.Schema

var testDshema = new mongoose.Schema({
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
        answer2 :  {
                type : String
        },
     
        question3 : {
                type : String
        },
        answer3 : {
                type : String
        }
      
        





},{timestamps: true})

const testD =mongoose.model("testD",testDshema)
module.exports = testD