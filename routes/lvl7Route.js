const express = require('express')
const router = express.Router()

const lvl7Controller = require('../controllers/lvl7Controller')
router.get('/',lvl7Controller.index)
router.post('/show',lvl7Controller.show)
router.post('/store',lvl7Controller.store)
router.post('/update',lvl7Controller.update)
router.post('/delete',lvl7Controller.destroy)
router.get('/question',lvl7Controller.question)
router.post('/answer',lvl7Controller.answer)
router.get('/score',lvl7Controller.scoreFUN)
router.get('/pass',lvl7Controller.pass)

module.exports = router