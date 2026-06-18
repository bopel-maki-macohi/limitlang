package limitlang;

import limitlang.ui.terminal.components.commands.RefreshCommand;
import limitlang.util.content.ContentManager;
import limitlang.ui.terminal.TerminalState;
import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		ContentManager.refreshFolderList();

		new RefreshCommand();

		FlxG.switchState(() -> new TerminalState());
	}
}
