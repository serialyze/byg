<?php

/**
 * User - Role Entry Permission Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/RoleEntryPermission.php
 */

namespace Solspace\Addons\User\Model;

class RoleEntryPermission extends BaseModel
{
	protected static $_primary_key	= 'id';
	protected static $_table_name	= 'exp_user_roles_entry_permissions';

	protected $id;
	protected $entry_id;
	protected $field_id;
	protected $set_id;
	protected $role_id;
	protected $author_id;
	
	protected static $_relationships = array(
		'Role' => array(
			'model'		=> 'Role',
			'type'		=> 'BelongsTo',
			'from_key'	=> 'role_id',
			'to_key'	=> 'role_id'
		)
	);
}
//END RoleEntryPermission