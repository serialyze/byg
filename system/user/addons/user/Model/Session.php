<?php

/**
 * User - Session Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/Session.php
 */

namespace Solspace\Addons\User\Model;

class Session extends BaseModel
{
	protected static $_primary_key = 'session_id';
	protected static $_table_name = 'sessions';

	protected $session_id;
	protected $member_id;
	protected $admin_sess;
	protected $ip_address;
	protected $user_agent;
	protected $fingerprint;
	protected $sess_start;
	protected $last_activity;

}
//END Session