const User  = require ('../models/user')
const bcrypt = require('bcryptjs')
const jwt = require ('jsonwebtoken')
const _ = require('lodash')
const cookieParser =require("cookie-parser")
const mailgun = require("mailgun-js");
const apikeyM= '34ccf09a2bc584acb451624dfbc1e395-7dcc6512-c3076c7f'
const DOMAIN = 'sandbox33e599ece7054b75a84fb873fd9227fc.mailgun.org';
const mg = mailgun({apiKey:apikeyM , domain: DOMAIN});
const register = (req, res, next) => {



    bcrypt.hash(req.body.password, 10, function (err, hashedpass){

    if (err) 
    {
        res.json ({
       
            error: err
        })
          
        }
        let user = new User({
            name: req.body.name,
            email: req.body.email,
            password: hashedpass,
            date: req.body.date,
            niveau: req.body.niveau,
            langue: req.body.langue
    
        })
        if (req.file){
            user.avatar = req.file.path
        }
        user.Fullaccess = false;
        user.progress = 1;
        user.nbrvie = 10 ;
        user.role  = "Student"
        user.save()
       .then(user => 
        {
            res.status(200).json({
                message: 'user Added Successfully'
            })
    
        })
        .catch(error => {
            res.status(900).json({
                message: 'An error Occured!'
            })
        })

      
})
}
const login = (req, res, next) => {
    var username = req.body.username
    var password = req.body.password 

    User.findOne({ $or: [{ email:username}]})
    .then(user => {
        if (user){
            bcrypt.compare(password, user.password, function(err, result)
            {
              if (err)
              {
                  res.json({
                      error: err
                  })
              } 
              if (result)
              {            

                  let token = jwt.sign({name: user.name}, 'AzerTy,5()',{expiresIn: '1h'})   
                     user.token = token
                     user.save()

                  res.cookie("JWT",token,{
                   httpOnly:true,

                  });
                   
                  res.cookie("Role", user.role);
                  res.cookie("UserID",user.id);
                  res.cookie("langue",user.langue);
                  var name = user.name
                  var email = user.email
                  var role=user.role
                  var password= user.password
                  var date = user.date
                  var niveau  = user.niveau
                  var langue = user.langue
                  var id = user._id
                  var nbrvie = user.nbrvie
                  res.json({
                      id,
                     name,
                     email,
                     role,
                     password,
                     date,
                     niveau,
                     langue,
                      token,
                      nbrvie
                  })

              }else{
                  res.json({
                      message:'Password does not Match!'
                  })
              }
            
        })
    }else{
            res.json({
                message:'No user found'
            })
        }
    })
}

const logout = (req, res) => {
    res.cookie('JWT','');
    res.cookie('Role','');
    res.cookie('Email','');
    res.cookie('UserID','');
    res.cookie('token','');
    res.cookie('langue','');

    

 res.json ({
     message:"Successfully logout!"
 })
}
const forgot_password =(req, res) =>{

    const {email} = req.body; 

  User.findOne({email}, (err, user) =>{

    if(err || !user){
        
        return res.status(400).json({error: "User with this email does not exists."});

    }
    const token = jwt.sign({_id: user._id}, 'AzerTy,5()', {expiresIn: '20m'});
    res.cookie("resettoken",token);

    const data = {

        from:'noreplay@hello.com',
        to: email,
        subject:'password Reset link',
        html:`  
        <h2>Please click on given link to reset your password</h2>
        <p>http://localhost:3000/resetpassword/${token}</p> 
        `
    };
    return user.updateOne({resetLink: token},function(err, success){
        if (err) {
            return res.status(400).json({error: "reset password link error"});
        }
        else
        {
mg.messages().send(data, function(error, body ){

    if(error) {
        return res.json({

            error:  error.message
        })
    }
        return res.json({message: 'email has been sent'});


});
        }
    })

  })
}
const reset_password =(req, res) =>{

    const {newPass} = req.body;
    resetLink = req.cookies.resettoken;
    if (resetLink) {
console.log(resetLink);

        jwt.verify(resetLink, 'AzerTy,5()', function(error, decodedData) {
            
if(error) {
    console.log(error)
    return res.status(401).json({
        error: "Incorrect token or it is expired.",
        message:  error.message
   
    })
}
User.findOne({resetLink}, (err, user)=> {
if(err || !user)
{
    return res.status(400).json({error:"User with this token does not exist."});
}
bcrypt.hash(newPass, 10, function (err, hashedpass){

const obj ={

    password: hashedpass,
    resetLink:''
}

res.cookie('resettoken','');

user = _.extend(user, obj);
user.save((err,result)=>{
    if (err) {
        return res.status(400).json({error: "reset password  error"});
    }
    else
    {


    return res.status(200).json({message: 'Your password has been changed'});

    }

})
})

})
})
    }
     else{

    return res.status(401).json({error: "Authentication error!!!!"});

    }
}


module.exports = {
    register, login, logout, forgot_password, reset_password
}