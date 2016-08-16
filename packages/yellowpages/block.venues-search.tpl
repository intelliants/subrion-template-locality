{if 'index' == $core.page.name}
	<div class="row">
		<div class="col-md-8">
			<div class="headline">
				<h2>{lang key='header_title'}</h2>
				<p>{lang key='header_subtitle'}</p>
			</div>
		</div>
		<div class="col-md-4">
			<div class="b-srch">
				<form action="{$smarty.const.IA_URL}venues/search/" method="get" class="ia-form yp-search-venues">
					<label for="search_key">{lang key='search_for'}:</label>
					<input class="form-control" type="text" name="search" id="search_key" value="{$ypSearchInfo.term}">
					<div class="row">
						<div class="col-md-8">
							<label for="search_loc">{lang key='near'}:</label>
							<input class="form-control" type="text" name="loc" id="search_loc" autocomplete="off" value="{$ypSearchInfo.location}" data-location="{$ypSearchInfo.location}">
						</div>
						<div class="col-md-4">
							<label>&nbsp;</label>
							<button type="submit" class="btn btn-primary btn-block"><span class="fa fa-search"></span> {lang key='search'} </button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
{else}
	<div class="b-srch b-srch--inner">
		<form action="{$smarty.const.IA_URL}venues/search/" method="get" class="ia-form yp-search-venues">
			<div class="row">
				<div class="col-md-5">
					<label for="search_key">{lang key='search_for'}:</label>
					<input class="form-control" type="text" name="search" id="search_key" value="{$ypSearchInfo.term}">
				</div>
				<div class="col-md-5">
					<label for="search_loc">{lang key='near'}:</label>
					<input class="form-control" type="text" name="loc" id="search_loc" autocomplete="off" value="{$ypSearchInfo.location}" data-location="{$ypSearchInfo.location}">
				</div>
				<div class="col-md-2">
					<label>&nbsp;</label>
					<button type="submit" class="btn btn-primary btn-block"><span class="fa fa-search"></span> {lang key='search'} </button>
				</div>
			</div>
		</form>
	</div>
{/if}

{ia_add_js}
$(function()
{
	$('#search_loc')
	.typeahead(
	{
		source: function(query, process)
		{
			listings = { };

			return $.ajax(
			{
				url: intelli.config.packages.yellowpages.url + 'yellowpages/read.json',
				type: 'get',
				dataType: 'json',
				data: { action: 'autocomplete', q: query },
				success: function(data)
				{
					var display = [];

					$.each(data, function (i, listing)
					{
						listings[listing.title] = listing;
						display.push(listing.title);
					});

					return process(display);
				}
			});
		}
	})
});
{/ia_add_js}
