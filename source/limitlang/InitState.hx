package limitlang;

import limitlang.ui.TerminalState;
import flixel.FlxG;
import limitlang.util.Constants;
import limitlang.util.FileUtil;
import flixel.FlxState;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		FileUtil.createMissingDirectory(Constants.CONTENT_FOLDER);

		FlxG.switchState(() -> new TerminalState());
	}
}
