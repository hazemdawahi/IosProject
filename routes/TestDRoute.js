const express = require('express')
const router = express.Router()

const testDController = require('../controllers/TestDController')
router.get('/',testDController.index)
router.post('/show',testDController.show)
router.post('/store',testDController.store)
router.post('/update',testDController.update)
router.post('/delete',testDController.destroy)
router.get('/evaluation',testDController.evaluation)
router.get('/question',testDController.question)
router.post('/answer',testDController.answer)
router.get('/score',testDController.scoreFUN)
router.get('/pass',testDController.pass)


module.exports = router