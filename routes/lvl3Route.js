const express = require('express')
const router = express.Router()

const lvl3Controller = require('../controllers/lvl3Controller')
router.get('/',lvl3Controller.index)
router.post('/show',lvl3Controller.show)
router.post('/store',lvl3Controller.store)
router.post('/update',lvl3Controller.update)
router.post('/delete',lvl3Controller.destroy)
router.get('/question',lvl3Controller.question)
router.post('/answer',lvl3Controller.answer)
router.get('/score',lvl3Controller.scoreFUN)
router.get('/pass',lvl3Controller.pass)

module.exports = router