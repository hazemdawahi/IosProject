var mongoose=require('mongoose')
var Schema =mongoose.Schema

var userschema = new mongoose.Schema({
        user_id:{
                type: mongoose.Schema.Types.ObjectId,
                ref:'user_id'
        },
        name : {
                type:String
        },
        email :{
                type: String
        },
        password : {
                type: String
        },
        role :{
                type: String
        },
       
        date: {
              type: Date,
              default : Date.now()  
        } ,
        niveau : {
                type: String
              
        } ,
        langue :{
                type: String
        },
        avatar :{
                type:String
        },
        resetLink:{
                data: String,
                default:''
        }
        ,
        nbrvie:{
                type: Number,
                default:''
        }
        ,
        where:{
                type: Number,
                default : 1
        }
        ,
        progress:{
                type: Number
            
        }
        ,
        Fullaccess:{
                data: String,
                default: ''
        }

},{timestamps: true})


const user =mongoose.model("user",userschema)
module.exports = user