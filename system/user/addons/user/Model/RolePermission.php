<?php

/**
 * User - Role Permission Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/RolePermission.php
 */

namespace Solspace\Addons\User\Model;

class RolePermission extends BaseModel
{
	protected static $_primary_key	= 'permission_id';
	protected static $_table_name	= 'exp_user_roles_permissions';

	protected $permission_id;
	protected $permission_label;
	protected $permission_name;
	protected $permission_description;
}
//END RolePermission