const express = require('express')
const router = express.Router()
const authenticate = require('../middleware/authenticate')

const userController = require('../controllers/userController')
router.get('/',userController.index)
router.post('/show',authenticate.authenticateByAdmin,userController.show)
router.post('/store',userController.store)
router.post('/update',userController.update)
router.post('/delete',userController.destroy)
router.get('/checkuser',userController.checkUser)
router.get('/search',userController.search)
router.get('/access',userController.GetAccess)
router.get('/id',userController.getID)
router.get('/change',userController.changeAcces)
router.get('/niveau',userController.GetNiveau)
router.get('/where',userController.GetWhere)
router.post('/changedW2',userController.changeWhere2)
router.post('/changedW3',userController.changeWhere3)
router.post('/changedW4',userController.changeWhere4)
router.post('/changedW5',userController.changeWhere5)
router.post('/changedW6',userController.changeWhere6)
router.post('/changedW7',userController.changeWhere7)
router.post('/changedW8',userController.changeWhere8)
router.post('/changedW9',userController.changeWhere9)
router.post('/progress',userController.GetProgress)
router.get('/progress',userController.GetProgress)
router.post('/changep2',userController.changeprogress2)
router.post('/changep3',userController.changeprogress3)
router.post('/changep4',userController.changeprogress4)
router.post('/changep5',userController.changeprogress5)
router.post('/changep6',userController.changeprogress6)
router.post('/changep7',userController.changeprogress7)
router.post('/changep8',userController.changeprogress8)
router.post('/changep9',userController.changeprogress9)

router.get('/vie',userController.Getvie)
router.post('/changevie10',userController.changevie10)
router.post('/changevie100',userController.changevie100)
router.post('/changevie1000',userController.changevie1000)
router.post('/changevieminus',userController.changevieminus)
router.post('/changevieplus',userController.changevieplus)
router.post('/changeviedate',userController.changeviedate)
router.get('/vie0',userController.Getvie0)




















module.exports = router