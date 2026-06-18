package limitlang.util;

import haxe.io.Path;
import sys.FileSystem;

class FileUtil
{
	public static function createMissingDirectory(path:String)
	{
		if (!exists(path))
			createDirectory(path);
	}

	public static function readDirectoryRecursive(path:String, ?filter:String->Bool):Array<String>
	{
		var recursiveDirectory:Array<String> = [];

		for (file in readDirectoryFiltered(path, filter ?? s -> return true))
		{
			if (FileSystem.isDirectory(file))
			{
				for (subfile in readDirectoryRecursive(file, filter))
					recursiveDirectory.push(subfile);
			}
			else
				recursiveDirectory.push(file);
		}

		return recursiveDirectory;
	}

	public static function readDirectoryFiltered(path:String, filter:String->Bool):Array<String>
	{
		return readDirectory(path).filter(filter ?? s -> return true);
	}

	public static function readDirectory(path:String):Array<String>
	{
		if (!exists(path))
			return [];

		return [
			for (file in FileSystem.readDirectory(path))
				'${Path.addTrailingSlash(path)}$file'
		];
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
