const express = require('express')
const router = express.Router()

const lvl8Controller = require('../controllers/lvl8Controller')
router.get('/',lvl8Controller.index)
router.post('/show',lvl8Controller.show)
router.post('/store',lvl8Controller.store)
router.post('/update',lvl8Controller.update)
router.post('/delete',lvl8Controller.destroy)
router.get('/question',lvl8Controller.question)
router.post('/answer',lvl8Controller.answer)
router.get('/score',lvl8Controller.scoreFUN)
router.get('/pass',lvl8Controller.pass)

module.exports = router