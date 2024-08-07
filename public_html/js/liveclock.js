var my12_hour = 1;
var clock_old = "";

var DaysOfWeek = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
var MonthsOfYear = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

if (document.all||document.getElementById) {
	document.write('<span id="LiveClockIE" nowrap style="padding:0px;" valign="middle"></span>');
}
else if(document.layers) {
	document.write('<nobr><ilayer bgColor="'+myback_color+'" id="ClockPosNS"><layer width="1" id="LiveClockNS"></layer></ilayer></nobr>');
}
else {
	clock_old = "true";
	show_live_clock();
}

function show_live_clock()
{
	if (document.layers) document.ClockPosNS.visibility = "show";
	if (clock_old == "die") { return; }

	var AMPM = "";
	var timeSep = ":";
	var dateSep = "-";

	var Digital = new Date();
	var day = Digital.getDay();
	var hours = Digital.getHours();
	var minutes = Digital.getMinutes();
	var seconds = Digital.getSeconds();

	if (my12_hour) {
		AMPM = "AM";
		if (hours > 12) { AMPM = "PM"; hours = hours - 12; }
		if (hours == 0) { hours = 12;}
		if(hours == 12) { AMPM = "PM";}
	}

	if (minutes <= 9) { minutes = "0" + minutes; }
	if (seconds <= 9) { seconds = "0" + seconds; }

	var curr_date = Digital.getDate();
	var dateSupStr;
	if (curr_date == 1 || curr_date == 21 || curr_date ==31) {
	   dateSupStr = "st";
	}
	else if (curr_date == 2 || curr_date == 22) {
	   dateSupStr = "nd";
	}
	else if (curr_date == 3 || curr_date == 23) {
	   dateSupStr = "rd";
	}
	else {
	   dateSupStr = "th";
	}

	var updateTimer = 60000;
	var useDateSep = true;

	var myclock;
	// Changed for Hdfc bank to show application date with proper hours and minute. - By abhijit r
	//myclock	= DaysOfWeek[day] + ' ';
	myclock	=' ';
	/*if (useDateSep == true)
		myclock += curr_date + dateSep + MonthsOfYear[Digital.getMonth()] + dateSep + Digital.getFullYear();
	else
		myclock += curr_date + '<SUP>' + dateSupStr + '</SUP> ' + MonthsOfYear[Digital.getMonth()] + ' ' + Digital.getFullYear();
	*/
	if (updateTimer > 1000)
		myclock += ' ' + hours + timeSep + minutes + ' ' + AMPM;
	else
		myclock += ' ' + hours + timeSep + minutes + timeSep + seconds + ' ' + AMPM;

	if (clock_old == "true") { document.write(myclock); clock_old = "die"; return; }

	if (document.layers) {
		clockpos = document.ClockPosNS;
		liveclock = clockpos.document.LiveClockNS;
		liveclock.document.write(myclock);
		liveclock.document.close();
	}
	else if (document.all) {
		LiveClockIE.innerHTML = myclock;
	}
	else if (document.getElementById) {
		document.getElementById("LiveClockIE").innerHTML = myclock;
	}
	setTimeout("show_live_clock()", updateTimer);
}

