const express = require('express')
const router = express.Router()

const lvl6Controller = require('../controllers/lvl6Controller')
router.get('/',lvl6Controller.index)
router.post('/show',lvl6Controller.show)
router.post('/store',lvl6Controller.store)
router.post('/update',lvl6Controller.update)
router.post('/delete',lvl6Controller.destroy)
router.get('/question',lvl6Controller.question)
router.post('/answer',lvl6Controller.answer)
router.get('/score',lvl6Controller.scoreFUN)
router.get('/pass',lvl6Controller.pass)

module.exports = router