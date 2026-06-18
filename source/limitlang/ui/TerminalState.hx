package limitlang.ui;

import limitlang.util.Constants;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class TerminalState extends FlxState
{
	var inputText:FlxText;

	override function create()
	{
		super.create();

		inputText = new FlxText(0, 0, FlxG.width, 'inputText', 16);
		add(inputText);

		backspaceTmr = backspaceTmrStart;
	}

	final backspaceTmrStart:Int = 300;
	final backspaceTmrDecrease:Int = 10;
	var backspaceTmr:Int = 0;

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		inputText.y = FlxG.height - inputText.height;

		if (FlxG.keys.justPressed.ANY)
		{
			var key:FlxKey = FlxG.keys.firstJustPressed();

			onKey(key);
		}

		if (FlxG.keys.pressed.BACKSPACE)
		{
			if (backspaceTmr <= 0)
				onKey(BACKSPACE);
			else
				backspaceTmr -= backspaceTmrDecrease;
		}
		if (FlxG.keys.justReleased.BACKSPACE)
			backspaceTmr = backspaceTmrStart;
	}

	function onKey(key:FlxKey)
	{
		switch (key)
		{
			case END, BREAK, MENU, SHIFT, ENTER, ALT, CONTROL, WINDOWS, SCROLL_LOCK, NUMLOCK, TAB, CAPSLOCK, LEFT, DOWN, UP, RIGHT, DELETE, PRINTSCREEN,
				PAGEUP, PAGEDOWN, INSERT:

			case BACKSPACE:
				inputText.text = inputText.text.substr(0, inputText.text.length - 1);

			default:
				if (Constants.KEY_SUPPLEMENTS.exists(key))
					if ((FlxG.keys.pressed.SHIFT && Constants.KEY_SHIFT_SUPPLEMENTS.exists(key)))
						inputText.text += Constants.KEY_SHIFT_SUPPLEMENTS.get(key)
					else
						inputText.text += Constants.KEY_SUPPLEMENTS.get(key);
				else
					inputText.text += (FlxG.keys.pressed.SHIFT || Constants.FUNCTION_KEYS.contains(key)) ? key.toString()
						.toUpperCase() : key.toString().toLowerCase();
		}
	}
}
