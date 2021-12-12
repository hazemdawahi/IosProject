const express = require('express')
const router = express.Router()

const paimentController = require('../controllers/paimentController')
router.get('/',paimentController.index)
router.post('/show',paimentController.show)
router.post('/store',paimentController.store)
router.post('/update',paimentController.update)
router.post('/delete',paimentController.destroy)
module.exports = router