<script>
	window.onload = function(){
		var form = document.createElement("form");
		form.method = "post";
		form.action = "ImageUploadAdd.do?event=save_image_upload&newSession=Y";
	    document.body.appendChild(form);
	    form.submit();
	}
</script>
</html>
