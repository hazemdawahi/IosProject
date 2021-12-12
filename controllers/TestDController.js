const TestD = require('../models/TestD')
const cookieparser = require('cookie-parser')
const translate = require('@vitalets/google-translate-api');
var score=0;
var i=1;
var y=1;

const index = (req, res, next) => {
    TestD.find()
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
    let testDID = req.body.testDID
    TestD.findById(testDID)
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
    const useriden = req.cookies.UserID;

    let testD = new TestD({
        iduser: req.body.iduser,
        question1: req.body.question1,
        answer1: req.body.answer1,
        question2: req.body.question2,
        answer2: req.body.answer2,
        question3: req.body.question3,
        answer3: req.body.answer3

    })
    testD.iduser = useriden;
    testD.save()
   .then(response => 
    {
        res.json({
            message:'test debutant Added Successfully'
        })

    })
    .catch(error => {
        res.json({
            message:'An error Occured!'
        })
    })
   
}
const update = (req, res, next) => {
    let testDID = req.body.testDID

    let updatedData = {
        iduser: req.body.iduser,
        question1: req.body.question1,
        answer1: req.body.answer1,
        question2: req.body.question2,
        answer2: req.body.answer2,
        question3: req.body.question3,
        answer3: req.body.answer3
    }
    TestD.findByIdAndUpdate(testDID, {$set: updatedData})
    .then(() => {
        res.json({
            message:'test updated successfully!'
        })
    })
.catch(error => {
    res.json({
        message:'An error Occured!'
    })
})

}
const destroy =(req, res, next) =>{
    let testDID = req.body.testDID
    TestD.findByIdAndRemove(testDID)
    .then(() => {
        res.json({
            message:'test deleted successfully!'
        })
    })
    .catch (error => {
        res.json({
            messaage:'An error Occured'
        })
    })
}
const pass =(req,res,next)=>{
    if (score >50)
    {
        res.json({
            message:"yes"
        })
    }

    else
    (
        res.json({
message:"no"
        })
    )
}

const scoreFUN =(req,res,next)=>
{
    res.json({
        score
    })
}
const question = (req, res, next) =>
{
var question;
question="question"+i;
var Q1;
if(i<=3)
{
TestD.find()
.then(response => {
    var obj = JSON.stringify(response);
    var objectValue = JSON.parse(obj);
   
     Q1=objectValue[0][question];
 res.json({
     question:Q1
 })

})
.catch(error => {
    res.json({
        message: 'An error Occured!'
    })
})
i++;
}
else(
    res.json({
        message:'test terminated!!!'
    })
)

}
const answer =(req, res , next) =>
{
    const langue = req.cookies.langue;
    var useranswer = req.body.useranswer;
    var answer="answer"+y;
    var type;
    var A1;
    if(y<=3)
    {
    TestD.find()
    .then(response => {
        var obj = JSON.stringify(response);
        var objectValue = JSON.parse(obj);
        A1=objectValue[0][answer];
        translate(A1, {to: langue})  .then(RT1 => {

            translate(useranswer, {to: langue})  .then(RT2 => {

                console.log(RT1.text);
                console.log(RT2.text);

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
                    
                  
         A1=objectValue[0][answer];
     res.json({
             useranswer,
            
               type
     })
     y++;
    
    })


    .catch(error => {
        res.json({
            message: 'An error Occured!'
        })
    })
    })
})

}
else(
    res.json({
        message:'test terminated!!!'
    })
)
}
const evaluation= (req, res, next)=>
{
 var x= score;
if(score>=50)
{
    res.json({
message:"congratulation!!!! you  have passed the test !!!!",
score: x
    })

}
else
{
    res.json({
        message:"Ooopsss!!!! you failed redo it !!!!",
    x
            })
        
}
         
}

module.exports = {
    index, show, store, update, destroy,evaluation,question,answer,scoreFUN,pass
}