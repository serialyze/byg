<?php

/**
 * User - Category Posts Model
 *
 * @package		Solspace:User
 * @author		Solspace, Inc.
 * @copyright	Copyright (c) 2008-2016, Solspace, Inc.
 * @link		https://solspace.com/expressionengine/user
 * @license		https://solspace.com/software/license-agreement
 * @filesource	user/Model/CategoryPosts.php
 */

namespace Solspace\Addons\User\Model;

class CategoryPosts extends BaseModel
{
	protected static $_primary_key	= 'member_id';
	protected static $_table_name	= 'exp_user_category_posts';

	protected $member_id;
	protected $cat_id;
}
//END CategoryPosts