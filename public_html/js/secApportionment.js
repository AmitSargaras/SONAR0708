function leIdSelected(leIdVal)
{
   //var leIdSel = document.forms[0].leId;
   var subprofileSel = document.forms[0].subProfileId;
   var limitIdSel = document.forms[0].limitId;
   var chargeRankSel = document.forms[0].chargeDtlId;
   //var leIdVal = leIdSel.options[leIdSel.selectedIndex].value;
   var leNameVal = "&nbsp";
   clearDropdown(subprofileSel);
   subprofileSel.add(new Option("Please Select ", ""));
   clearDropdown(limitIdSel);
   limitIdSel.add(new Option("Please Select ", ""));
   clearDropdown(chargeRankSel);
   document.getElementById("id_productDesc").innerHTML = '&nbsp';
   document.getElementById("id_approvedLimitCcy").innerHTML = '&nbsp';
   document.getElementById("id_approvedLimitAmt").innerHTML = '&nbsp';
   document.getElementById("id_activatedLimitCcy").innerHTML = '&nbsp';
   document.getElementById("id_activatedLimitAmt").innerHTML = '&nbsp';

   for(i=0; i<limitInfo.length; i++)
   {
      if (limitInfo[i][0] == leIdVal)
      {
         leNameVal = limitInfo[i][1];
         if (!containsOption(subprofileSel, limitInfo[i][2]))
         {
            var newSubprofileId = new Option();
            newSubprofileId.value = limitInfo[i][2];
            newSubprofileId.text = limitInfo[i][2];
            subprofileSel.add(newSubprofileId);
         }
      }
   }
   document.getElementById("id_leName").innerHTML = leNameVal; 
}

function subprofileIdSelected(leIdVal, subprofileVal)
{
   //var leIdSel = document.forms[0].leId;
   //var leIdVal = leIdSel.options[leIdSel.selectedIndex].value;
   //var subprofileSel = document.forms[0].subProfileId;
   //var subprofileVal = subprofileSel.options[subprofileSel.selectedIndex].value;
   var limitIdSel = document.forms[0].limitId;
   var chargeRankSel = document.forms[0].chargeDtlId;
   clearDropdown(limitIdSel);
   limitIdSel.add(new Option("Please Select ", ""));
   clearDropdown(chargeRankSel);
   document.getElementById("id_productDesc").innerHTML = '&nbsp';
   document.getElementById("id_approvedLimitCcy").innerHTML = '&nbsp';
   document.getElementById("id_approvedLimitAmt").innerHTML = '&nbsp';
   document.getElementById("id_activatedLimitCcy").innerHTML = '&nbsp';
   document.getElementById("id_activatedLimitAmt").innerHTML = '&nbsp';

   for(i=0; i<limitInfo.length; i++)
   {
      if (limitInfo[i][0] == leIdVal && limitInfo[i][2] == subprofileVal)
      {
         if (!containsOption(limitIdSel, limitInfo[i][3]))
         { 
            var newLimitId = new Option();
            newLimitId.value = limitInfo[i][3];
            newLimitId.text = limitInfo[i][4];
            limitIdSel.add(newLimitId);
         }   
      }
   } 
}

function limitIdSelected(limitIdVal)
{
   //var limitIdSel = document.forms[0].limitId;
   //var limitIdVal = limitIdSel.options[limitIdSel.selectedIndex].value;
   var chargeRankSel = document.forms[0].chargeDtlId;
   var prodDesc = "&nbsp";
   var approvedLmtCcy = "&nbsp";
   var approvedLmtAmt = "&nbsp";
   var activatedLmtCcy = "&nbsp";
   var activatedLmtAmt = "&nbsp";
   var colAmt = document.forms[0].fsv.value;
   var chargeAmt = "";
   clearDropdown(chargeRankSel);
   for(i=0; i<limitInfo.length; i++)
   {
      if (limitInfo[i][3] == limitIdVal)
      {
         prodDesc = limitInfo[i][8];
         approvedLmtCcy = limitInfo[i][9];
         approvedLmtAmt = limitInfo[i][10];
         activatedLmtCcy = limitInfo[i][11];
         activatedLmtAmt = limitInfo[i][12];
         if (!containsOption(chargeRankSel, limitInfo[i][5]))
         {
            var newChargeId = new Option();
            newChargeId.value = limitInfo[i][5];
            newChargeId.text = limitInfo[i][6];
            chargeRankSel.add(newChargeId);
            chargeAmt = limitInfo[i][7];
         }
      }
   }
   document.getElementById("id_productDesc").innerHTML = prodDesc;
   document.getElementById("id_approvedLimitCcy").innerHTML = approvedLmtCcy;
   document.getElementById("id_approvedLimitAmt").innerHTML = addDot(approvedLmtAmt);
   document.getElementById("id_activatedLimitCcy").innerHTML = activatedLmtCcy;
   document.getElementById("id_activatedLimitAmt").innerHTML = addDot(activatedLmtAmt);
   if (chargeRankSel.options.length > 0)
   {
       calAvailableColAmt(colAmt, chargeAmt, chargeRankSel.options[0].value);
       document.forms[0].priorityRankingAmt.value = document.forms[0].availableCollateralAmt.value;
   }
}

function chargeRankSelected(limitIdVal, chargeRankVal)
{
   //var limitIdSel = document.forms[0].limitId;
   //var limitIdVal = limitIdSel.options[limitIdSel.selectedIndex].value;
   //var chargeRankSel = document.forms[0].chargeDtlId;
   //var chargeRankVal = chargeRankSel.options[chargeRankSel.selectedIndex].value;
   var colAmt = document.forms[0].fsv.value;
   for(i=0; i<limitInfo.length; i++)
   {
      if (limitInfo[i][3] == limitIdVal && limitInfo[i][5] == chargeRankVal)
      {
          calAvailableColAmt(colAmt, limitInfo[i][7], limitInfo[i][5]);
          document.forms[0].priorityRankingAmt.value = document.forms[0].availableCollateralAmt.value;
          break;
      }
   }
}

function calAvailableColAmt(colAmt, chargeAmt, chargeId)
{
   var colAmtFloat = parseFloat(colAmt);
   var chargeAmtFloat = parseFloat(chargeAmt);
   if (!isNaN(colAmtFloat) && !isNaN(chargeAmtFloat))
   {
      var minAmt = Math.min(colAmtFloat, chargeAmtFloat);
      document.forms[0].minFsvCharge.value = minAmt;
      for(i=0; i<praByCharge.length; i++)
      {
         if (praByCharge[i][0] == chargeId)
         {
            minAmt = parseFloat(praByCharge[i][1]);
            if (minAmt < 0)
            {
               minAmt = 0;
            }
            document.forms[0].availableCollateralAmt.value = addDot(roundInt(minAmt));
         }
      }   
   }
   else
   {
      document.forms[0].availableCollateralAmt.value = 0;
   }
}

function containsOption(curDropdown, matchVal)
{
   for(j=0; j<curDropdown.length; j++)
   {
      if (curDropdown.options[j].value == matchVal)
      {
          return true; 
      }
   }
   return false;
}

function clearDropdown(curDropdown)
{
   while(curDropdown.options.length > 0)
   {
       curDropdown.remove(0);
   }
}

function byAmountCheckChanged()
{
   if (document.forms[0].percAmtInd[0].checked == true)
   {
       document.forms[0].byAbsoluteAmt.value = "";
       document.forms[0].byAbsoluteAmtDisp.value = "";
       document.forms[0].byAbsoluteAmt.disabled = true;
       document.forms[0].byPercentage.disabled = false;
   }
   else if (document.forms[0].percAmtInd[1].checked == true)
   {
       document.forms[0].byPercentage.value = "";
       document.forms[0].byPercentageDisp.value= "";
       document.forms[0].byPercentage.disabled = true;
       document.forms[0].byAbsoluteAmt.disabled = false;   
   } 
}


function minAmountCheckChanged()
{
   if (document.forms[0].minPercAmtInd[0].checked == true)
   {
       document.forms[0].minAbsoluteAmt.value = "";
       document.forms[0].minAbsoluteAmtDisp.value = "";
       document.forms[0].minAbsoluteAmt.disabled = true;
       document.forms[0].minPercentage.disabled = false;
   }
   else if (document.forms[0].minPercAmtInd[1].checked == true)
   {
       document.forms[0].minPercentage.value = "";
       document.forms[0].minPercentageDisp.value= "";
       document.forms[0].minPercentage.disabled = true;
       document.forms[0].minAbsoluteAmt.disabled = false; 
   } 
}

function maxAmountCheckChanged()
{
   if (document.forms[0].maxPercAmtInd[0].checked == true)
   {
       document.forms[0].maxAbsoluteAmt.value = "";
       document.forms[0].maxAbsoluteAmtDisp.value = "";
       document.forms[0].maxAbsoluteAmt.disabled = true;
       document.forms[0].maxPercentage.disabled = false;
   }
   else if (document.forms[0].maxPercAmtInd[1].checked == true)
   {
       document.forms[0].maxPercentage.value = "";
       document.forms[0].maxPercentageDisp.value= "";
       document.forms[0].maxPercentage.disabled = true;
       document.forms[0].maxAbsoluteAmt.disabled = false;   
   } 
}


function byPercentageLostFocus()
{
   if (document.forms[0].percAmtInd[0].checked == true)
   {
      var percFloat = parseFloat(document.forms[0].byPercentage.value);
      var totalColAmt = parseFloat(removeDot(document.forms[0].minFsvCharge.value));
      if (!isNaN(percFloat) && !isNaN(totalColAmt))
      { 
         var amtVal = totalColAmt * percFloat / 100.0;
         document.forms[0].byPercentageDisp.value = addDot(new String(roundInt(amtVal)));
      } 
   }
}


function byAmountLostFocus()
{
   if (document.forms[0].percAmtInd[1].checked == true)
   {
      var amtFloat = parseFloat(removeDot(document.forms[0].byAbsoluteAmt.value));
      var totalColAmt = parseFloat(removeDot(document.forms[0].minFsvCharge.value));
      if (!isNaN(amtFloat) && !isNaN(totalColAmt))
      { 
         var percVal = amtFloat * 100.0 / totalColAmt;
         if (!isNaN(percVal))
         {  
            document.forms[0].byAbsoluteAmtDisp.value = new String(roundUp(percVal, 2));
         }
      } 
   }
}


function minPercentageLostFocus()
{
   if (document.forms[0].minPercAmtInd[0].checked == true)
   {
      var percFloat = parseFloat(document.forms[0].minPercentage.value);
      var totalColAmt = parseFloat(removeDot(document.forms[0].minFsvCharge.value));
      if (!isNaN(percFloat) && !isNaN(totalColAmt))
      { 
         var amtVal = totalColAmt * percFloat / 100.0;
         document.forms[0].minPercentageDisp.value = addDot(new String(roundInt(amtVal)));
      } 
   }
}


function minAmountLostFocus()
{
   if (document.forms[0].minPercAmtInd[1].checked == true)
   {
      var amtFloat = parseFloat(removeDot(document.forms[0].minAbsoluteAmt.value));
      var totalColAmt = parseFloat(removeDot(document.forms[0].minFsvCharge.value));
      if (!isNaN(amtFloat) && !isNaN(totalColAmt))
      { 
         var percVal = amtFloat * 100.0 / totalColAmt;
         if (!isNaN(percVal))
         {  
            document.forms[0].minAbsoluteAmtDisp.value = new String(roundUp(percVal, 2));
         }
      } 
   }
}


function maxPercentageLostFocus()
{
   if (document.forms[0].maxPercAmtInd[0].checked == true)
   {
      var percFloat = parseFloat(document.forms[0].maxPercentage.value);
      var totalColAmt = parseFloat(removeDot(document.forms[0].minFsvCharge.value));
      if (!isNaN(percFloat) && !isNaN(totalColAmt))
      { 
         var amtVal = totalColAmt * percFloat / 100.0;
         document.forms[0].maxPercentageDisp.value = addDot(new String(roundInt(amtVal)));
      } 
   }
}


function maxAmountLostFocus()
{
   if (document.forms[0].maxPercAmtInd[1].checked == true)
   {
      var amtFloat = parseFloat(removeDot(document.forms[0].maxAbsoluteAmt.value));
      var totalColAmt = parseFloat(removeDot(document.forms[0].minFsvCharge.value));
      if (!isNaN(amtFloat) && !isNaN(totalColAmt))
      { 
         var percVal = amtFloat * 100.0 / totalColAmt;
         if (!isNaN(percVal))
         {  
            document.forms[0].maxAbsoluteAmtDisp.value = new String(roundUp(percVal, 2));
         }
      } 
   }
}

function validateSecApportionmentForm()
{
   var prAmtSpan = document.getElementById("id_prAmt");
   var leIdSpan = document.getElementById("id_leId");
   var subprofileIdSpan = document.getElementById("id_subProfileId");
   var limitIdSpan = document.getElementById("id_limitId");
   var byPercSpan = document.getElementById("id_by_perc");
   var byAmtSpan = document.getElementById("id_by_amt");
   var minPercSpan = document.getElementById("id_min_perc");
   var minAmtSpan = document.getElementById("id_min_amt"); 
   var maxPercSpan = document.getElementById("id_max_perc");
   var maxAmtSpan = document.getElementById("id_max_amt");  
   var hasError = false;
   if (document.forms[0].priorityRankingAmt.value == "")
   {
      prAmtSpan.innerHTML = '<font color="#FF0000" size="1">This is a mandatory field.</font>';
      hasError = true; 
   }
   else
   {
      if (!isValidAmount(removeDot(document.forms[0].priorityRankingAmt.value)))
      {
         prAmtSpan.innerHTML = '<font color="#FF0000" size="1">Invalid amount value</font>';
         hasError = true; 
      }  
      else if (parseFloat(removeDot(document.forms[0].priorityRankingAmt.value)) > 
          parseFloat(removeDot(document.forms[0].availableCollateralAmt.value)))
      {
         prAmtSpan.innerHTML = '<font color="#FF0000" size="1">Priority ranking amount cannot be larger than available collateral amount</font>';
         hasError = true;  
      }
      else
      {
         prAmtSpan.innerHTML = '&nbsp;'; 
      } 
   }  
 
   if (document.forms[0].leId.value == "")
   {
      leIdSpan.innerHTML = '<font color="#FF0000" size="1">This is a mandatory field.</font>';
      hasError = true;
   }
   else
   {
      leIdSpan.innerHTML = '&nbsp;';
   }

   if (document.forms[0].subProfileId.value == "")
   {
      subprofileIdSpan.innerHTML = '<font color="#FF0000" size="1">This is a mandatory field.</font>';
      hasError = true;
   }
   else
   {
      subprofileIdSpan.innerHTML = '&nbsp;';
   }

   if (document.forms[0].limitId.value == "")
   {
      limitIdSpan.innerHTML = '<font color="#FF0000" size="1">This is a mandatory field.</font>';
      hasError = true;     
   }
   else
   {
      limitIdSpan.innerHTML = '&nbsp;';  
   }

   var validByAmt = true;
   var byAmtErrorMsg = '&nbsp;';
   var byPercErrorMsg = '&nbsp;';
   if (document.forms[0].percAmtInd[0].checked == true)
   {
      if (document.forms[0].byPercentage.value == "")
      {
         byPercErrorMsg = '<font color="#FF0000" size="1">This is a mandatory field.</font>';
         validByAmt = false;  
      }
      else if (!isValidPercentage(document.forms[0].byPercentage.value))
      {
         byPercErrorMsg = '<font color="#FF0000" size="1">Valid range is between 0 and 100 up to 2 decimal place</font>';
         validByAmt = false;
      }
      else if (document.forms[0].byPercentage.value > 100)
      {
         byPercErrorMsg = '<font color="#FF0000" size="1">By percentage should be less than or equal to 100%</font>';
         validByAmt = false;
      }  
   }
   else if (document.forms[0].percAmtInd[1].checked == true)
   {
      if (document.forms[0].byAbsoluteAmt.value == "")
      {
         byAmtErrorMsg = '<font color="#FF0000" size="1">This is a mandatory field.</font>';
         validByAmt = false;
      }
      else if (!isValidAmount(removeDot(document.forms[0].byAbsoluteAmt.value)))
      {
         byAmtErrorMsg = '<font color="#FF0000" size="1">Invalid amount value</font>';
         validByAmt = false;
      }
      else if (parseFloat(removeDot(document.forms[0].byAbsoluteAmt.value)) >
               parseFloat(removeDot(document.forms[0].minFsvCharge.value)))
      {
         byAmtErrorMsg = '<font color="#FF0000" size="1">By absolute amount should be less than or equal to minimum of FSV and charge amount</font>';
         validByAmt = false;
      }  
   } 
   else
   {
      byAmtErrorMsg = '<font color="#FF0000" size="1">This is a mandatory field.</font>';
      validByAmt = false; 
   }
   if (validByAmt == false)
   {
      hasError = true;
   }
   byPercSpan.innerHTML = byPercErrorMsg;
   byAmtSpan.innerHTML = byAmtErrorMsg; 

   var validMinAmt = true;
   var minAmtErrorMsg = '&nbsp';
   var minPercErrorMsg = '&nbsp';
   if (document.forms[0].minPercAmtInd[0].checked == false && document.forms[0].minPercAmtInd[1].checked == false)
   {
      if (document.forms[0].maxPercAmtInd[0].checked == true || document.forms[0].maxPercAmtInd[1].checked == true)
      {
         minAmtErrorMsg = '<font color="#FF0000" size="1">Minimum amount/percentage should be specified if maximum amount/percentage is specified</font>'
         validMinAmt = false;
      }  
   } 

   if (document.forms[0].minPercAmtInd[0].checked == true)
   {
      if (document.forms[0].minPercentage.value == "")
      {
         //document.forms[0].minPercAmtInd[0].checked = false;
         minPercErrorMsg = '<font color="#FF0000" size="1">This is a mandatory field</font>';
         validMinAmt = false;
      }
      else if (!isValidPercentage(document.forms[0].minPercentage.value))
      {
         minPercErrorMsg = '<font color="#FF0000" size="1">Invalid percentage value</font>';
         validMinAmt = false;
      }
   }
   else if (document.forms[0].minPercAmtInd[1].checked == true)
   {
      if (document.forms[0].minAbsoluteAmt.value == "")
      {
         //document.forms[0].minPercAmtInd[1].checked = false;
         minAmtErrorMsg = '<font color="#FF0000" size="1">This is a mandatory field</font>';
         validMinAmt = false;
      }
      else if (!isValidAmount(removeDot(document.forms[0].minAbsoluteAmt.value)))
      {
         minAmtErrorMsg = '<font color="#FF0000" size="1">Invalid amount value</font>';
         validMinAmt = false;
      }  
   }
   minPercSpan.innerHTML = minPercErrorMsg;
   minAmtSpan.innerHTML = minAmtErrorMsg;
   if (validMinAmt == false)
   {
      hasError = true; 
   }

   var validMaxAmt = true;
   var maxAmtErrorMsg = '&nbsp';
   var maxPercErrorMsg = '&nbsp';
   if (document.forms[0].maxPercAmtInd[0].checked == false && document.forms[0].maxPercAmtInd[1].checked == false)
   {
      if (document.forms[0].minPercAmtInd[0].checked == true || document.forms[0].minPercAmtInd[1].checked == true)
      {
         maxAmtErrorMsg = '<font color="#FF0000" size="1">Maximum amount/percentage should be specified if minimum amount/percentage is specified</font>'
         validMaxAmt = false;
      }  
   } 

   if (document.forms[0].maxPercAmtInd[0].checked == true)
   {
      if (document.forms[0].maxPercentage.value == "")
      {
         //document.forms[0].maxPercAmtInd[0].checked = false;
         maxPercErrorMsg = '<font color="#FF0000" size="1">This is a mandatory field</font>';
         validMaxAmt = false;
      }
      else if (!isValidPercentage(document.forms[0].maxPercentage.value))
      {
         maxPercErrorMsg = '<font color="#FF0000" size="1">Invalid percentage value</font>';
         validMaxAmt = false;
      }
   }
   else if (document.forms[0].maxPercAmtInd[1].checked == true)
   {
      if (document.forms[0].maxAbsoluteAmt.value == "")
      {
         //document.forms[0].maxPercAmtInd[1].checked = false;
         maxAmtErrorMsg = '<font color="#FF0000" size="1">This is a mandatory field</font>';
         validMaxAmt = false;
      }
      else if (!isValidAmount(removeDot(document.forms[0].maxAbsoluteAmt.value)))
      {
         maxAmtErrorMsg = '<font color="#FF0000" size="1">Invalid amount value</font>';
         validMaxAmt = false;
      }  
   }
   maxPercSpan.innerHTML = maxPercErrorMsg;
   maxAmtSpan.innerHTML = maxAmtErrorMsg;
   if (validMaxAmt == false)
   {
      hasError = true; 
   }

   if (hasError == false && !validateByAmountInRange())
   {
      byAmtSpan.innerHTML = '<font color="#FF0000" size="1">Amount should be within range of minimum and maximum</font>'
      hasError = true; 
   }
   return !hasError;
}

function validateByAmountInRange()
{
   var byAmtVal = "NaN";
   var minAmtVal = "NaN";
   var maxAmtVal = "NaN";
   var totalColAmt = parseFloat(removeDot(document.forms[0].minFsvCharge.value));
   if (document.forms[0].percAmtInd[0].checked == true)
   {
      var percFloat = parseFloat(document.forms[0].byPercentage.value);
      if (!isNaN(percFloat) && !isNaN(totalColAmt))
      {
         byAmtVal = totalColAmt * percFloat / 100.0;
      } 
   }
   else if (document.forms[0].percAmtInd[1].checked == true)
   {
      byAmtVal = parseFloat(removeDot(document.forms[0].byAbsoluteAmt.value));
   }

   if (document.forms[0].minPercAmtInd[0].checked == true)
   {
      var percFloat = parseFloat(document.forms[0].minPercentage.value);
      if (!isNaN(percFloat) && !isNaN(totalColAmt))
      {
         minAmtVal = totalColAmt * percFloat / 100.0;
      } 
   }
   else if (document.forms[0].minPercAmtInd[1].checked == true)
   {
      minAmtVal = parseFloat(removeDot(document.forms[0].minAbsoluteAmt.value));
   }

   if (document.forms[0].maxPercAmtInd[0].checked == true)
   {
      var percFloat = parseFloat(document.forms[0].maxPercentage.value);
      if (!isNaN(percFloat) && !isNaN(totalColAmt))
      {
         maxAmtVal = totalColAmt * percFloat / 100.0;
      } 
   }
   else if (document.forms[0].maxPercAmtInd[1].checked == true)
   {
      maxAmtVal = parseFloat(removeDot(document.forms[0].maxAbsoluteAmt.value));
   }

   if (!isNaN(byAmtVal) && !isNaN(minAmtVal) && byAmtVal < minAmtVal)
   {
      return false;  
   } 
   if (!isNaN(byAmtVal) && !isNaN(maxAmtVal) && byAmtVal > maxAmtVal)
   {
      return false;  
   }
   return true;
}

function roundInt(val)
{
   return Math.round(val);
}

function roundUp(val, noofdigit)
{
   return Math.round(val * 100) / 100.0;
}

function isValidAmount(amt)
{
   var floatAmt = parseFloat(amt);
   if (isNaN(floatAmt))
   {
      return false;
   }
   if (amt.indexOf(".") >=0)
   {
      var valArr = amt.split(".");
      if (valArr[0].length > 28)
      {
         return false;
      }
      if (valArr[1].length > 2)
      {
         return false;
      }
   }
   else if (amt.length > 28)
   {
      return false;   
   }   
   return true;
}



function isValidPercentage(perc)
{
   var floatPerc = parseFloat(perc);
   if (isNaN(floatPerc))
   {
      return false;
   }
   if (floatPerc == 100)
   {
      return true;
   }
   if (perc.indexOf(".") >=0)
   {
      var valArr = perc.split(".");
      if (valArr[0].length > 2)
      {
         return false;
      }
      if (valArr[1].length > 2)
      {
         return false;
      }
   }
   else if (perc.length > 2)
   {
      return false;   
   }   
   return true;
}

function removeDot(val)
{
   var val1 = new String(val);
   var res = "";
   for(i=0; i<val1.length; i++)
   {
      if (val1.charAt(i) != ',')
      {
         res = res + val1.charAt(i);  
      }
   }
   return res;
}

function addDot(val)
{
   var val1 = new String(val);
   if (val1 == '&nbsp;' || val1 == '0')
   {
       return val1;
   }
   var res = "";
   for(i=0; i<val1.length; i++)
   { 
      res = val1.charAt(val1.length - 1 - i) + res;
      if (i % 3 == 2 && i != val1.length - 1)
      {
         res = "," + res; 
      }
   }
   return res;  
}



