const Lvl2 = require('../models/lvl2')
const User = require('../models/user')
const translate = require('@vitalets/google-translate-api');
var score = 0;
var min=1;
var max=10;
var x=1;
var array = []; 
var Where=0;
var prog;
const  cookieParser =require("cookie-parser")


const nextr = (req,res,next) =>{
var UserID = req.cookies.UserID;
User.findById(UserID)
.then(response => {
    var obj = JSON.stringify(response);
var objectValue = JSON.parse(obj);
var Progress=response.progress
prog = Progress  

})
}
const index = (req, res, next) => {
    Lvl2.find()
    .then(response => {
        res.json({
            response
        })
    })
    .catch(error => {
        res.json({
            message: 'An error Occured!'
        })
    })
}
const show = (req, res, next) => {
    let coursMID = req.body.coursMID
    Lvl2.findById(lvlID)
    .then(response => {
        res.json({
            response
        })
    })
    .catch(error => {
        res.json({
                   message: 'An error Occured'
 
        })
    })
}
const store = (req, res, next) => {
    var t=10;

    const useriden = req.cookies.UserID;

    let lvl2 = new Lvl2({
        question1: req.body.question1,
        answer1: req.body.answer1,
        question2: req.body.question2,
        answer2: req.body.answer2,
        question3: req.body.question3,
        answer3: req.body.answer3,
        question4: req.body.question4,
        answer4: req.body.answer4,
        question5: req.body.question5,
        answer5: req.body.answer5,
        question6: req.body.question6,
        answer6: req.body.answer6,
        question7 : req.body.question7,
        answer7 : req.body.answer7,
        question8 : req.body.question8,
        answer8: req.body.answer8,
        question9: req.body.question9,
        answer9 : req.body.answer9,
        question10: req.body.question10,
        answer10 : req.body.answer10

    })
    lvl2.iduser = useriden;
    lvl2.nbrstore= t;
    lvl2.save()
   .then(response => 
    {
        res.json({
            message:'Lvl2 Added Successfully'
        })

    })
    .catch(error => {
        res.json({
            message:'An error Occured!'
        })
    })
   
}
const update = (req, res, next) => {
    let lvl2ID = req.body.lvlID

    let updatedData = {
        iduser: req.body.iduser,
        question1: req.body.question1,
        answer1: req.body.answer1,
        question2: req.body.question2,
        answer2: req.body.answer2,
        question3: req.body.question3,
        answer3: req.body.answer3,
        question4: req.body.question4,
        answer4: req.body.answer4,
        question5: req.body.question5,
        answer5: req.body.answer5,
        question6: req.body.question6,
        answer6: req.body.answer6,
        question7 : req.body.question7,
        answer7 : req.body.answer7,
        question8 : req.body.question8,
        answer8: req.body.answer8,
        question9: req.body.question9,
        answer9 : req.body.answer9,
        question10: req.body.question10,
        answer10 : req.body.answer10

    }
    Lvl2.findByIdAndUpdate(lvl2ID, {$set: updatedData})
    .then(() => {
        res.json({
            message:'Lvl2 updated successfully!'
        })
    })
.catch(error => {
    res.json({
        message:'An error Occured!'
    })
})

}
const destroy =(req, res, next) =>{
    let lvl2ID = req.body.lvlID
    Lvl2.findByIdAndRemove(lvl2ID)
    .then(() => {
        res.json({
            message:'Lvl2 deleted successfully!'
        })
    })
    .catch (error => {
        res.json({
            messaage:'An error Occured'
        })
    })
}
const pass=(req,res,next)=>
{
    Lvl2.find()
.then(response => {
    var obj = JSON.stringify(response);
    var objectValue = JSON.parse(obj);
    responseNbr=objectValue[0]['nbrstore'] ;

    if (!(responseNbr-array.length!=0))
    {
    if (score >=50)
    {
        Where  =1
      
        res.json({
            message:"yes"
        })
}
    
        else
        {
             score = 0;
             min=1;
             max=10;
             x=0;
             array = []; 
            
            res.json({
                message:"no"
            })
        }
        
    }
    else
    {
        res.json({
            message:"level is not terminated yet"
        })
    }
})
}

const scoreFUN =(req,res,next)=>
{
    res.json({
        score
    })
}
const question = (req, res, next) =>
{
    var UserID = req.cookies.UserID;

    var min=1;
var max=10;
if(array.length<10)
{
x= Math.floor(
    Math.random() * (max- min + 1) + min)

}

if ((responseNbr-array.length!=0)&&((array.length<10)))
{
    array.unshift(x);
if ((array.includes(x)))
{
var t;
t=x;
  do{
        x= Math.floor(
            Math.random() * (max- min + 1) + min)
    }  while((t==x)||(array.includes(x)))
    array.shift()
    t=x;
    array.unshift(t);

    
}
}


var question;
question="question"+x;
var Q1;
var responseNbr;
Lvl2.find()
.then(response => {
    var obj = JSON.stringify(response);
    var objectValue = JSON.parse(obj);
    responseNbr=objectValue[0]['nbrstore'] ;
console.log(prog)
     Q1=objectValue[0][question];
     var UserID = req.cookies.UserID;
User.findById(UserID)
.then(response => {
    var obj = JSON.stringify(response);
var objectValue = JSON.parse(obj);
var Progress=response.progress

     if ((responseNbr-array.length!=0)&&(Progress!=3))
     {
 res.json({
     question:Q1
 })
     }
     else
     {
        res.json({
            message:"congratulations,level terminated successfully you can move on the next level or Redo it !!!!"          
               })   
     }    
     
})
.catch(error => {
    res.json({
        message: 'An error Occured!'
    })
})

})

}
const answer =(req, res , next) =>
{    console.log("array")

    console.log(array)
    var UserID = req.cookies.UserID;

var responseNbr;
    const langue = req.cookies.langue;
    var useranswer = req.body.useranswer;
    var answer="answer"+x;
    var type;
    var A1;
    Lvl2.find()
    .then(response => {
        var obj = JSON.stringify(response);
        var objectValue = JSON.parse(obj);
        A1=objectValue[0][answer];
        responseNbr=objectValue[0]['nbrstore'] ;
        User.findById(UserID)
        .then(response => {
            var obj = JSON.stringify(response);
        var objectValue = JSON.parse(obj);
        var Progress=response.progress
        translate(A1, {to: langue})  .then(RT1 => {

            translate(useranswer, {to: langue})  .then(RT2 => {

                

                    if(RT2.text==RT1.text)
                      {
                      score=score+25;
                      type="your response was correct!!!!"
                      }
                      else
                      {
                          type ="you response was wrong!!!"
                          score= score-10;
                      }
                     
                      if ((responseNbr-array.length!=0)&&(Progress!=3))
                      {
                          res.json({
                         
                         type,
                         score
                       }) 
                      }
                      else
                      {
                         res.json({
                             message:"your score is ",
                             score,
                             message:"congratulations,level terminated successfully you can move on the next level or Redo it !!!!"          
                                })   
                      }        
        
    })
            })

  
})


 })
  .catch(error => {
        res.json({
            message: 'An error Occured!'
        })
    })
   
}




module.exports = {
    index, show, store, update, destroy, question, answer, scoreFUN,pass
}