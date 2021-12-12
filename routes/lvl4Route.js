const express = require('express')
const router = express.Router()

const lvl4Controller = require('../controllers/lvl4Controller')
router.get('/',lvl4Controller.index)
router.post('/show',lvl4Controller.show)
router.post('/store',lvl4Controller.store)
router.post('/update',lvl4Controller.update)
router.post('/delete',lvl4Controller.destroy)
router.get('/question',lvl4Controller.question)
router.post('/answer',lvl4Controller.answer)
router.get('/score',lvl4Controller.scoreFUN)
router.get('/pass',lvl4Controller.pass)

module.exports = router