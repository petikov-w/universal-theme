<form class="search-form" role="search" method="get" id="searchform" action="<?php echo home_url( '/' ) ?>" >
	<input type="text" class="search-input" placeholder="Поиск" value="<?php echo get_search_query() ?>" name="s" id="s" />
	<button type="submit" class="search-button" id="searchsubmit"></button>
</form>