function time(){
    var d = new Date();
        dd = d.getDate();
        m = d.getMonth();
        yy = d.getYear();

    if(m == 0)  {
            month = "Jan";
        }
    else if(m == 1)  { 
            month = "Feb";
        }
    else if(m == 2)  { 
            month = "Mar";
        }
    else if(m == 3)  { 
            month = "Apr";
        }
    else if(m == 4)  { 
            month = "May";
        }
    else if(m == 5)  { 
            month = "Jun";
        }
    else if(m == 6)  { 
            month = "Jul";
        }
    else if(m == 7)  { 
            month = "Aug";
        }
    else if(m == 8)  { 
            month = "Sep";
        }
    else if(m == 9)  { 
            month = "Oct";
        }
    else if(m == 10)  { 
            month = "Nov";
        }
    else  { 
            month = "Dec";
        }

  pBrowser = navigator.appName;
  if (pBrowser == "Netscape")
  {
    var result = dd + " " + month + " " + (1900 + yy);
  }
  else
    var result = dd + " " + month + " " + yy;
       var min = d.getMinutes();
        if (min < 10)
        {    min = "0" + min;  }

        var AMPM = " AM";
        var hh = d.getHours();
        if (hh >= 12)
        {
            AMPM = " PM";
            if (hh > 12)
            { hh = hh - 12}
        }
        else
        {   AMPM = "&nbsp; AM";    }
        result += " " + hh + ":" + min + AMPM;
        document.writeln(result);
}
