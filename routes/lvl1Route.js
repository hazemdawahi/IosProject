const express = require('express')
const router = express.Router()

const lvl1Controller = require('../controllers/lvl1Controller')
router.get('/',lvl1Controller.index)
router.post('/show',lvl1Controller.show)
router.post('/store',lvl1Controller.store)
router.post('/update',lvl1Controller.update)
router.post('/delete',lvl1Controller.destroy)
router.get('/question',lvl1Controller.question)
router.post('/answer',lvl1Controller.answer)
router.get('/score',lvl1Controller.scoreFUN)
router.get('/pass',lvl1Controller.pass)


module.exports = router