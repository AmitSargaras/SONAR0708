

<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript">

    function JumpOnSelectactive(selectObj, customerID, limitProfileID)
	{
        alert('hello');
  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "processcusdetails")
		{
        	location.href = "CustomerProcess.do?event=viewLimitProfile&customerID=" +customerID+"&limitProfileID=" +limitProfileID;
   		}
		if (selectObj.options[selectIndex].value == "viewlimits")
        	parent.document.location = "Limits.do?event=viewlimits&limitProfileID=" +limitProfileID;
		if (selectObj.options[selectIndex].value == "viewsecurities")
        	parent.document.location = "CustomerProcess.do?event=viewsecurities&limitProfileID="+limitProfileID;

     }

	<%--function JumpOnSelectactive(selectObj, subprofileID, instrID)
	{
        alert('hello');
  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "processcusdetails")
		{
        	location.href = "CustomerProcess.do?event=viewLimitProfile&subprofileID=" +subprofileID+"&instrID="+instrID;
   		}
		if (selectObj.options[selectIndex].value == "viewlimits")
        	parent.document.location = "Limits.do?event=viewlimits&instrID=" +instrID;
		if (selectObj.options[selectIndex].value == "viewsecurities")
        	parent.document.location = "CustomerProcess.do?event=viewsecurities&userID=" +subprofileID;
		if (selectObj.options[selectIndex].value == 400)
        	parent.document.location = "UserSearchContainer(applyleave).htm";
		if (selectObj.options[selectIndex].value == 500)
        	parent.document.location = "UserSearchContainer(suspend).htm";
     }
--%>
    function gotoPage() {
	    parent.document.location="User.do?event=prepare";
	}

    function goNextPrev(ind) {
        document.forms["NewUserSearchForm"].cusName.value='';
        document.forms["NewUserSearchForm"].startIndex.value=ind;
    }

    function goPageIndex(ind) {
        document.forms["CustomerSearchForm"].startIndex.value=ind;
        document.forms["CustomerSearchForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["CustomerSearchForm"].customerName.value=ind;
        alert(document.forms["CustomerSearchForm"].customerName.value);
        document.forms["CustomerSearchForm"].startIndex.value=0;
        document.forms["CustomerSearchForm"].submit();
    }
    function goPage(pageNo){
	    document.forms[0].startIndex.value = pageNo*20;
    }
</script>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<form name="CustomerSearchForm" method="POST" action="/cms/CustomerSearch.do?event=list">
<input type="hidden" name="startIndex" value="0">
<input type="hidden" name="customerName" >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<!--DWLayoutTable-->
<tr id="envCanvas">
 <td width="100%" valign="top" id="envCanvasContent">
  <table id="window" border="0" cellpadding="0" cellspacing="0">
   <tr id="winCanvas">
    <td>
     <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
     <!--DWLayoutTable-->
      <tr >
       <td colspan="3" valign="top" style="height:100%;width:100%;">
        <div id="contentCanvas" style="height:100%;width:100%;">
        <!-- InstanceBeginEditable name="contentCanvas" -->
         <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
          <tr>
           <td  style="text-align:right" valign="bottom">
            <table border="0" cellspacing="0" cellpadding="0" style="font-size:11px">
             <tr>
              &nbsp;1&nbsp;|&nbsp;<a href='CustomerSearch.do?event=list&startIndex=20'>2</a>&nbsp;&nbsp;|<a href='CustomerSearch.do?event=list&startIndex=20' >Next</a>&nbsp;

             </tr>
            </table>
           </td>
          </tr>
          <tr>
           <td>

             20Record(s) Found

           </td>
          </tr>
          <tr>
           <td>
            <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
             <thead>
              <tr>
               <td width="5%">S/N</td>
               <td width="25%">Legal Name<br/>
                Customer Name</td>
               <td width="15%">LE ID<br/>
                SubProfile ID</td>
               <td width="20%">Instruction Ref No.</td>
               <td width="15%">Date Approved</td>
               <td width="20%">Action</td>
              </tr>
             </thead>
             <tbody>




               <input type="hidden" name="customerID" value ="20030707000023">
               <input type="hidden" name="limitProfileID" value ="65">
                  <tr class="odd">
                  <td style="text-align:center" class="index">1</td>
                  <td>k<br>
                  1</td>
                  <td>20030707000021<br>20030707000023</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000023, 65)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000026">
               <input type="hidden" name="limitProfileID" value ="6">
                  <tr class="even">
                  <td style="text-align:center" class="index">2</td>
                  <td>l<br>
                  1</td>
                  <td>20030707000024<br>20030707000026</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000026, 6)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000027">
               <input type="hidden" name="limitProfileID" value ="55">
                  <tr class="odd">
                  <td style="text-align:center" class="index">3</td>
                  <td>yuki<br>
                  1</td>
                  <td>20030707000025<br>20030707000027</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000027, 55)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000028">
               <input type="hidden" name="limitProfileID" value ="22">
                  <tr class="even">
                  <td style="text-align:center" class="index">4</td>
                  <td>mani<br>
                  1</td>
                  <td>20030707000026<br>20030707000028</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000028, 22)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000032">
               <input type="hidden" name="limitProfileID" value ="88">
                  <tr class="odd">
                  <td style="text-align:center" class="index">5</td>
                  <td>zubeida<br>
                  1</td>
                  <td>20030707000030<br>20030707000032</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000032, 88)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000033">
               <input type="hidden" name="limitProfileID" value ="15">
                  <tr class="even">
                  <td style="text-align:center" class="index">6</td>
                  <td>pooooooja<br>
                  1</td>
                  <td>20030707000031<br>20030707000033</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000033, 15)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000031">
               <input type="hidden" name="limitProfileID" value ="77">
                  <tr class="odd">
                  <td style="text-align:center" class="index">7</td>
                  <td>delphina<br>
                  1</td>
                  <td>20030707000029<br>20030707000031</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000031, 77)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000030">
               <input type="hidden" name="limitProfileID" value ="66">
                  <tr class="even">
                  <td style="text-align:center" class="index">8</td>
                  <td>pearley<br>
                  1</td>
                  <td>20030707000028<br>20030707000030</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000030, 66)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000029">
               <input type="hidden" name="limitProfileID" value ="43">
                  <tr class="odd">
                  <td style="text-align:center" class="index">9</td>
                  <td>michael<br>
                  1</td>
                  <td>20030707000027<br>20030707000029</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000029, 43)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000035">
               <input type="hidden" name="limitProfileID" value ="32">
                  <tr class="even">
                  <td style="text-align:center" class="index">10</td>
                  <td>amber<br>
                  aa</td>
                  <td>20030707000033<br>20030707000035</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000035, 32)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000012">
               <input type="hidden" name="limitProfileID" value ="20030710000015">
                  <tr class="odd">
                  <td style="text-align:center" class="index">11</td>
                  <td>arthur blair<br>
                  ab</td>
                  <td>20030704000010<br>20030704000012</td>
                  <td>1</td>
                  <td>Thu Jul 10 14:20:52 SGT 2003</td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000012, 20030710000015)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000012">
               <input type="hidden" name="limitProfileID" value ="20030710000017">
                  <tr class="even">
                  <td style="text-align:center" class="index">12</td>
                  <td>arthur blair<br>
                  ab</td>
                  <td>20030704000010<br>20030704000012</td>
                  <td>1</td>
                  <td>Fri Jul 11 11:10:56 SGT 2003</td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000012, 20030710000017)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000012">
               <input type="hidden" name="limitProfileID" value ="20030710000013">
                  <tr class="odd">
                  <td style="text-align:center" class="index">13</td>
                  <td>arthur blair<br>
                  ab</td>
                  <td>20030704000010<br>20030704000012</td>
                  <td>1</td>
                  <td>Thu Jul 10 14:16:32 SGT 2003</td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000012, 20030710000013)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000012">
               <input type="hidden" name="limitProfileID" value ="20030709000009">
                  <tr class="even">
                  <td style="text-align:center" class="index">14</td>
                  <td>arthur blair<br>
                  ab</td>
                  <td>20030704000010<br>20030704000012</td>
                  <td>1</td>
                  <td>Wed Jul 09 19:31:33 SGT 2003</td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000012, 20030709000009)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000012">
               <input type="hidden" name="limitProfileID" value ="20030715000027">
                  <tr class="odd">
                  <td style="text-align:center" class="index">15</td>
                  <td>arthur blair<br>
                  ab</td>
                  <td>20030704000010<br>20030704000012</td>
                  <td>1</td>
                  <td>Tue Jul 15 16:11:32 SGT 2003</td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000012, 20030715000027)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000012">
               <input type="hidden" name="limitProfileID" value ="20030715000023">
                  <tr class="even">
                  <td style="text-align:center" class="index">16</td>
                  <td>arthur blair<br>
                  ab</td>
                  <td>20030704000010<br>20030704000012</td>
                  <td>1</td>
                  <td>Tue Jul 15 15:44:07 SGT 2003</td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000012, 20030715000023)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000012">
               <input type="hidden" name="limitProfileID" value ="2">
                  <tr class="odd">
                  <td style="text-align:center" class="index">17</td>
                  <td>arthur blair<br>
                  ab</td>
                  <td>20030704000010<br>20030704000012</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000012, 2)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000009">
               <input type="hidden" name="limitProfileID" value ="1">
                  <tr class="even">
                  <td style="text-align:center" class="index">18</td>
                  <td>betty smith<br>
                  bsmith</td>
                  <td>20030704000008<br>20030704000009</td>
                  <td>1</td>
                  <td>Sat Dec 30 01:00:00 SGT 1899</td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000009, 1)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030704000013">
               <input type="hidden" name="limitProfileID" value ="3">
                  <tr class="odd">
                  <td style="text-align:center" class="index">19</td>
                  <td>charlie angels<br>
                  ca</td>
                  <td>20030704000011<br>20030704000013</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030704000013, 3)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>


               <input type="hidden" name="customerID" value ="20030707000014">
               <input type="hidden" name="limitProfileID" value ="4">
                  <tr class="even">
                  <td style="text-align:center" class="index">20</td>
                  <td>derrick lobo<br>
                  dlb</td>
                  <td>20030707000012<br>20030707000014</td>
                  <td></td>
                  <td></td>
                  <td><select name="select3"  onchange="JumpOnSelectactive(this, 20030707000014, 4)">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <option value="viewlimits">View Limits</option>
                      <option value="viewsecurities">View Securities</option>
                  </select></td>

                 </tr>



              </tbody>
              </table>
             </td>
            </tr>
           </table>
		   <!-- InstanceEndEditable -->
		  </div>
		 </td>
        </tr>

         <tr>
                <td colspan="3">
					<div id="GeneralPurposeBar"> <!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table width="100%" style="margin-left:10px" border="0" cellspacing="0" cellpadding="5" align="center">
                      <tr>
                          &nbsp;<a href="Javascript:goAlphaIndex('A')" >A</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('B')" >B</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('C')" >C</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('D')" >D</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('E')" >E</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('F')" >F</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('G')" >G</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('H')" >H</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('I')" >I</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('J')" >J</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('K')" >K</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('L')" >L</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('M')" >M</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('N')" >N</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('O')" >O</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('P')" >P</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('Q')" >Q</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('R')" >R</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('S')" >S</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('T')" >T</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('U')" >U</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('V')" >V</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('W')" >W</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('X')" >X</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('Y')" >Y</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('Z')" >Z</a>&nbsp;|&nbsp;<a href="Javascript:goAlphaIndex('')" >All</a>&nbsp;|


                       </tr>
                    </table>
                    <!-- InstanceEndEditable --> </div>
                </td>
              </tr>
       </table>
      </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</form>
</body>

