package limitlang.ui;

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

		inputText = new FlxText(0, 0, 0, 'inputText', 16);
		add(inputText);
		inputText.y = FlxG.height - inputText.height;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.ANY)
        {
            var key:FlxKey = FlxG.keys.firstJustPressed();
            trace(key);
        }
	}
}
