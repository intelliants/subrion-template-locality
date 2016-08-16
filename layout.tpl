<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS {$core.config.version} - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>

	<body class="page-{$core.page.name}">
		<header class="clearfix">
			<div class="container">
				<a class="brand" href="{$smarty.const.IA_URL}">
					{if !empty($core.config.site_logo)}
						<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
					{else}
						<img src="{$img}logo.png" alt="{$core.config.site}">
					{/if}
				</a>

				<a href="{$smarty.const.IA_URL}add/" class="btn btn-success btn-add"><i class="fa fa-plus-circle"></i> <span>Get listed</span></a>

				{include file='language-selector.tpl'}

				{ia_blocks block='account'}
				{ia_blocks block='inventory'}
			</div>
		</header>

		<nav  class="clearfix">
			<div class="container">
				<a href="#" class="navbar-toggle collapsed pull-left" data-toggle="collapse" data-target="#navbar-collapse"><i class="icon-reorder"></i></a>

				<form id="fast-search" method="post" action="{$smarty.const.IA_URL}search/" class="form-inline">
					<div class="wrp">
						<input type="text" name="q" placeholder="{lang key='search'}" class="span2">
						<button type="submit"><i class="fa fa-search"></i></button>
					</div>
				</form>

				{ia_blocks block='change_location'}
			
				<div id="navbar-collapse">
					{ia_blocks block='mainmenu'}
				</div>
			</div>
		</nav>

		<section class="section section--teaser{if 'index' != $core.page.name} section--teaser--inner{/if}">
			<div class="container">
				{ia_blocks block='header'}
			</div>
		</section>

		{if isset($iaBlocks.after_header_1) || 
			isset($iaBlocks.after_header_2) || 
			isset($iaBlocks.after_header_3)}
			<section id="after-header" class="section section-dark top-headlines">
				<div class="container">
					<div class="row">
						<div class="{width section='after-header' position='after_header_1' tag='col-md-'}">
							{ia_blocks block='after_header_1'}
						</div>
						<div class="{width section='after-header' position='after_header_2' tag='col-md-'}">
							{ia_blocks block='after_header_2'}
						</div>
						<div class="{width section='after-header' position='after_header_3' tag='col-md-'}">
							{ia_blocks block='after_header_3'}
						</div>
					</div>
				</div>
			</section>
		{/if}

		{if isset($iaBlocks.verytop)}
			<div class="section section-light">
				<div class="container">
					{ia_blocks block='verytop'}
				</div>
			</div>
		{/if}

		{ia_hooker name='smartyFrontBeforeBreadcrumb'}

		{include 'breadcrumb.tpl'}


		<div class="content">
			<div class="container">
				<div class="row">
					<div class="{width section='content' position='center' tag='col-md-'}">
						<div class="content__wrap">

							{ia_blocks block='top'}

							<div class="content__header">
								<h1>{$core.page.title}</h1>
								<ul class="content__actions">
									{foreach $core.actions as $name => $action}
										<li>
											{if 'action-favorites' == $name}
												{printFavorites item=$item itemtype=$item.item guests=true}
											{else}
												<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
													<span class="fa fa-{$name}"></span>
												</a>
											{/if}
										</li>
									{/foreach}
								</ul>
							</div>

							{ia_hooker name='smartyFrontBeforeNotifications'}
							{include 'notification.tpl'}

							{ia_hooker name='smartyFrontBeforeMainContent'}

							<div class="content__body">
								{$_content_}
							</div>

							{ia_hooker name='smartyFrontAfterMainContent'}

							{ia_blocks block='bottom'}

							{if isset($iaBlocks.user1) || isset($iaBlocks.user2)}
								<div class="row">
									<div class="{width section='user-blocks' position='user1' tag='col-md-'}">{ia_blocks block='user1'}</div>
									<div class="{width section='user-blocks' position='user2' tag='col-md-'}">{ia_blocks block='user2'}</div>
								</div>
							{/if}
						</div>
					</div>
					<div class="{width section='content' position='right' tag='col-md-'} aside">
						{ia_blocks block='right'}
					</div>
				</div>
			</div>
		</div>

		{if isset($iaBlocks.verybottom)}
			<div class="section section-light">
				<div class="container">{ia_blocks block='verybottom'}</div>
			</div>
		{/if}

		<section class="section section--footer-blocks">
			<div class="container">
				<div class="row">
					<div class="{width section='footer' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
					<div class="{width section='footer' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
					<div class="{width section='footer' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
					<div class="{width section='footer' position='footer4' tag='col-md-'}">{ia_blocks block='footer4'}</div>
				</div>

				<div class="section section--footer">
					{ia_hooker name='smartyFrontBeforeFooterLinks'}

					<div class="row">
						<div class="col-sm-4">
							<p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>
						</div>
						<div class="col-sm-8">
							{ia_blocks block='copyright'}
						</div>
					</div>

					{ia_hooker name='smartyFrontAfterFooterLinks'}
				</div>
			</div>
		</section>

		<!-- SYSTEM STUFF -->

		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include 'visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>