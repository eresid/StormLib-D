module stormlibd.StaticFunctions;

version(DerelictPQ_Static):

public import stormlibd.Types;

extern(C) @nogc nothrow {
	// Functions for manipulation with StormLib global flags
	LCID SFileGetLocale();
	LCID SFileSetLocale(LCID);
	
	// Functions for archive manipulation
	bool SFileOpenArchive(const TCHAR*, DWORD, DWORD, HANDLE*);
	bool SFileCreateArchive(const TCHAR*, DWORD, DWORD, HANDLE*);
	bool SFileCreateArchive2(const TCHAR*, PSFILE_CREATE_MPQ, HANDLE*);

	bool SFileSetDownloadCallback(HANDLE, SFILE_DOWNLOAD_CALLBACK, void*);
	bool SFileFlushArchive(HANDLE);
	bool SFileCloseArchive(HANDLE);

	// Adds another listfile into MPQ. The currently added listfile(s) remain,
	// so you can use this API to combining more listfiles.
	// Note that this function is internally called by SFileFindFirstFile
	int SFileAddListFile(HANDLE, const TCHAR*);

	// Archive compacting
	bool SFileSetCompactCallback(HANDLE, SFILE_COMPACT_CALLBACK, void*);
	bool SFileCompactArchive(HANDLE, const TCHAR*, bool);

	// Changing the maximum file count
	DWORD SFileGetMaxFileCount(HANDLE);
	bool SFileSetMaxFileCount(HANDLE, DWORD);

	// Changing (attributes) file
	DWORD SFileGetAttributes(HANDLE);
	bool SFileSetAttributes(HANDLE, DWORD);
	bool SFileUpdateFileAttributes(HANDLE, const char*);
}
