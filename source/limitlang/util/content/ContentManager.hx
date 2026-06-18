package limitlang.util.content;

import sys.FileSystem;

class ContentManager
{
	public static var folders:Array<String> = [];

	static function folderFilter(path:String):Bool
	{
		return FileSystem.isDirectory(path);
	}

	public static function refreshFolderList()
	{
		FileUtil.createMissingDirectory(Constants.CONTENT_FOLDER);

		folders = [
			for (path in FileUtil.readDirectoryFiltered(Constants.CONTENT_FOLDER, folderFilter)) path.substr(path.indexOf('/') + 1)
		];

		trace('Content folders: $folders');
	}
}
