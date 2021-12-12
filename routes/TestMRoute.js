const express = require('express')
const router = express.Router()

const testMController = require('../controllers/TestMController')
router.get('/',testMController.index)
router.post('/show',testMController.show)
router.post('/store',testMController.store)
router.post('/update',testMController.update)
router.post('/delete',testMController.destroy)
router.get('/evaluation',testMController.evaluation)
router.get('/question',testMController.question)
router.post('/answer',testMController.answer)
router.get('/score',testMController.scoreFUN)
router.get('/pass',testMController.pass)

module.exports = router