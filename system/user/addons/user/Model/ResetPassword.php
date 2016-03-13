<?php

/**
 * User - Reset Password Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/ResetPassword.php
 */

namespace Solspace\Addons\User\Model;

class ResetPassword extends BaseModel
{
	protected static $_primary_key = 'reset_id';
	protected static $_table_name = 'reset_password';

	protected $reset_id;
	protected $member_id;
	protected $resetcode;
	protected $date;
}
//END ResetPassword