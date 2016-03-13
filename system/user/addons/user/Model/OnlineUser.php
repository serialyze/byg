<?php

/**
 * User - Online User Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/OnlineUser.php
 */

namespace Solspace\Addons\User\Model;

class OnlineUser extends BaseModel
{
	protected static $_primary_key	= 'online_id';
	protected static $_table_name	= 'exp_online_users';

	protected $online_id;
	protected $site_id;
	protected $member_id;
	protected $in_forum;
	protected $name;
	protected $ip_address;
	protected $date;
	protected $anon;
}
//END OnlineUser