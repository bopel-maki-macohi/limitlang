package limitlang.ui.terminal.components;

class TerminalCommand
{
	public static var commands:Map<String, TerminalCommand> = [];

	public var id(default, null):String;

	public function new(id:String)
	{
		this.id = id.toLowerCase();

		commands.set(this.id, this);
        trace('Added command: ${this.id}');
	}

	public function parse(components:Array<String>):String
	{
		return null;
	}
}
