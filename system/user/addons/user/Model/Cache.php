<?php

/**
 * User - Cache Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/Cache.php
 */

namespace Solspace\Addons\User\Model;

class Cache extends BaseModel
{
	protected static $_primary_key	= 'cache_id';
	protected static $_table_name	= 'exp_user_cache';

	protected $cache_id;
	protected $type;
	protected $entry_date;
	protected $data;
}
//END Cache