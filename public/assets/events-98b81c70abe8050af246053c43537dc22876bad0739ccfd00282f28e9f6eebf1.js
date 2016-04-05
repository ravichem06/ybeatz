


$(".view a[href='#grid']").click(function() {
		 	$('#upcoming-events').removeClass('list-style');
		 	$('#upcoming-events').addClass('grid-style');

		 	$(this).parent().find('a').removeClass('current');
		 	$(this).addClass('current');
		 	return false;
		 });

		 $(".view a[href='#list']").click(function() {
		 	$('#upcoming-events').addClass('list-style');
		 	$('#upcoming-events').removeClass('grid-style');

		 	$(this).parent().find('a').removeClass('current');
		 	$(this).addClass('current');
		 	return false;
		 });
