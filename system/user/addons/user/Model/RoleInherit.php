<?php

/**
 * User - Role Inherit Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/RoleInherit.php
 */

namespace Solspace\Addons\User\Model;

class RoleInherit extends BaseModel
{
	protected static $_primary_key	= 'inherits_id';
	protected static $_table_name	= 'exp_user_roles_inherits';

	protected $inherits_id;
	protected $inheriting_role_id;
	protected $from_role_id;
}
//END RoleInherit