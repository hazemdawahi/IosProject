var mongoose=require('mongoose')
var schema =mongoose.Schema

var reclamationschema = new mongoose.Schema({
        iduser : {
                type:Number
        },
        dateR : {
                type:String
        },
        typeR : {
                type:String
        },
        statusR :{
                type:Boolean
        },
        dateRF: {
                type:String
        } 



},{timestamps: true})

const reclamation =mongoose.model("reclamation",reclamationschema)
module.exports = reclamation