var Tesseract = require('tesseract.js');
const translate = require('@vitalets/google-translate-api');
const  Feature =(req,res,next)=>
{

  console.log(req.file)
  console.log(req.body)

  var  image = req.file.path
  var langue = req.body.langue;

var newStr;
var newStrN;

  Tesseract.recognize(
      image,
      'eng',
      { logger: m => console.log(m) }
    ).then(({ data: { text } }) => {


      newStrN = text
      newStrN=newStrN.replace(/\n/g, '');
      newStrN=newStrN.replace(';','');
      newStrN=newStrN.replace('\'','');
      newStrN=newStrN.replace('\""','');
      newStrN=newStrN.replace('//','');
      newStrN=newStrN.replace('"','');
      newStrN=newStrN.replace(/(\r\n|\n|\r)/gm, "");
      newStrN=newStrN.trim();
      translate(text, {to: langue})  .then(trtext => {
        newStr = trtext.text
newStr=newStr.replace(/\n/g, '');
newStr=newStr.replace(';','');
newStr=newStr.replace('\'','');
newStr=newStr.replace('\""','');
newStr=newStr.replace('//','');
newStr=newStr.replace('"','');
newStr=newStr.replace(/(\r\n|\n|\r)/gm, "");
newStr=newStr.trim();

res.json({
  Message:"Original Text From Your Image",
  newStrN,
  Message:"Translated Text From Your Image",
  newStr

})
     })
    })
}


  
module.exports = {
 Feature, 
}