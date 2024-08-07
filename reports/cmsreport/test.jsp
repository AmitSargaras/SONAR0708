

<% String name; %>

<% String path = "2006-07-28"; %>

<% name = "coupon.jpg"; %>
<br><a href="GetReport.image?name=<%= name %>&path=<%= path %>&sid=1234"><%= name %></a>

<% name = "DHK20060724204352CCDocDeferred.pdf"; %>
<br><a href="GetReport.image?name=<%= name %>&path=<%= path %>&sid=4567"><%= name %></a>

<% name = "DHK20060724203935CCDocDeferred_xls.xls"; %>
<br><a href="GetReport.image?name=<%= name %>&path=<%= path %>&sid=2345"><%= name %></a>

<% name = "05mb.pdf"; %>
<br><a href="GetReport.image?name=<%= name %>&path=<%= path %>&sid=5678"><%= name %></a>

<% name = "13mb.pdf"; %>
<br><a href="GetReport.image?name=<%= name %>&path=<%= path %>&sid=6789"><%= name %></a>

<% name = "notfound.pdf"; %>
<br><a href="GetReport.image?name=<%= name %>&path=<%= path %>&sid=3456"><%= name %></a>
