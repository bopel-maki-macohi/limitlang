package limitlang.ui.terminal.components.commands;

import limitlang.util.content.ContentManager;

class RefreshCommand extends TerminalCommand
{
	override public function new()
	{
		super('refresh');
	}

	override function parse(components:Array<String>):String
	{
		var returnCode:String = null;

		final param1 = components.getIndex(0)?.toLowerCase();

		forCase(param1?.length == 0, function()
		{
			returnCode ??= 'Parameter for command "refresh" has not been filled';
		});

		switch (param1)
		{
			case 'content':
				ContentManager.refreshFolderList();
				returnCode ??= 'Refreshed Content Folder List: ${ContentManager.folders}';

			case null:
				returnCode ??= 'Missing parameter for command "refresh"';

			default:
				returnCode ??= 'Unknown parameter for command "refresh": "${param1 ?? 'null'}"';
		}

        trace(returnCode);

		return returnCode;
	}
}
