<%
    String td = (String)request.getAttribute("todoCount");    
    //String ncc = (String)request.getAttribute("newCustomerCount");
    String nbc = (String)request.getAttribute("newBorrowerCount");
    String nnbc = (String)request.getAttribute("newNonBorrowerCount");
    String nc = (String)request.getAttribute("notificationCount");
    String dc = (String) request.getAttribute("diaryItemDueCount");

    int todoCount = 0;
    //int newCustomerCount = 0;
    int newBorrowerCount = 0;
    int newNonBorrowerCount = 0;
    int notificationCount = 0;
    int diaryItemDueCount = 0;
    if (td != null) {
        todoCount = Integer.parseInt(td);
    }
    /*if (ncc != null) {
        newCustomerCount = Integer.parseInt(ncc);
    }*/
    if (nbc != null) {
        newBorrowerCount = Integer.parseInt(nbc);
    }
    if (nnbc != null) {
        newNonBorrowerCount = Integer.parseInt(nnbc);
    }
    if (nc != null) {
		notificationCount = Integer.parseInt(nc);
    }
    if (dc != null) {
        diaryItemDueCount = Integer.parseInt(dc);
    }

%>
<?xml version="1.0"?>
<xmlcounter>
<aj_notification>You have <%= nc %> item(s)</aj_notification>
<aj_diarylist>You have <%= dc %> diary item(s) expiring today</aj_diarylist>
<aj_borrowing>You have <%= nbc %> item(s)</aj_borrowing>
<aj_nonborrowing>You have <%= nnbc %> item(s)</aj_nonborrowing>
<aj_item>You have <%= td %> item(s)</aj_item>
</xmlcounter>