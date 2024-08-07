function sortOption(selectPool, select) {
		var i = selectPool.options.length-1;
			while (i > 0 && (selectPool.options[i].text < selectPool.options[i-1].text )) {
				var option = selectPool.options[i];
				var option2 = selectPool.options[i-1];
				selectPool.options[i] = new Option(option2.text, option2.value);
				selectPool.options[i-1] = new Option(option.text, option.value);
				i--;
			}
	}
	

function onAdd(selectPool, select) {
		for (index = 0; index < selectPool.options.length; index++) {
			
			var option = selectPool.options[index];
			if (option.selected) {
				
				select.options.add (new Option (option.text, option.value));
				
				selectPool.remove (index);
		
                sortOption(select,selectPool);
               
				index --;

			}
		}
	}

function onRemove(selectPool, select) {

		for (index = 0; index < select.options.length; index++) {
            var option = select.options[index];
			if (option.selected) {
				selectPool.options.add (new Option (option.text, option.value));
				select.remove (index);
				index--;


			}
		}
	}
