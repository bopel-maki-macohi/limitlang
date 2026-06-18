package limitlang.util;

import sys.FileSystem;

class FileUtil
{
	public static function createMissingDirectory(path:String)
	{
		if (!exists(path))
			createDirectory(path);
	}

	public static function createDirectory(path:String)
	{
		FileSystem.createDirectory(path);
	}

	public static function exists(path:String):Bool
	{
		return FileSystem.exists(path);
	}
}
