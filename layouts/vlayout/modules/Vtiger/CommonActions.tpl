﻿{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}

{strip}
    {assign var="announcement" value=$ANNOUNCEMENT->get('announcement')}
    {assign var='count' value=0}
    {assign var="dateFormat" value=$USER_MODEL->get('date_format')}
	
	<div class="navbar-form navbar-right">
		<div class="dropdown quickActions historyBtn">
			<a data-placement="left" data-toggle="dropdown" class="showHistoryBtn" aria-expanded="false" href="#"><img class='alignMiddle popoverTooltip' src="{vimage_path('history.png')}" alt="{vtranslate('LBL_PAGES_HISTORY',$MODULE)}" class="dropdown-toggle" data-content="{vtranslate('LBL_PAGES_HISTORY')}" /></a>
		</div>	
	</div>
	<div class="navbar-form navbar-right">
		<div class="dropdown quickActions">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"><img id="menubar_quickCreate" src="{vimage_path('plus.png')}" class="alignMiddle" alt="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" title="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" /></a>
			<ul class="dropdown-menu dropdown-menu-right dropdownStyles commonActionsButtonDropDown">
				<li class="title"><strong>{vtranslate('LBL_QUICK_CREATE',$MODULE)}</strong></li><hr/>
				<li id="quickCreateModules">
					<div class="row">
						<div class="col-md-12">
							{foreach key=NAME item=MODULEMODEL from=Vtiger_Module_Model::getQuickCreateModules(true)}
								{assign var='quickCreateModule' value=$MODULEMODEL->isQuickCreateSupported()}
								{assign var='singularLabel' value=$MODULEMODEL->getSingularLabelKey()}
								{if $singularLabel == 'SINGLE_Calendar'}
									{assign var='singularLabel' value='LBL_EVENT_OR_TASK'}
								{/if}	
								{if $quickCreateModule == '1'}
									{if $count % 3 == 0}
										<div class="row">
									{/if}
									<div class="col-md-4">
										<a id="menubar_quickCreate_{$NAME}" class="quickCreateModule" data-name="{$NAME}"
										   data-url="{$MODULEMODEL->getQuickCreateUrl()}" href="javascript:void(0)" title="{vtranslate($singularLabel,$NAME)}">{vtranslate($singularLabel,$NAME)}</a>
									</div>
									{if $count % 3 == 2}
										</div>
									{/if}
									{assign var='count' value=$count+1}
								{/if}
							{/foreach}
						</div>
					</div>
				</li>
			</ul>
		</div>	
	</div>
	{if !empty($announcement)}
		<div class="navbar-form navbar-right">
			<div class="quickActions">
				<a href="#"><img class='alignMiddle' src="{vimage_path('btnAnnounceOff.png')}" alt="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" title="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" id="announcementBtn" /></a>
			</div>	
		</div>
	{/if}
	<div class="navbar-form navbar-left">
		<div class="quickActions">
			<a id="companyLogo-container" class="" href="#"><img src="{$COMPANY_LOGO->get('imagepath')}" title="{$COMPANY_LOGO->get('title')}" alt="{$COMPANY_LOGO->get('alt')}"/></a>
		</div>	
	</div>	
	<div class="select-search navbar-form navbar-left " style="width: 216px;">
		<select class="chzn-select col-md-5" title="{vtranslate('LBL_SEARCH_MODULE', $MODULE_NAME)}" id="basicSearchModulesList" >
			<option value="" class="globalSearch_module_All">{vtranslate('LBL_ALL_RECORDS', $MODULE_NAME)}</option>
			{foreach key=MODULE_NAME item=fieldObject from=$SEARCHABLE_MODULES}
				{if isset($SEARCHED_MODULE) && $SEARCHED_MODULE eq $MODULE_NAME && $SEARCHED_MODULE !== 'All'}
					<option value="{$MODULE_NAME}" class="globalSearch_module_{$MODULE_NAME}" selected>{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
				{else}
					<option value="{$MODULE_NAME}" class="globalSearch_module_{$MODULE_NAME}">{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
				{/if}
			{/foreach}
		</select>
	</div>
	<div role="search" class="navbar-form navbar-left">
		<div class="form-group">          
			<div class="input-group">
				<input type="text"  class="form-control" title="{vtranslate('LBL_GLOBAL_SEARCH')}" id="globalSearchValue" placeholder="{vtranslate('LBL_GLOBAL_SEARCH')}" results="10" />
				<span id="searchIcon" class="input-group-addon cursorPointer"><span class="glyphicon glyphicon-search "></span></span>
				<span class="adv-search navbar-form pull-left">
					<a class="alignMiddle" id="globalSearch">{vtranslate('LBL_ADVANCE_SEARCH')}</a>
				</span>
			</div>
		</div>
	</div>	
		
	{assign var="BREADCRUMBS" value=Vtiger_Menu_Model::getBreadcrumbs()}
	{if $BREADCRUMBS}
		<div class="breadcrumbsContainer col-md-12" style="display: none;">
			<div class="breadcrumbsLinks">
			{foreach key=key item=item from=$BREADCRUMBS}
				{if $key != 0}
					<span class="separator">&nbsp;{vglobal('breadcrumbs_separator')}&nbsp;</span>
				{/if}
				<span>{$item['name']}</span>
			{/foreach}
			</div>
		</div>
	{/if}
	{assign var="MENUSCOLOR" value=Users_Colors_Model::getModulesColors(true)}
	{if $MENUSCOLOR}
		<div class="menusColorContainer" style="display: none;">
			<style>
			{foreach item=item from=$MENUSCOLOR}
				.moduleColor_{$item.module}{
					color: {$item.color} !important;
				}
				.moduleIcon{$item.module}{
					background: {$item.color} !important;
				}
			{/foreach}
			</style>
		</div>
	{/if}

{/strip}
