/*
date.js: useful extensions to the JavaScript Date object.
Copyright (C) 1999-2000 Jan Wessely <info@jawe.net>

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
Version 2 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA
or browse to http://www.gnu.org/copyleft/gpl.html.

created: 25 June 1998
last modified: 17 Jan 2000
*/

// literals *******************************************************************

// used as param unit in Date.add()
Date.MILLI = 1;
Date.SECOND = Date.MILLI * 1000;
Date.MINUTE = Date.SECOND * 60;
Date.HOUR = Date.MINUTE * 60;
Date.DAY = Date.HOUR * 24;
Date.MONTH = -1;
Date.YEAR = -2;

Date.DAYS_IN_MONTH = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

// methods ********************************************************************

function _Date_toCanonString()
{
	return this.getFullYear() +
			 _pad(this.getMonth() + 1) + 
			 _pad(this.getDate());
}

function _Date_getFullYear()
{
	var y = this.getYear();
	if(y < 100 && y > 0)
		y += 1900;
	return y;
}

function _Date_setFullYear(val)
{
	this.setYear(val);
}

function _Date_compareTo(other)
{
	return Date.compare(this, other);
}

function _Date_isLeapYear()
{
	return Date.leapYear(this.getFullYear());
}

function _Date_add(date, unit, amount)
{
	return Date.addDate(this, date, unit, amount);
}

function _Date_getDaysInMonth()
{
	return Date.daysInMonth(this.getFullYear(), this.getMonth());
}

// utility functions **********************************************************

function _isLeapYear(year)
{
	return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

function _compareDate(d1, d2)
{
	return (new Date(d1)).getTime() - (new Date(d2)).getTime();
}

function _addDate(date, unit, amount)
{
	if(unit == Date.MONTH)
	{	
	    var total_month = date.getMonth() + amount;
	    var inc_year = Math.floor(total_month/12);
	    var year = date.getFullYear() + inc_year;	    
	    var month = total_month - (12*inc_year);
	    var inc_day = date.getDate();
	    if (date.getDate() == _getDaysInMonth(date.getFullYear(), date.getMonth())) {
	        inc_day = _getDaysInMonth(year, month);
        }           
        if (inc_day > _getDaysInMonth(year, month)) {
            inc_day = _getDaysInMonth(year, month);           
        }                
	    //alert (year + ":" + month + ":" + inc_day); 
	    date = new Date(year, month, inc_day);
        //date.setMonth(date.getMonth() + amount);		    		
    }
	else if(unit == Date.YEAR) {
		//date.setFullYear(date.getFullYear() + amount);
		var month = date.getMonth();	    
	    var year = date.getFullYear() + amount;	    	    
	    var inc_day = date.getDate();
	    if (date.getDate() == _getDaysInMonth(date.getFullYear(), date.getMonth())) {
	        inc_day = _getDaysInMonth(year, month);
        }           
        if (inc_day > _getDaysInMonth(year, month)) {
            inc_day = _getDaysInMonth(year, month);           
        }                
	    //alert (year + ":" + month + ":" + inc_day); 
	    date = new Date(year, month, inc_day);
	}
	else
		date.setTime(date.getTime() + unit * amount);
	return date;
}

function _getDaysInMonth(year, month)
{
	return month == 1 && Date.leapYear(year) ? 29 : Date.DAYS_IN_MONTH[month];
}

function _pad(n)
{
	return (n < 10 ? "0" : "") + n;
}

// initialization *************************************************************

Date.prototype.toCanonString = _Date_toCanonString;
if(!Date.prototype.getFullYear)
{
	Date.prototype.getFullYear = _Date_getFullYear;
	Date.prototype.setFullYear = _Date_setFullYear;
}
Date.prototype.isLeapYear = _Date_isLeapYear;
Date.prototype.compareTo = _Date_compareTo;
Date.prototype.add = _Date_add;
Date.prototype.getDaysInMonth = _Date_getDaysInMonth;

Date.leapYear = _isLeapYear;
Date.compare = _compareDate;
Date.addDate = _addDate;
Date.daysInMonth = _getDaysInMonth;

 months = new Array();
 months['Jan'] = 0;
 months['Feb'] = 1;
 months['Mar'] = 2;
 months['Apr'] = 3;
 months['May'] = 4;
 months['Jun'] = 5;
 months['Jul'] = 6;
 months['Aug'] = 7;
 months['Sep'] = 8;
 months['Oct'] = 9;
 months['Nov'] = 10;
 months['Dec'] = 11;

 month = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');



function calculateNextDate(originalDate, period, periodUnit) {
	returnDate = new Date();
	if (periodUnit == 'D') {
			returnDate = originalDate.add(Date.DAY, period);
	}
	if (periodUnit == 'W') {
			returnDate = originalDate.add(Date.DAY, (period * 7));
	}
	if (periodUnit == 'M') {
			returnDate = originalDate.add(Date.MONTH, period);
	}
	if (periodUnit == 'Y') {
			returnDate = originalDate.add(Date.YEAR, period);
	}
	returnDate = returnDate.add(Date.DAY, 0);   // need to deduct 1 day coz number of valid days is inclusive of doc end date.
	return returnDate;
}

function convertStrToDate(strDate) {
	return new Date(strDate.substring(7,11), months[strDate.substring(3,6)], strDate.substring(0,2));
}

function convertDateToStr(dateObj) {
	strDate = "";
	if (dateObj.getDate() < 10) {
		strDate = "0";
	}
	strDate = strDate + dateObj.getDate() + "/" + month[dateObj.getMonth()] + "/" + dateObj.getFullYear();
	return strDate;
}

function calculateDaysDiff (date1, date2) {
	var diff = 0;
	if (date1 != null && date2 != null) {
		diff = date2 - date1;
		diff = Math.round(diff/1000/60/60/24);
		if (diff < 0 )
			diff = diff * -1;
	}
	return diff;
}

function clearTime(dateObj) {
	dateObj.setHours(0);
	dateObj.setMinutes(0);
	dateObj.setSeconds(0);
	dateObj.setMilliseconds(0);
	return dateObj;
}
