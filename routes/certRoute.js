const express     = require('express')
const router      = express.Router()

const certController = require('../controllers/certcontroller')
router.get('/pdf',certController.certificate)
module.exports = router