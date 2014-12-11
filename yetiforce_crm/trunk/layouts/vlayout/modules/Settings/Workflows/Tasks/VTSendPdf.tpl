{strip}
	{assign var=PDF_TPL value=OSSPdf_Module_Model::getListTpl($SOURCE_MODULE)}
	{assign var=MAIL_TPL value=OSSMailTemplates_Record_Model::getTempleteList($SOURCE_MODULE)}

	<div class="well" id="VtVTEmailTemplateTaskContainer">
		<div class="row-fluid">
			<span class="span4">{vtranslate('LBL_TEMPLATES', 'OSSPdf')}</span>
			<div class="row-fluid padding-bottom1per">
				<select class="chzn-select span4" name="pdf_tpl" data-validation-engine="validate[required]">
					<option value="none"></option>

					{foreach from=$PDF_TPL key=key item=item}
						<option {if $TASK_OBJECT->pdf_tpl eq $item.id}selected{/if} value="{$item.id}">{$item.name}</option>
					{/foreach}
				</select>
			</div>
		</div>
		<div class="row-fluid">
			<span class="span4">{vtranslate('MAIL_TPL_LIST', $QUALIFIED_MODULE)}</span>
			<div class="row-fluid padding-bottom1per">
				<select class="chzn-select span4" name="email_tpl">
					<option value="none"></option>
					{foreach from=$MAIL_TPL key=key item=item}
						<option {if $TASK_OBJECT->email_tpl eq $item.ossmailtemplatesid}selected{/if} value="{$item.ossmailtemplatesid}">{$item.name}</option>
					{/foreach}
				</select>
			</div>
		</div>
		<div class="row-fluid padding-bottom1per">
			<span class="span4">{vtranslate('Select e-mail address', $QUALIFIED_MODULE)}</span>
			<select class="chzn-select span4" name="email_fld" data-placeholder="{vtranslate('LBL_SELECT_FIELD',$QUALIFIED_MODULE)}" data-validation-engine="validate[required]">
				<option value="none"></option>
				{assign var=RECORD_STRUCTURE_TYPE value=$RECORD_STRUCTURE_MODEL->getStructure('email')}
				{foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$RECORD_STRUCTURE_TYPE }
					<optgroup label='{vtranslate($BLOCK_LABEL, $SELECTED_MODULE_NAME)}'>
						{foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS}
							{assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
							{assign var=MODULE_MODEL value=$FIELD_MODEL->getModule()}
							{assign var=KEYVAL value=$FIELD_MODEL->get(selectOption)}
							<option value="{$KEYVAL}" {if $TASK_OBJECT->email eq $KEYVAL}selected=""{/if}>
								{if $SELECTED_MODULE_NAME neq $MODULE_MODEL->get('name')} 
									({vtranslate($MODULE_MODEL->get('name'), $MODULE_MODEL->get('name'))})  {vtranslate($FIELD_MODEL->get('label'), $MODULE_MODEL->get('name'))}
								{else}
									{vtranslate($FIELD_MODEL->get('label'), $SELECTED_MODULE_NAME)}
								{/if}
							</option>
						{/foreach}
					</optgroup>
				{/foreach}
			</select>
		</div>
	</div>

{/strip}