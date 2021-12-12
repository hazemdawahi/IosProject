const Reclamation = require('../models/reclamation')
const index = (req, res, next) => {
    Reclamation.find()
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
    let reclamationID = req.body.reclamationID
    Reclamation.findById(reclamationID)
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
    let reclamation = new Reclamation({
        iduser: req.body.iduser,
        dateR: req.body.dateR,
        typeR: req.body.typeR,
        statusR: req.body.statusR,
        dateRF: req.body.dateRF
    })
    reclamation.save()
   .then(response => 
    {
        res.json({
            message:'reclamation Added Successfully'
        })

    })
    .catch(error => {
        res.json({
            message:'An error Occured!'
        })
    })
   
}
const update = (req, res, next) => {
    let reclamationID = req.body.reclamationID

    let updatedData = {
        iduser: req.body.iduser,
        dateR: req.body.dateR,
        typeR: req.body.typeR,
        statusR: req.body.statusR,
        dateRF: req.body.dateRF

    }
    Reclamation.findByIdAndUpdate(reclamationID, {$set: updatedData})
    .then(() => {
        res.json({
            message:'reclamation updated successfully!'
        })
    })
.catch(error => {
    res.json({
        message:'An error Occured!'
    })
})

}
const destroy =(req, res, next) =>{
    let reclamationID = req.body.reclamationID
    Reclamation.findByIdAndRemove(reclamationID)
    .then(() => {
        res.json({
            message:'reclamation deleted successfully!'
        })
    })
    .catch (error => {
        res.json({
            messaage:'An error Occured'
        })
    })
}


const search =(req, res, next ) => {

var regex = new RegExp(req.body.name,'i');
Reclamation.find({typeR:regex}).then((result)=>{
    res.status(200).json(result)
})

}

module.exports = {
    index, show, store, update, destroy, search
}