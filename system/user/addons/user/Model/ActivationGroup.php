<?php

/**
 * User - Activation Group Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/ActivationGroup.php
 */

namespace Solspace\Addons\User\Model;

class ActivationGroup extends BaseModel
{
	protected static $_primary_key	= 'member_id';
	protected static $_table_name	= 'exp_user_activation_group';

	protected $member_id;
	protected $group_id;
}
//END ActivationGroup