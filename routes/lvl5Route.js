const express = require('express')
const router = express.Router()

const lvl5Controller = require('../controllers/lvl5Controller')
router.get('/',lvl5Controller.index)
router.post('/show',lvl5Controller.show)
router.post('/store',lvl5Controller.store)
router.post('/update',lvl5Controller.update)
router.post('/delete',lvl5Controller.destroy)
router.get('/question',lvl5Controller.question)
router.post('/answer',lvl5Controller.answer)
router.get('/score',lvl5Controller.scoreFUN)
router.get('/pass',lvl5Controller.pass)

module.exports = router