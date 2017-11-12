module stormlibd.DynamicLoad;

version(Derelict_Static) {}
else version(DerelictStormLib_Static) {}
else { version = DerelictStormLib_Dynamic; }

version(DerelictStormLib_Dynamic):

public import stormlibd.Types;
import derelict.util.exception,
       derelict.util.loader,
       derelict.util.system;

extern(C) @nogc nothrow {
	alias da_SFileGetLocale = LCID function();
	alias da_SFileSetLocale = LCID function(LCID);
	
	alias da_SFileOpenArchive = bool function(const TCHAR*, DWORD, DWORD, HANDLE*);
	alias da_SFileCreateArchive = bool function(const TCHAR*, DWORD, DWORD, HANDLE*);
	alias da_SFileCreateArchive2 = bool function(const TCHAR*, PSFILE_CREATE_MPQ, HANDLE*);

	alias da_SFileSetDownloadCallback = bool function(HANDLE, SFILE_DOWNLOAD_CALLBACK, void*);
	alias da_SFileFlushArchive = bool function(HANDLE);
	alias da_SFileCloseArchive = bool function(HANDLE);

	alias da_SFileAddListFile = int function(HANDLE, const TCHAR*);

	alias da_SFileSetCompactCallback = bool function(HANDLE, SFILE_COMPACT_CALLBACK, void*);
	alias da_SFileCompactArchive = bool function(HANDLE, const TCHAR*, bool);

	alias da_SFileGetMaxFileCount = DWORD function(HANDLE);
	alias da_SFileSetMaxFileCount = bool function(HANDLE, DWORD);

	alias da_SFileGetAttributes = DWORD function(HANDLE);
	alias da_SFileSetAttributes = bool function(HANDLE, DWORD);
	alias da_SFileUpdateFileAttributes = bool function(HANDLE, const char*);
}

__gshared {
	da_SFileGetLocale SFileGetLocale;
	da_SFileSetLocale SFileSetLocale;
	
	da_SFileOpenArchive SFileOpenArchive;
	da_SFileCreateArchive SFileCreateArchive;
	da_SFileCreateArchive2 SFileCreateArchive2;
	
	da_SFileSetDownloadCallback SFileSetDownloadCallback;
	da_SFileFlushArchive SFileFlushArchive;
	da_SFileCloseArchive SFileCloseArchive;
	
	da_SFileAddListFile SFileAddListFile;
	
	da_SFileSetCompactCallback SFileSetCompactCallback;
	da_SFileCompactArchive SFileCompactArchive;
	
	da_SFileGetMaxFileCount SFileGetMaxFileCount;
	da_SFileSetMaxFileCount SFileSetMaxFileCount;

	da_SFileGetAttributes SFileGetAttributes;
	da_SFileSetAttributes SFileSetAttributes;
	da_SFileUpdateFileAttributes SFileUpdateFileAttributes;
}


class DerelictStormLibLoader : SharedLibLoader {
    this()
    {
        super(libNames);
    }

    protected override void loadSymbols()
    {
        bindFunc(cast(void**)&SFileGetLocale, "SFileGetLocale");
        bindFunc(cast(void**)&SFileSetLocale, "SFileSetLocale");
        
        bindFunc(cast(void**)&SFileOpenArchive, "SFileOpenArchive");
        bindFunc(cast(void**)&SFileCreateArchive, "SFileCreateArchive");
        bindFunc(cast(void**)&SFileCreateArchive2, "SFileCreateArchive2");
        
        bindFunc(cast(void**)&SFileSetDownloadCallback, "SFileSetDownloadCallback");
        bindFunc(cast(void**)&SFileFlushArchive, "SFileFlushArchive");
        bindFunc(cast(void**)&SFileCloseArchive, "SFileCloseArchive");
        
        bindFunc(cast(void**)&SFileAddListFile, "SFileAddListFile");
        
        bindFunc(cast(void**)&SFileSetCompactCallback, "SFileSetCompactCallback");
        bindFunc(cast(void**)&SFileCompactArchive, "SFileCompactArchive");
        
        bindFunc(cast(void**)&SFileGetMaxFileCount, "SFileGetMaxFileCount");
        bindFunc(cast(void**)&SFileSetMaxFileCount, "SFileSetMaxFileCount");
        
        bindFunc(cast(void**)&SFileGetAttributes, "SFileGetAttributes");
        bindFunc(cast(void**)&SFileSetAttributes, "SFileSetAttributes");
        bindFunc(cast(void**)&SFileUpdateFileAttributes, "SFileUpdateFileAttributes");
    }
}

__gshared DerelictStormLibLoader DerelictStormLib;

shared static this()
{
    DerelictStormLib = new DerelictStormLibLoader();
}

private:
    static if(Derelict_OS_Windows)
        enum libNames = "libStorm.dll";
    else static if(Derelict_OS_Mac)
        enum libNames = "libStorm.dylib";
    else static if(Derelict_OS_Posix)
        enum libNames = "libStorm.so";
    else
		static assert(0, "Need to implement StormLib libNames for this operating system.");
