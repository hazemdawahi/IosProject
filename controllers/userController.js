const bcrypt = require('bcryptjs')

const User = require('../models/user')
const emailValidator = require('email-validator')
const index = (req, res, next) => {
    User.find()
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
    let userID = req.body.userID
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
const store = (req, res, next) => {
    let user = new User({
        name: req.body.name,
        email: req.body.email,
        password: req.body.password,
        role: req.body.role,
        date: req.body.date,
        niveau: req.body.niveau,
        langue: req.body.langue

    })
    if(emailValidator.validate(user.email))
    {
    user.save()
   .then(response => 
    {
        res.json({
            message:'user Added Successfully'
        })

    })
    .catch(error => {
        res.json({
            message:'An error Occured!'
        })
    })
   
}
else
{
    res.json({
        message:'wrong email adresse'
    })
}
}

const update = (req, res, next) => {
    let userID = req.body.userID
    bcrypt.hash(req.body.password, 10, function (err, hashedpass){
    let updatedData = {
        name: req.body.name,
        email: req.body.email,
        password: hashedpass,
        role: req.body.role,
        date: req.body.date,
        niveau: req.body.niveau,
        langue: req.body.langue,
        Fullaccess:req.body.access

    }
    if(emailValidator.validate(updatedData.email))
    {
    User.findByIdAndUpdate(userID, {$set: updatedData})
    .then(() => {
        res.json({
            message:'User updated successfully!'
        })
    })
.catch(error => {
    res.json({
        message:'An error Occured!'
    })
})
    }  
    else
{
    res.json({
        message:'wrong email adresse'
    })
} 
})

}
const destroy =(req, res, next) =>{
    let userID = req.body.userID
    User.findByIdAndRemove(userID)
    .then(() => {
        res.json({
            message:'User deleted successfully!'
        })
    })
    .catch (error => {
        res.json({
            messaage:'An error Occured'
        })
    })
}
const getID = (req, res, next) =>{
    const UserID = req.cookies.UserID;
    User.findById(UserID)
    .then(response => {
        var obj = JSON.stringify(response);
        var objectValue = JSON.parse(obj);
        var id = response._id;
        res.json({
            id
        })
    })
    .catch(error => {
        res.json({
                   message: 'An error Occured'
    
        })
    })
        }
        const GetAccess = (req, res, next) =>{
            const UserID = req.cookies.UserID;
            User.findById(UserID)
            .then(response => {
                var obj = JSON.stringify(response);
        var objectValue = JSON.parse(obj);
        var Access=response.Fullaccess
                res.json({
                    Access
                })
            })
            .catch(error => {
                res.json({
                           message: 'An error Occured'
            
                })
            })
                }
                
const checkUser = (req, res, next) =>{
    const UserID = req.cookies.UserID;
    User.findById(UserID)
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
        const changeAcces = (req, res, next) =>{
            const UserID = req.cookies.UserID;

          var A = "true"
                let updatedData = {
                 
                    Fullaccess:A
            
                }
                User.findByIdAndUpdate(UserID, {$set: updatedData})
                .then(() => {
                    res.json({
                        message:'Access changed Successfully!'
                    })
                })
            .catch(error => {
                res.json({
                    message:'An error Occured!'
                })
            })        

                
        
                }
const search =(req, res, next ) => {

    var regex = new RegExp(req.body.name,'i');
    User.find({name:regex}).then((result)=>{
        res.status(200).json(result)
    })
    
    }


    const GetNiveau = (req, res, next) =>{
        const UserID = req.cookies.UserID;
        User.findById(UserID)
        .then(response => {
            var obj = JSON.stringify(response);
    var objectValue = JSON.parse(obj);
    var Niveau=response.niveau
            res.json({
                Niveau
            })
        })
        .catch(error => {
            res.json({
                       message: 'An error Occured'
        
            })
        })
            }
            

            const GetWhere= (req, res, next) =>{
                const UserID = req.cookies.UserID;
                User.findById(UserID)
                .then(response => {
                    var obj = JSON.stringify(response);
            var objectValue = JSON.parse(obj);
            var Where=response.where
                    res.json({
                        Where
                    })
                })
                .catch(error => {
                    res.json({
                               message: 'An error Occured'
                
                    })
                })
                    }

                    const changeWhere2 = (req, res, next) =>{
                        const UserID = req.cookies.UserID;
            
                      var A = 2
                            let updatedData = {
                             
                                where:A
                        
                            }
                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                            .then(() => {
                                res.json({
                                    message:'Where changed to 2'
                                })
                            })
                        .catch(error => {
                            res.json({
                                message:'An error Occured!'
                            })
                        })        
            
                            
                    
                            }




                            const changeWhere3 = (req, res, next) =>{
                                const UserID = req.cookies.UserID;
                    
                              var A = 3
                                    let updatedData = {
                                     
                                        where:A
                                
                                    }
                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                    .then(() => {
                                        res.json({
                                            message:'where changed to 3!'
                                        })
                                    })
                                .catch(error => {
                                    res.json({
                                        message:'An error Occured!'
                                    })
                                })        
                    
                                    
                            
                                    }

                                    const changeWhere4 = (req, res, next) =>{
                                        const UserID = req.cookies.UserID;
                            
                                      var A = 4
                                            let updatedData = {
                                             
                                                where:A
                                        
                                            }
                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                            .then(() => {
                                                res.json({
                                                    message:'where changed to 4!'
                                                })
                                            })
                                        .catch(error => {
                                            res.json({
                                                message:'An error Occured!'
                                            })
                                        })        
                            
                                            
                                    
                                            }
                                            const changeWhere5 = (req, res, next) =>{
                                                const UserID = req.cookies.UserID;
                                    
                                              var A = 5
                                                    let updatedData = {
                                                     
                                                        where:A
                                                
                                                    }
                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                    .then(() => {
                                                        res.json({
                                                            message:'where changed to 5!'
                                                        })
                                                    })
                                                .catch(error => {
                                                    res.json({
                                                        message:'An error Occured!'
                                                    })
                                                })        
                                    
                                                    
                                            
                                                    }
                                                    const changeWhere6 = (req, res, next) =>{
                                                        const UserID = req.cookies.UserID;
                                            
                                                      var A = 6
                                                            let updatedData = {
                                                             
                                                                where:A
                                                        
                                                            }
                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                            .then(() => {
                                                                res.json({
                                                                    message:'where changed to 6!'
                                                                })
                                                            })
                                                        .catch(error => {
                                                            res.json({
                                                                message:'An error Occured!'
                                                            })
                                                        })        
                                            
                                                            
                                                    
                                                            }
        

                                                            const changeWhere7 = (req, res, next) =>{
                                                                const UserID = req.cookies.UserID;
                                                    
                                                              var A = 7
                                                                    let updatedData = {
                                                                     
                                                                        where:A
                                                                
                                                                    }
                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                    .then(() => {
                                                                        res.json({
                                                                            message:'where changed to 7!'
                                                                        })
                                                                    })
                                                                .catch(error => {
                                                                    res.json({
                                                                        message:'An error Occured!'
                                                                    })
                                                                })        
                                                    
                                                                    
                                                            
                                                                    }
                

                                                                    const changeWhere8 = (req, res, next) =>{
                                                                        const UserID = req.cookies.UserID;
                                                            
                                                                      var A = 8
                                                                            let updatedData = {
                                                                             
                                                                                where:A
                                                                        
                                                                            }
                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                            .then(() => {
                                                                                res.json({
                                                                                    message:'where changed to 8!'
                                                                                })
                                                                            })
                                                                        .catch(error => {
                                                                            res.json({
                                                                                message:'An error Occured!'
                                                                            })
                                                                        })        
                                                            
                                                                            
                                                                    
                                                                            }
                                                                            const changeWhere9 = (req, res, next) =>{
                                                                                const UserID = req.cookies.UserID;
                                                                    
                                                                              var A = 9
                                                                                    let updatedData = {
                                                                                     
                                                                                        where:A
                                                                                
                                                                                    }
                                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                    .then(() => {
                                                                                        res.json({
                                                                                            message:'where changed to 9!'
                                                                                        })
                                                                                    })
                                                                                .catch(error => {
                                                                                    res.json({
                                                                                        message:'An error Occured!'
                                                                                    })
                                                                                })        
                                                                    
                                                                                    
                                                                            
                                                                                    }
                                                                            
                                                    
                                                                            const GetProgress= (req, res, next) =>{
                                                                                const UserID = req.cookies.UserID;
                                                                                User.findById(UserID)
                                                                                .then(response => {
                                                                                    var obj = JSON.stringify(response);
                                                                            var objectValue = JSON.parse(obj);
                                                                            var Progress=response.progress
                                                                                    res.json({
                                                                                        Progress
                                                                                    })
                                                                                })
                                                                                .catch(error => {
                                                                                    res.json({
                                                                                               message: 'An error Occured'
                                                                                
                                                                                    })
                                                                                })
                                                                                    }
                                                                                    const changeprogress2 = (req, res, next) =>{
                                                                                        const UserID = req.cookies.UserID;
                                                                            
                                                                                      var A = 2
                                                                                            let updatedData = {
                                                                                             
                                                                                                progress:2
                                                                                        
                                                                                            }
                                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                            .then(() => {
                                                                                                res.json({
                                                                                                    message:'progress changed to 2!'
                                                                                                })
                                                                                            })
                                                                                        .catch(error => {
                                                                                            res.json({
                                                                                                message:'An error Occured!'
                                                                                            })
                                                                                        })        
                                                                            
                                                                                            
                                                                                    
                                                                                            }
                                                                                            const changeprogress3 = (req, res, next) =>{
                                                                                                const UserID = req.cookies.UserID;
                                                                                    
                                                                                              var A = 3
                                                                                                    let updatedData = {
                                                                                                     
                                                                                                        progress:3
                                                                                                
                                                                                                    }
                                                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                    .then(() => {
                                                                                                        res.json({
                                                                                                            message:'progress changed to 3!'
                                                                                                        })
                                                                                                    })
                                                                                                .catch(error => {
                                                                                                    res.json({
                                                                                                        message:'An error Occured!'
                                                                                                    })
                                                                                                })        
                                                                                    
                                                                                                    
                                                                                            
                                                                                                    }
                                                                                                    const changeprogress4 = (req, res, next) =>{
                                                                                                        const UserID = req.cookies.UserID;
                                                                                            
                                                                                                      var A = 4
                                                                                                            let updatedData = {
                                                                                                             
                                                                                                                progress:4
                                                                                                        
                                                                                                            }
                                                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                            .then(() => {
                                                                                                                res.json({
                                                                                                                    message:'progress changed to 4!'
                                                                                                                })
                                                                                                            })
                                                                                                        .catch(error => {
                                                                                                            res.json({
                                                                                                                message:'An error Occured!'
                                                                                                            })
                                                                                                        })        
                                                                                            
                                                                                                            
                                                                                                    
                                                                                                            }
                                                                                                            const changeprogress5 = (req, res, next) =>{
                                                                                                                const UserID = req.cookies.UserID;
                                                                                                    
                                                                                                              var A = 5
                                                                                                                    let updatedData = {
                                                                                                                     
                                                                                                                        progress:5
                                                                                                                
                                                                                                                    }
                                                                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                    .then(() => {
                                                                                                                        res.json({
                                                                                                                            message:'progress changed to 5!'
                                                                                                                        })
                                                                                                                    })
                                                                                                                .catch(error => {
                                                                                                                    res.json({
                                                                                                                        message:'An error Occured!'
                                                                                                                    })
                                                                                                                })        
                                                                                                    
                                                                                                                    
                                                                                                            
                                                                                                                    }
                                                                                                                    const changeprogress6 = (req, res, next) =>{
                                                                                                                        const UserID = req.cookies.UserID;
                                                                                                            
                                                                                                                      var A = 6
                                                                                                                            let updatedData = {
                                                                                                                             
                                                                                                                                progress:6
                                                                                                                        
                                                                                                                            }
                                                                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                            .then(() => {
                                                                                                                                res.json({
                                                                                                                                    message:'progress changed to 6!'
                                                                                                                                })
                                                                                                                            })
                                                                                                                        .catch(error => {
                                                                                                                            res.json({
                                                                                                                                message:'An error Occured!'
                                                                                                                            })
                                                                                                                        })        
                                                                                                            
                                                                                                                            
                                                                                                                    
                                                                                                                            }
                                                                                                                            const changeprogress7 = (req, res, next) =>{
                                                                                                                                const UserID = req.cookies.UserID;
                                                                                                                    
                                                                                                                              var A = 7
                                                                                                                                    let updatedData = {
                                                                                                                                     
                                                                                                                                        progress:7
                                                                                                                                
                                                                                                                                    }
                                                                                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                    .then(() => {
                                                                                                                                        res.json({
                                                                                                                                            message:'progress changed to 7!'
                                                                                                                                        })
                                                                                                                                    })
                                                                                                                                .catch(error => {
                                                                                                                                    res.json({
                                                                                                                                        message:'An error Occured!'
                                                                                                                                    })
                                                                                                                                })        
                                                                                                                    
                                                                                                                                    
                                                                                                                            
                                                                                                                                    }
                                                                                                                                    const changeprogress8 = (req, res, next) =>{
                                                                                                                                        const UserID = req.cookies.UserID;
                                                                                                                            
                                                                                                                                      var A = 8
                                                                                                                                            let updatedData = {
                                                                                                                                             
                                                                                                                                                progress:8
                                                                                                                                        
                                                                                                                                            }
                                                                                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                            .then(() => {
                                                                                                                                                res.json({
                                                                                                                                                    message:'progress changed to 8!'
                                                                                                                                                })
                                                                                                                                            })
                                                                                                                                        .catch(error => {
                                                                                                                                            res.json({
                                                                                                                                                message:'An error Occured!'
                                                                                                                                            })
                                                                                                                                        })        
                                                                                                                            
                                                                                                                                            
                                                                                                                                    
                                                                                                                                            }
                                                                                                                                            const changeprogress9 = (req, res, next) =>{
                                                                                                                                                const UserID = req.cookies.UserID;
                                                                                                                                    
                                                                                                                                              var A = 9
                                                                                                                                                    let updatedData = {
                                                                                                                                                     
                                                                                                                                                        progress:9
                                                                                                                                                
                                                                                                                                                    }
                                                                                                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                                    .then(() => {
                                                                                                                                                        res.json({
                                                                                                                                                            message:'progress changed to 9!'
                                                                                                                                                        })
                                                                                                                                                    })
                                                                                                                                                .catch(error => {
                                                                                                                                                    res.json({
                                                                                                                                                        message:'An error Occured!'
                                                                                                                                                    })
                                                                                                                                                })        
                                                                                                                                    
                                                                                                                                                    
                                                                                                                                            
                                                                                                                                                    }
                                                                                                                                               const Getvie= (req, res, next) =>{
                                                                                                                                                const UserID = req.cookies.UserID;
                                                                                                                                                User.findById(UserID)
                                                                                                                                                .then(response => {
                                                                                                                                                    var obj = JSON.stringify(response);
                                                                                                                                            var objectValue = JSON.parse(obj);
                                                                                                                                            var Vie=response.nbrvie
                                                                                                                                                    res.json({
                                                                                                                                                     Vie
                                                                                                                                                    })
                                                                                                                                                })
                                                                                                                                                .catch(error => {
                                                                                                                                                    res.json({
                                                                                                                                                               message: 'An error Occured'
                                                                                                                                                
                                                                                                                                                    })
                                                                                                                                                })
                                                                                                                                                    }
                                                                                                                                                    const changevieminus = (req, res, next) =>{
                                                                                                                                                 
                                                                                                                                            
                                                                                                                                                        const UserID = req.cookies.UserID;
                                                                                                                                                User.findById(UserID)
                                                                                                                                                .then(response => {
                                                                                                                                                    var obj = JSON.stringify(response);
                                                                                                                                            var objectValue = JSON.parse(obj);
                                                                                                                                            var Vie=response.nbrvie

                                                                                                                                                      var A = Vie - 1;
                                                                                                                                                            let updatedData = {
                                                                                                                                                             
                                                                                                                                                                nbrvie:A
                                                                                                                                                        
                                                                                                                                                            }
                                                                                                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                                            .then(() => {
                                                                                                                                                                res.json({
                                                                                                                                                                    message:'vie - 1 '
                                                                                                                                                                })
                                                                                                                                                            })
                                                                                                                                                        .catch(error => {
                                                                                                                                                            res.json({
                                                                                                                                                                message:'An error Occured!'
                                                                                                                                                            })
                                                                                                                                                        })        
                                                                                                                                                    })
                                                                                                                                                            
                                                                                                                                                    
                                                                                                                                                            }
                                                                                                                                                            const changevieplus = (req, res, next) =>{
                                                                                                                                                 
                                                                                                                                            
                                                                                                                                                                const UserID = req.cookies.UserID;
                                                                                                                                                        User.findById(UserID)
                                                                                                                                                        .then(response => {
                                                                                                                                                            var obj = JSON.stringify(response);
                                                                                                                                                    var objectValue = JSON.parse(obj);
                                                                                                                                                    var Vie=response.nbrvie
        
                                                                                                                                                              var A = Vie + 1;
                                                                                                                                                                    let updatedData = {
                                                                                                                                                                     
                                                                                                                                                                        nbrvie:A
                                                                                                                                                                
                                                                                                                                                                    }
                                                                                                                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                                                    .then(() => {
                                                                                                                                                                        res.json({
                                                                                                                                                                            message:'vie + 1 '
                                                                                                                                                                        })
                                                                                                                                                                    })
                                                                                                                                                                .catch(error => {
                                                                                                                                                                    res.json({
                                                                                                                                                                        message:'An error Occured!'
                                                                                                                                                                    })
                                                                                                                                                                })        
                                                                                                                                                            })
                                                                                                                                                                    
                                                                                                                                                            
                                                                                                                                                                    }
                                                                                                                                                                    const changevie10 = (req, res, next) =>{
                                                                                                                                                 
                                                                                                                                            
                                                                                                                                                                        const UserID = req.cookies.UserID;
                                                                                                                                                                User.findById(UserID)
                                                                                                                                                                .then(response => {
                                                                                                                                                                    var obj = JSON.stringify(response);
                                                                                                                                                            var objectValue = JSON.parse(obj);
                                                                                                                                                            var Vie=response.nbrvie
                
                                                                                                                                                                      var A = Vie +10;
                                                                                                                                                                            let updatedData = {
                                                                                                                                                                             
                                                                                                                                                                                nbrvie:A
                                                                                                                                                                        
                                                                                                                                                                            }
                                                                                                                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                                                            .then(() => {
                                                                                                                                                                                res.json({
                                                                                                                                                                                    message:'vie +10'
                                                                                                                                                                                })
                                                                                                                                                                            })
                                                                                                                                                                        .catch(error => {
                                                                                                                                                                            res.json({
                                                                                                                                                                                message:'An error Occured!'
                                                                                                                                                                            })
                                                                                                                                                                        })        
                                                                                                                                                                    })
                                                                                                                                                                            
                                                                                                                                                                    
                                                                                                                                                                            }
                                                                                                                                                                            const changevie100 = (req, res, next) =>{
                                                                                                                                                 
                                                                                                                                            
                                                                                                                                                                                const UserID = req.cookies.UserID;
                                                                                                                                                                        User.findById(UserID)
                                                                                                                                                                        .then(response => {
                                                                                                                                                                            var obj = JSON.stringify(response);
                                                                                                                                                                    var objectValue = JSON.parse(obj);
                                                                                                                                                                    var Vie=response.nbrvie
                        
                                                                                                                                                                              var A = Vie +100;
                                                                                                                                                                                    let updatedData = {
                                                                                                                                                                                     
                                                                                                                                                                                        nbrvie:A
                                                                                                                                                                                
                                                                                                                                                                                    }
                                                                                                                                                                                    User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                                                                    .then(() => {
                                                                                                                                                                                        res.json({
                                                                                                                                                                                            message:'vie +100'
                                                                                                                                                                                        })
                                                                                                                                                                                    })
                                                                                                                                                                                .catch(error => {
                                                                                                                                                                                    res.json({
                                                                                                                                                                                        message:'An error Occured!'
                                                                                                                                                                                    })
                                                                                                                                                                                })        
                                                                                                                                                                            })
                                                                                                                                                                                    
                                                                                                                                                                            
                                                                                                                                                                                    }
                                                                                                                                                                                    const changevie1000 = (req, res, next) =>{
                                                                                                                                                 
                                                                                                                                            
                                                                                                                                                                                        const UserID = req.cookies.UserID;
                                                                                                                                                                                User.findById(UserID)
                                                                                                                                                                                .then(response => {
                                                                                                                                                                                    var obj = JSON.stringify(response);
                                                                                                                                                                            var objectValue = JSON.parse(obj);
                                                                                                                                                                            var Vie=response.nbrvie
                                
                                                                                                                                                                                      var A = Vie +1000;
                                                                                                                                                                                            let updatedData = {
                                                                                                                                                                                             
                                                                                                                                                                                                nbrvie:A
                                                                                                                                                                                        
                                                                                                                                                                                            }
                                                                                                                                                                                            User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                                                                            .then(() => {
                                                                                                                                                                                                res.json({
                                                                                                                                                                                                    message:'vie +1000'
                                                                                                                                                                                                })
                                                                                                                                                                                            })
                                                                                                                                                                                        .catch(error => {
                                                                                                                                                                                            res.json({
                                                                                                                                                                                                message:'An error Occured!'
                                                                                                                                                                                            })
                                                                                                                                                                                        })        
                                                                                                                                                                                    })
                                                                                                                                                                                            
                                                                                                                                                                                    
                                                                                                                                                                                            }
                                                                                                                                                                                            const changeviedate= (req, res, next) =>{
                                                                                                                                                 
                                                                                                                                            
                                                                                                                                                                                                const UserID = req.cookies.UserID;
                                                                                                                                                                                        User.findById(UserID)
                                                                                                                                                                                        .then(response => {
                                                                                                                                                                                            var obj = JSON.stringify(response);
                                                                                                                                                                                    var objectValue = JSON.parse(obj);
                                                                                                                                                                                    var dateR = new Date();
                                                                                                                                                                                     dateR=response.date;  
                                                                                                                                                                                
                                                                                                                                                                                     let ts = Date.now();

                                                                                                                                                                                     let date_ob = new Date(ts); 
                                                                                                                                                                                     let date = date_ob.getDate();
                                                                                                                                                                                     let dateRR = dateR.getDate();
                                                                                                                                                                                                                
                                                                                                                                                                                                        console.log(date)
                                                                                                                                                                                                        console.log(dateRR) 
                                                                                                                                                                                                        var x;
                                                                                                                                                                                                        x= Math.abs(dateRR - date) ; 
                                                                                                                                                                                                        var Vie=response.nbrvie;

                                

                                                                                                                                                                                                        var A = Vie +x;
                                                                                                                                                                                                        let updatedData = {
                                                                                                                                                                                                         
                                                                                                                                                                                                            nbrvie:A
                                                                                                                                                                                                    
                                                                                                                                                                                                        }
                                                                                                                                                                                                        User.findByIdAndUpdate(UserID, {$set: updatedData})
                                                                                                                                                                                                        .then(() => {
                                                                                                                                                                                                            res.json({
                                                                                                                                                                                                                x,
                                                                                                                                                                                                                message:'vie +x'
                                                                                                                                                                                                            })
                                                                                                                                                                                                        })
                                                                                                                                                                                                    .catch(error => {
                                                                                                                                                                                                        res.json({
                                                                                                                                                                                                            message:'An error Occured!'
                                                                                                                                                                                                        })
                                                                                                                                                                                                    })        

                                                                                                                                                                                            })
                                                                                                                                                                                            .catch(error => {
                                                                                                                                                                                                res.json({
                                                                                                                                                                                                    message:'An error Occured!'
                                                                                                                                                                                                })
                                                                                                                                                                                            }) 
                                                                                                                                                                                                    
                                                                                                                                                                                            
                                                                                                                                                                                                    }
                                                                                                                                                                                                    const Getvie0= (req, res, next) =>{
                                                                                                                                                                                                        const UserID = req.cookies.UserID;
                                                                                                                                                                                                        var x = 0
                                                                                                                                                                                                        User.findById(UserID)
                                                                                                                                                                                                        .then(response => {
                                                                                                                                                                                                            var obj = JSON.stringify(response);
                                                                                                                                                                                                    var objectValue = JSON.parse(obj);
                                                                                                                                                                                                    var Vie=response.nbrvie
                                                                                                                                                                                                
                                                                                                                                                                                                    if (Vie>0)
                                                                                                                                                                                                    {
                                                                                                                                                                                                        x=1;

                                                                                                                                                                                                    }
                                                                                                                                                                                                            res.json({
                                                                                                                                                                                                             x
                                                                                                                                                                                                            })
                                                                                                                                                                                                        })
                                                                                                                                                                                                        .catch(error => {
                                                                                                                                                                                                            res.json({
                                                                                                                                                                                                                       message: 'An error Occured'
                                                                                                                                                                                                        
                                                                                                                                                                                                            })
                                                                                                                                                                                                        })
                                                                                                                                                                                                            }
                                                                                                                                                                                    
                                                                                                                                                    
                                                                               
                                                                                                                                            
                                                                                                                                    
                                                                                                                            

module.exports = {
    index, show, store, update, destroy,checkUser, search,GetAccess,getID,changeAcces,GetNiveau,GetWhere,changeWhere2,changeWhere3,changeWhere4,changeWhere5,changeWhere6,changeWhere7,changeWhere8,GetProgress,changeprogress2,changeprogress3,changeprogress4,changeprogress5,changeprogress6,changeprogress7,changeprogress8,Getvie,changevie10,changevie100,changevie1000,changevieminus,changevieplus,changeviedate,Getvie0,changeprogress9,changeWhere9
}