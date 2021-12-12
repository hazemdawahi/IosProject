const Paiment = require('../models/paiment')
const index = (req, res, next) => {
    Paiment.find()
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
    let paimentID = req.body.paimentID
    Paiment.findById(paimentID)
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
    let paiment = new Paiment({
        iduser: req.body.iduser,
        email: req.body.email,
        typecard: req.body.typecard,
        cardinfo: req.body.cardinfo,
        dateexp: req.body.dateexp,
        cvc: req.body.cvc
    })
    paiment.save()
   .then(response => 
    {
        res.json({
            message:'payments Added Successfully'
        })

    })
    .catch(error => {
        res.json({
            message:'An error Occured!'
        })
    })
   
}
const update = (req, res, next) => {
    let paimentID = req.body.paimentID

    let updatedData = {
        iduser: req.body.iduser,
        dateR: req.body.dateR,
        typeR: req.body.typeR,
        statusR: req.body.statusR,
        dateRF: req.body.dateRF

    }
    Paiment.findByIdAndUpdate(paimentID, {$set: updatedData})
    .then(() => {
        res.json({
            message:'payments updated successfully!'
        })
    })
.catch(error => {
    res.json({
        message:'An error Occured!'
    })
})

}
const destroy =(req, res, next) =>{
    let paimentID = req.body.paimentID
    Paiment.findByIdAndRemove(paimentID)
    .then(() => {
        res.json({
            message:'payments deleted successfully!'
        })
    })
    .catch (error => {
        res.json({
            messaage:'An error Occured'
        })
    })
}

module.exports = {
    index, show, store, update, destroy
}