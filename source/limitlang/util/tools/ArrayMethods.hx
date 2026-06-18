package limitlang.util.tools;

class ArrayMethods
{
	public static function getIndex<T>(array:Array<T>, index:Int, ?defaultValue:T):Null<T>
	{
		return array[index] ?? defaultValue ?? null;
	}

	public static function removeIndex<T>(array:Array<T>, index:Int):Array<T>
	{
		array?.remove(array[index]);

        return array;
	}
}
