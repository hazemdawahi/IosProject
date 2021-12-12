const express = require('express')
const router = express.Router()

const lvl2Controller = require('../controllers/lvl2Controller')
router.get('/',lvl2Controller.index)
router.post('/show',lvl2Controller.show)
router.post('/store',lvl2Controller.store)
router.post('/update',lvl2Controller.update)
router.post('/delete',lvl2Controller.destroy)
router.get('/question',lvl2Controller.question)
router.post('/answer',lvl2Controller.answer)
router.get('/score',lvl2Controller.scoreFUN)
router.get('/pass',lvl2Controller.pass)

module.exports = router