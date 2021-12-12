var mongoose=require('mongoose')
var schema =mongoose.Schema

var paiementschema = new mongoose.Schema({
        iduser :{
                type:Number
        },
        email :{
                type:String
        },
        typecard : {
                type:String
        },
        cardinfo : {
                type:Number
        },
        dateexp: {
                type:String
        },
        cvc : {
                type:Number
        } 



},{timestamps: true})

const paiment =mongoose.model("paiment",paiementschema)
module.exports = paiment