package limitlang.util;

import flixel.input.keyboard.FlxKey;

class Constants
{
	public static final CONTENT_FOLDER = 'content';

	public static final KEY_SUPPLEMENTS:Map<FlxKey, String> = [
		GRAVEACCENT => '`',
		ONE => '1',
		TWO => '2',
		THREE => '3',
		FOUR => '4',
		FIVE => '5',
		SIX => '6',
		SEVEN => '7',
		EIGHT => '8',
		NINE => '9',
		ZERO => '0',
		NUMPADONE => '1',
		NUMPADTWO => '2',
		NUMPADTHREE => '3',
		NUMPADFOUR => '4',
		NUMPADFIVE => '5',
		NUMPADSIX => '6',
		NUMPADSEVEN => '7',
		NUMPADEIGHT => '8',
		NUMPADNINE => '9',
		NUMPADZERO => '0',
		MINUS => '-',
		PLUS => '=',
		LBRACKET => '[',
		RBRACKET => ']',
		BACKSLASH => '\\',
		SEMICOLON => ';',
		QUOTE => '\'',
		COMMA => ',',
		PERIOD => '.',
		SLASH => '/',
		SPACE => ' ',
	];
	public static final KEY_SHIFT_SUPPLEMENTS:Map<FlxKey, String> = [
		GRAVEACCENT => '~',
		ONE => '!',
		TWO => '@',
		THREE => '#',
		FOUR => '$',
		FIVE => '%',
		SIX => '^',
		SEVEN => '&',
		EIGHT => '*',
		NINE => '(',
		ZERO => ')',
		MINUS => '_',
		PLUS => '+',
		LBRACKET => '{',
		RBRACKET => '}',
		BACKSLASH => '|',
		SEMICOLON => ':',
		QUOTE => '"',
		COMMA => '<',
		PERIOD => '>',
		SLASH => '?',
	];

	public static final FUNCTION_KEYS:Array<FlxKey> = [F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12];
}
