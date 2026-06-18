package limitlang.util.tools;

class ConditionMethods
{
	public static function forCase(condition:Bool, method:Void->Void)
		if (condition && method != null)
			method();
}
