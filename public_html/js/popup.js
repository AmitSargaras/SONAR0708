/********************************************************************

Popup Windows - V 4.1
Author: Brian Gosselin
Site URL: http://scriptasylum.com
Read the "releasenotes.txt" for supported features and release notes.

************** EDIT THE LINES BELOW AT YOUR OWN RISK ****************/

/********************** Extra Function ******************************/
function ITG_swapImgRestore() { //v3.0
  var i,x,a=document.ITG_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function ITG_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.ITG_p) d.ITG_p=new Array();
    var i,j=d.ITG_p.length,a=ITG_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.ITG_p[j]=new Image; d.ITG_p[j++].src=a[i];}}
}

function ITG_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=ITG_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function ITG_swapImage() { //v3.0
  var i,j=0,x,a=ITG_swapImage.arguments; document.ITG_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=ITG_findObj(a[i]))!=null){document.ITG_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
/********************** End Extra Function ******************************/
/* Other Variable */
var minIconStr="<a id=\"$${id}$$_min\" onmouseout=\"ITG_swapImgRestore()\" onmouseover=\"ITG_swapImage('$${id}$$_min0','','min1.gif',1)\"><img src=\"min0.gif\" alt=\"Minimize\" name=\"$${id}$$_min0\" width=\"20\" height=\"20\" border=\"0\" id=\"$${id}$$_min0\" /></a>";

var maxIconStr="<a id=\"$${id}$$_max\" onmouseout=\"ITG_swapImgRestore()\" onmouseover=\"ITG_swapImage('$${id}$$_max0','','max1.gif',1)\"><img src=\"max0.gif\" alt=\"Maximize\" name=\"$${id}$$_max0\" width=\"20\" height=\"20\" border=\"0\" id=\"$${id}$$_max0\" /></a>";

var clsIconStr="<a id=\"$${id}$$_cls\" onmouseout=\"ITG_swapImgRestore()\" onmouseover=\"ITG_swapImage('$${id}$$_cls0','','close1.gif',1)\"><img src=\"close0.gif\" alt=\"Close\" name=\"$${id}$$_cls0\" width=\"20\" height=\"20\" border=\"0\" id=\"$${id}$$_cls0\" /></a>";

var propIconStr="<img src=\"prop.gif\" style=\"position:absolute; top:2px; left:3px;\" width=\"20\" height=\"20\" id=\"$${id}$$_prop\">";

var pattern=/\$\$\{id\}\$\$/g;
/* End Variable */

var w3c=(document.getElementById)? true: false;
var ns4=(document.layers)?true:false;
var ie5=(w3c && document.all)? true : false;
var ns6=(w3c && !document.all)? true: false;
var d=document;
currIDb=null; xoff=0; yoff=0;
currRS=null; rsxoff=0; rsyoff=0;
oldac=null; newac=null; zdx=1; mx=0; my=0;

function preloadBttns(){
var btns=new Array();
btns[0]=new Image(); btns[0].src="min0.gif";
btns[1]=new Image(); btns[1].src="max0.gif";
btns[2]=new Image(); btns[2].src="close0.gif";
btns[3]=new Image(); btns[3].src="resize.gif";
btns[4]=new Image(); btns[4].src="min1.gif";
btns[5]=new Image(); btns[5].src="max1.gif";
btns[6]=new Image(); btns[6].src="close1.gif";
}
preloadBttns();

function hidebox(id){
	//if(w3c){
	if(w3c && ns6){
		d.getElementById(id+'_b').style.display='none';
		d.getElementById(id+'_s').style.display='none';
	} 
	var objb=d.getElementById(id+'_b');
	var objs=d.getElementById(id+'_s');
	if(ie5) {
	    objb.style.filter="blendTrans(duration=1)";
		objs.style.filter="blendTrans(duration=1)";
		// Make sure filter is not playing.
		if ((objb.style.visibility != "hidden") && (objb.filters.blendTrans.status != 1)) {
			objb.filters.blendTrans.Apply();
			objs.filters.blendTrans.Apply();
			objb.style.visibility="hidden";
			objs.style.visibility="hidden";
			//obj.style.display="none";
			objb.filters.blendTrans.Play();
			objs.filters.blendTrans.Play();
			setTimeout("hideit('"+id+"')",200);
			//objb.style.display="none";
			//objs.style.display="none";
		}
	}
}

function hideit(id) {
	var objb=d.getElementById(id+'_b');
	var objs=d.getElementById(id+'_s');
	objb.style.display="none";
	objs.style.display="none";
	objb.style.visibility="visible";
	objs.style.visibility="visible";	
}

function showbox(id){
	if(w3c){
		var bx=d.getElementById(id+'_b').style;
		var sh=d.getElementById(id+'_s').style;		
		bx.display='block';
		sh.display='block';
		sh.zIndex=++zdx;
		bx.zIndex=++zdx;
	}
}

function minimize(){
	if(w3c){
		//d.getElementById(this.cid+"_b").style.height=(ie5)? '28px':'24px';
		//d.getElementById(this.cid+"_s").style.height='28px';
		d.getElementById(this.cid+"_b").style.height=(ie5)? '33px':'29px';
		d.getElementById(this.cid+"_s").style.height='33px';
		d.getElementById(this.cid+"_c").style.display='none';
		d.getElementById(this.cid+"_rs").style.display='none';
		ns6bugfix();
	}
}

function restore(){
	if(w3c){
		d.getElementById(this.cid+"_b").style.height=this.h+'px';
		//d.getElementById(this.cid+"_s").style.height=(ie5)? this.h+'px':this.h+5+'px';
		d.getElementById(this.cid+"_s").style.height=(ie5)? this.h+'px':this.h+4+'px';
		d.getElementById(this.cid+"_c").style.display='block';
		d.getElementById(this.cid+"_rs").style.display='block';
		ns6bugfix();
	}
}

function ns6bugfix(){
	if(ns6)
		setTimeout('self.resizeBy(0,1); self.resizeBy(0,-1);', 100);
}

function trackmouse(evt){
	mx=(ie5)?event.clientX+d.body.scrollLeft:evt.pageX;
	my=(ie5)?event.clientY+d.body.scrollTop:evt.pageY;
	if(!ns6)
		movepopup();
	if((currIDb!=null)||(currRS!=null))
		return false;
}

function movepopup(){
	if((currIDb!=null)&&w3c){
		var x=mx+xoff;
		var y=my+yoff;
		currIDb.style.left=x+'px';
		//currIDs.style.left=x+8+'px';
		currIDs.style.left=x+4+'px';
		currIDb.style.top=y+'px';
		//currIDs.style.top=y+8+'px';
		currIDs.style.top=y+4+'px';
	}
	if((currRS!=null)&&w3c){
		var rx=mx+rsxoff;
		var ry=my+rsyoff;
		var c=currRS;
		d.gEl=d.getElementById;
		d.gEl(c.cid+"_extWA").style.display="block";
		c.style.left=Math.max(rx,((ie5)?88:92))+'px';
		c.style.top=Math.max(ry,((ie5)?68:72))+'px';
		d.gEl(c.cid+"_b").style.width=Math.max(rx+((ie5)?12:8),100)+'px';
		d.gEl(c.cid+"_b").style.height=Math.max(ry+((ie5)?12:8),80)+'px';
		d.gEl(c.cid+"_t").style.width=Math.max(rx+((ie5)?4:3),((ns6)?95:92))+'px';
		// d.gEl(c.cid+"_btt").style.left=parseInt(d.gEl(c.cid+"_t").style.width)-48+'px';
		d.gEl(c.cid+"_btt").style.left=parseInt(d.gEl(c.cid+"_t").style.width)-68+'px';
		d.gEl(c.cid+"_s").style.width=Math.max(rx+12,((ie5)?100:104))+'px';
		d.gEl(c.cid+"_s").style.height=Math.max(ry+((ie5)?12:13),((ie5)?80:86))+'px';
		d.gEl(c.cid+"_c").style.width=Math.max(rx-((ie5)?-5:5),((ie5)?92:87))+'px';
		d.gEl(c.cid+"_c").style.height=Math.max(ry-((ie5)?24:28),44)+'px';
		d.gEl(c.cid+"_max").h=parseInt(d.gEl(c.cid+"_b").style.height);
	}
	return false;
}

function stopRS(){
	d.getElementById(this.cid+"_extWA").style.display="none";
	currRS=null;
}

function startRS(evt){ 
	var ex=(ie5)?event.clientX+d.body.scrollLeft:evt.pageX;
	var ey=(ie5)?event.clientY+d.body.scrollTop:evt.pageY;
	rsxoff=parseInt(this.style.left)-ex;
	rsyoff=parseInt(this.style.top)-ey;
	currRS=this;
	if(ns6)
		d.getElementById(this.cid+"_c").style.overflow='hidden';
	return false;
}

function changez(){
	if(oldac!=null)
		d.getElementById(oldac.cid+"_t").style.backgroundColor=oldac.inactivecolor;
	if(ns6)
		d.getElementById(this.cid+"_c").style.overflow='auto';
	oldac=this;
	d.getElementById(this.cid+"_t").style.backgroundColor=this.activecolor;
	d.getElementById(this.cid+"_s").style.zIndex=++zdx;
	this.style.zIndex=++zdx;
	d.getElementById(this.cid+"_rs").style.zIndex=++zdx;
}

function stopdrag(){
	currIDb=null;
	document.getElementById(this.cid+"_extWA").style.display="none";
	ns6bugfix();
}

function grab_id(evt){
	var ex=(ie5)?event.clientX+d.body.scrollLeft:evt.pageX;
	var ey=(ie5)?event.clientY+d.body.scrollTop:evt.pageY;
	xoff=parseInt(d.getElementById(this.cid+"_b").style.left)-ex;
	yoff=parseInt(d.getElementById(this.cid+"_b").style.top)-ey;
	currIDb=d.getElementById(this.cid+"_b");
	currIDs=d.getElementById(this.cid+"_s");
	d.getElementById(this.cid+"_extWA").style.display="block";
	return false;
}

function subBox(x,y,w,h,bgc,id){
	var v=d.createElement('div');
	v.setAttribute('id',id);
	v.style.position='absolute';
	v.style.left=x+'px';
	v.style.top=y+'px';
	v.style.width=w+'px';
	v.style.height=h+'px';
	if(bgc!='')v.style.backgroundColor=bgc;
	v.style.visibility='visible';
	v.style.padding='0px';
	return v;
}

function get_cookie(Name) {
	var search=Name+"=";
	var returnvalue="";
	if(d.cookie.length>0){
		offset=d.cookie.indexOf(search);
		if(offset!=-1){
			offset+=search.length;
			end=d.cookie.indexOf(";",offset);
			if(end==-1)
				end=d.cookie.length;
			returnvalue=unescape(d.cookie.substring(offset,end));
		}
	}
	return returnvalue;
}

function popUp(x,y,w,h,cid,text,bgcolor,textcolor,fontstyleset,title,titlecolor,titletextcolor,bordercolor,scrollcolor,shadowcolor,showonstart,isdrag,isresize,oldOK,isExt,popOnce){
	var okPopUp=false;
	if (popOnce){
		if (get_cookie(cid)==""){
			okPopUp=true;
			d.cookie=cid+"=yes";
		}
	}
	else 
		okPopUp=true;

	if(okPopUp){
		if(w3c){
			w=Math.max(w,100);
			h=Math.max(h,80);
			var rdiv=new subBox(w-((ie5)?12:8),h-((ie5)?12:8),7,7,'',cid+'_rs');
			if(isresize){
				rdiv.innerHTML='<img src="resize.gif" width="7" height="7">';
				rdiv.style.cursor='move';
			}
			var tw=(ie5)?w:w+4;
			var th=(ie5)?h:h+6;
			//var shadow=new subBox(x+8,y+8,tw,th,shadowcolor,cid+'_s');
			var shadow=new subBox(x+4,y+4,tw,th,shadowcolor,cid+'_s');
			if(ie5)
				shadow.style.filter="alpha(opacity=50)";
			else
				shadow.style.MozOpacity=.5;
			
			shadow.style.zIndex=++zdx;
			var outerdiv=new subBox(x,y,w,h,bordercolor,cid+'_b');
			outerdiv.style.borderStyle="outset";
			outerdiv.style.borderWidth="2px";
			outerdiv.style.borderColor=bordercolor;
			outerdiv.style.zIndex=++zdx;
			tw=(ie5)?w-8:w-5;
			th=(ie5)?h+4:h-4;
			var titlebar=new subBox(2,2,tw,25,titlecolor,cid+'_t');
			titlebar.style.overflow="hidden";
			titlebar.style.cursor="default";
			/* var tmp=(isresize)?'<img src="min0.gif" width="20" height="20" id="'+cid+'_min"><img src="max0.gif" width="20" height="20"  id="'+cid+'_max">':''; */
			var minStr=minIconStr.replace(pattern,cid);
			var maxStr=maxIconStr.replace(pattern,cid);
			var clsStr=clsIconStr.replace(pattern,cid);
			var propStr=propIconStr.replace(pattern,cid);
			
			var tmp=(isresize)?(minStr+maxStr):'';
			titlebar.innerHTML=propStr+'<span style="position:absolute; left:25px; top:4px; font:bold 10pt sans-serif; color:'+titletextcolor+'; height:25px; overflow:hidden; clip-height:20px;">'+title+'</span><div id="'+cid+'_btt" style="position:absolute; width:65px; height:25px; left:'+(tw-68)+'px; top:2px; text-align:right">'+tmp+clsStr+'</div>';
			//'<img src="close0.gif" width="20" height="20" id="'+cid+'_cls"></div>';
			tw=(ie5)?w-7:w-13;
			// var content=new subBox(2,24,tw,h-36,bgcolor,cid+'_c');
			//var content=new subBox(2,29,tw,h-42,bgcolor,cid+'_c');
			var content=null;
			if(isresize)
				content=new subBox(2,29,tw,h-42,bgcolor,cid+'_c');
			else
				content=new subBox(2,29,tw,h-36,bgcolor,cid+'_c');
			content.style.borderColor=bordercolor;
			content.style.borderWidth="2px";
			
			if(isExt){
				content.innerHTML='<iframe id="'+cid+'_ifrm" src="'+text+'" width="100%" height="100%"></iframe>';
				content.style.overflow="hidden";
			}else{
				if(ie5)
					content.style.scrollbarBaseColor=scrollcolor;
				content.style.borderStyle="inset";
				content.style.overflow="auto";
				content.style.padding="0px 2px 0px 4px";
				content.innerHTML=text;
				content.style.font=fontstyleset;
				content.style.color=textcolor;
			}
			
			var extWA=new subBox(2,24,0,0,'',cid+'_extWA');
			extWA.style.display="none";
			extWA.style.width='100%';
			extWA.style.height='100%';
			
			outerdiv.appendChild(titlebar);
			outerdiv.appendChild(content);
			outerdiv.appendChild(extWA);
			outerdiv.appendChild(rdiv);
			
			d.body.appendChild(shadow);
			d.body.appendChild(outerdiv);
			d.gEl=d.getElementById;
			
			if(!showonstart)
				hidebox(cid);
				
			var wB=d.gEl(cid+'_b');
			wB.cid=cid;
			var wT=d.gEl(cid+'_t');
			wT.cid=cid;
			if(isresize){
				var wRS=d.gEl(cid+'_rs');
				wRS.cid=cid;
				var wMIN=d.gEl(cid+'_min');
				wMIN.cid=cid;
				var wMAX=d.gEl(cid+'_max');
				wMAX.h=h;
				wMAX.cid=cid;
				wMIN.onclick=minimize;
				wMAX.onclick=restore;
				wRS.onmousedown=startRS;
				wRS.onmouseup=stopRS;
			}
			
			var wCLS=d.gEl(cid+'_cls'); //8
			var wEXTWA=d.gEl(cid+'_extWA'); //11
			wB.activecolor=titlecolor;
			wB.inactivecolor=scrollcolor;
			if(oldac!=null)
				d.gEl(oldac.cid+"_t").style.backgroundColor=oldac.inactivecolor;
			oldac=wB;
			wCLS.onclick=new Function("hidebox('"+cid+"');");
			wB.onmousedown = changez;
			if(isdrag){
				wT.onmousedown=grab_id;
				wT.onmouseup=stopdrag;
			}
		}else{  // w3c
			if(oldOK){
				var ctr=new Date();
				ctr=ctr.getTime();
				var t=(isExt)?text:'';
				var posn=(ns4)? 'screenX='+x+',screenY='+y: 'left='+x+',top='+y;
				var win=window.open(t , "abc"+ctr , "status=no,menubar=no,width="+w+",height="+h+",resizable="+((isresize)?"yes":"no")+",scrollbars=yes,"+posn);
				if(!isExt){
					t='<html><head><title>'+title+'</title></head><body bgcolor="'+bgcolor+'"><font style="font:'+fontstyleset+'; color:'+textcolor+'">'+text+'</font></body></html>';
					win.document.write(t);
					win.document.close();
				}
			}
		}
	}  // okPopUp
}

if(ns6)setInterval('movepopup()',40);

if(w3c){
	d.onmousemove=trackmouse;
	d.onmouseup=new Function("currRS=null");
}