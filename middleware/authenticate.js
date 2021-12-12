const jwt = require ('jsonwebtoken')
const  cookieParser =require("cookie-parser")
const authenticate = (req, res, next) => {
  


    try {
        const token = req.cookies.JWT;

const decode = jwt.verify(token, 'AzerTy,5()')
req.user = decode
console.log(req.user.role)
next()
    }
    catch(error)
    {
        res.json({
            message :'Authentication failed!'
        })
    }
}
const authenticateByAdmin = (req, res, next) => {
  
    console.log(req.cookies.token)

    
        try {
            const Role = req.cookies.Role;
            const token = req.cookies.JWT;
           const decode = jwt.verify(token, 'AzerTy,5()')

    if ((Role =="Admin") || (Role == "admin"))
    {        

          req.user = decode
    next() 
    }
    else {
        res.json({
            message :'Admin Authentication failed!'
        })
    }
 
        }
        catch(error)
        {
            res.json({
                message :'Admin Authentication failed!'
            })
        }
    }
    const authenticateByStudent = (req, res, next) => {
  
   
            try {   
                  const token = req.cookies.JWT;
                  const Role = req.cookies.Role;


        const decode = jwt.verify(token, 'AzerTy,5()')
    
        if ((Role =="Student") || (Role == "student"))
        {
              req.user = decode
        next() 
        }
        else {
            res.json({
                message :'Student Authentication failed!'
            })
        }
     
            }
            catch(error)
            {
                res.json({
                    message :'Student Authentication failed due to error!'
                })
            }
        }

 const checkUser = (req, res, next) =>{
    const UserID = req.cookies.UserID;
    User.findById(userID)
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
    module.exports = {authenticate, authenticateByAdmin, authenticateByStudent} 