<?php

namespace EllisLab\ExpressionEngine\Service\View;

use EllisLab\ExpressionEngine\Core\Provider;

/**
 * ExpressionEngine - by EllisLab
 *
 * @package		ExpressionEngine
 * @author		EllisLab Dev Team
 * @copyright	Copyright (c) 2003 - 2014, EllisLab, Inc.
 * @license		https://ellislab.com/expressionengine/user-guide/license.html
 * @link		http://ellislab.com
 * @since		Version 3.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * ExpressionEngine ViewFactory Class
 *
 * @package		ExpressionEngine
 * @category	Service
 * @author		EllisLab Dev Team
 * @link		http://ellislab.com
 */
class ViewFactory {

	/**
	 * @var EllisLab\ExpressionEngine\Core\Provider
	 */
	protected $provider;

	/**
	 * Constructor
	 *
	 * @param Provider $provider The default provider for views
	 */
	public function __construct(Provider $provider)
	{
		$this->provider = $provider;
	}

	/**
	 * This will make and return a Service\View object
	 *
	 * @param str $path The path to the view template file (ex: '_shared/form')
	 * @return obj A EllisLab\ExpressionEngine\Service\View\View object
	 */
	public function make($path)
	{
		$provider = $this->provider;

		if (strpos($path, ':'))
		{
			list($prefix, $path) = explode(':', $path, 2);
			$provider = $provider->make('App')->get($prefix);
		}

		return new View($path, $provider);
	}

	/**
	* This will make and return a Service\View\StringView object
	*
	* @param str $string The contents of the unrendered view
	* @return object EllisLab\ExpressionEngine\Service\View\StringView
	*/
	public function makeFromString($string)
	{
		return new StringView($string);
	}

}
// EOF
