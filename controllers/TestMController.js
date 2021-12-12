var score=0;
var i=1;
var y=1;
const TestM = require('../models/TestM')
const index = (req, res, next) => {
    TestM.find()
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
    let testMID = req.body.testMID
    TestM.findById(testMID)
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
    let testM = new TestM({
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
        answerr5: req.body.answer5,
        question6: req.body.question6,
        answer6: req.body.answer6

    })
    testM.save()
   .then(response => 
    {
        res.json({
            message:'test intermidiaire Added Successfully'
        })

    })
    .catch(error => {
        res.json({
            message:'An error Occured!'
        })
    })
   
}
const update = (req, res, next) => {
    let testMID = req.body.testMID

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
        answerr5: req.body.answer5,
        question6: req.body.question6,
        answer6: req.body.answer6
    }
    TestM.findByIdAndUpdate(testMID, {$set: updatedData})
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
const pass =(req,res,next)=>{
    if (score >50)
    {
        res.json({
            message:"yes"
        })
    }

    else
    {

    
        res.json({
message:"no"
        })
    }
}
const destroy =(req, res, next) =>{
    let testMID = req.body.testMID
    TestM.findByIdAndRemove(testMID)
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
if(i<=6)
{
TestM.find()
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
    if(y<=6)
    {
 TestM.find()
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