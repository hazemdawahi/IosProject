const express     = require('express')
const router      = express.Router()

const translateController = require('../controllers/dotranslate')
const upload = require('../middleware/upload')

router.post('/feature',upload.single('image'), translateController.Feature)

module.exports = router