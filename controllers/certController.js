const { PDFNet }  = require('@pdftron/pdfnet-node')
const path = require('path')
const fs = require('fs')
const express     = require('express')
const router      = express.Router()

const certificate = (req,res,next)=>
{
const inputPath = path.resolve(__dirname, '../files/hazemmm.pdf');
const outputPath = path.resolve(__dirname,'../files/hazemmm2.pdf');

const replaceText  = async() =>{

    const pdfdoc = await PDFNet.PDFDoc.createFromFilePath(inputPath);
    await pdfdoc.initSecurityHandler();
    const replacer = await PDFNet.ContentReplacer.create();
    const page = await pdfdoc.getPage(1);

    await replacer.addString('username', 'hazem');

   await replacer.process(page);

   pdfdoc.save(outputPath, PDFNet.SDFDoc.SaveOptions.e_linearized);
 

}
PDFNet.runWithCleanup(replaceText,"demo:1639318772485:7b7a5e49030000000080f638b93766937f90eaf07ea35e8dd1bc8ad90c").then(()=>{
    fs.readFile(outputPath,(err,data)=>
    {
   

        if (err){
            res.statusCode = 500;
            res.end(err);

        }else
        {

            res.setHeader('ContentType', 'application/pdf');
            res.end(data);
        }
    })
}).catch(err => {
    res.statusCode = 500;
    res.end(err);
});

}
  


module.exports = {
    certificate
   }