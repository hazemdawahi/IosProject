const express = require('express')
const router = express.Router()

const reclamationController = require('../controllers/reclamationController')
router.get('/',reclamationController.index)
router.post('/show',reclamationController.show)
router.post('/store',reclamationController.store)
router.post('/update',reclamationController.update)
router.post('/delete',reclamationController.destroy)
router.get('/search',reclamationController.search)

module.exports = router