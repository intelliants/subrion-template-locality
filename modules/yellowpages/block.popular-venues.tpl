{if !empty($popularVenues)}
	<div class="row yp-listings">
		{foreach $popularVenues as $entry}
			<div class="col-md-3">
				<div class="yp-listings__b">
					<a href="{ia_url item='venues' type='url' data=$entry}" class="yp-listings__b__image">
						{ia_image file=$entry.image title=$entry.venue_title type='large' class='img-responsive'}
					</a>

					<div class="yp-listings__b__body">
						{ia_hooker name='smartyItemBlockBeforeTitle'}
						<h4 class="yp-listings__b__title">{ia_url type='link' item='venues' data=$entry text=$entry.venue_title}</h4>
						<p>
							<i class="fa fa-map-marker"></i> {$entry.address},
							{ia_url item='ylocs' type='link' data=$entry text=$entry.location}
							{if !empty($entry.zipcode)}, {$entry.zipcode}{/if}
						</p>
						<p><i class="fa fa-phone"></i> {$entry.phone}</p>
					</div>
				</div>
			</div>

			{if $entry@iteration % 4 == 0}
				</div>
				<div class="row yp-listings">
			{/if}
		{/foreach}
	</div>
{/if}