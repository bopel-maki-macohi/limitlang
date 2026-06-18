package limitlang.ui.terminal;

import limitlang.ui.terminal.components.TerminalCommand;
import limitlang.util.content.ContentManager;
import limitlang.util.Constants;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class TerminalState extends FlxState
{
	var previousCommands:Array<String> = [];
	var commandTexts:FlxText;

	var inputTextBG:FlxText;
	var inputText:FlxText;

	override function create()
	{
		super.create();

		commandTexts = new FlxText(0, 0, FlxG.width, '', 16);
		add(commandTexts);

		inputTextBG = new FlxText(0, 0, FlxG.width, 'Input Command', 16);
		add(inputTextBG);

		inputText = new FlxText(0, 0, FlxG.width, '', 16);
		add(inputText);

		backspaceTmr = backspaceTmrStart;

		parseCommand('');
	}

	final backspaceTmrStart:Int = 300;
	final backspaceTmrDecrease:Int = 10;
	var backspaceTmr:Int = 0;

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		inputText.y = FlxG.height - inputText.height;
		inputTextBG.y = FlxG.height - inputTextBG.height;

		inputTextBG.alpha = (inputText.text.length > 0) ? 0 : 0.25;

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
			case ENTER:
				parseCommand(inputText.text);
				inputText.text = '';

			case END, BREAK, MENU, SHIFT, ALT, CONTROL, WINDOWS, SCROLL_LOCK, NUMLOCK, TAB, CAPSLOCK, LEFT, DOWN, UP, RIGHT, DELETE, PRINTSCREEN, PAGEUP,
				PAGEDOWN, INSERT:

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

	function parseCommand(command:String)
	{
		if (command == null)
			command = 'null';

		var commandOutput:String = '';

		final components:Array<String> = command.split(' ');
		// trace(components);

		commandOutput = parseCommandComponents(components);

		if (commandOutput.length > 0)
		{
			previousCommands.push(commandOutput);
			if (previousCommands.length > 30)
				previousCommands.remove(previousCommands[0]);
		}

		commandTexts.text = previousCommands.join('\n');
	}

	function parseCommandComponents(components:Array<String>):String
	{
		final mainComponent = components.getIndex(0)?.toLowerCase();
		final commandComponents = components.copy().removeIndex(0);

		var returnCode:String = null;

		for (command in TerminalCommand.commands)
		{
			if (command.id == mainComponent)
				returnCode ??= command.parse(commandComponents);
		}

		forCase(components.length < 1, function()
		{
			returnCode ??= 'No components?';
		});

		forCase(components.length == 1, function()
		{
			returnCode ??= components.join(' ');
		});

		returnCode ??= 'Unknown command: "${components.join(' ')}"';
		return returnCode;
	}
}
