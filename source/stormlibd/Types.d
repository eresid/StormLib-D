module stormlibd.Types;

// Typedefs for ANSI C
alias BYTE = char;
alias USHORT = ushort;
alias LONG = int;
alias DWORD = uint;
alias DWORD_PTR = ulong;
alias LONG_PTR = long;   // min 32-bits, maybe change to int
alias INT_PTR = long;    // min 32-bits, maybe change to int
alias LONGLONG = long;   // 64-bits
alias ULONGLONG = ulong; // 64-bits
alias HANDLE = void*;    // maybe change to Object
alias LPOVERLAPPED = void*; // Unsupported on Linux and Mac
alias TCHAR = char; // maybe change to dchar (also known as wchar_t) for support utf-16
alias LCID = uint;
alias PLONG = LONG*;
alias LPDWORD = DWORD*;
alias LPBYTE = BYTE*;
alias LPCTSTR = const(char)*; // or immutable char*
alias LPCSTR = const(char)*; // or immutable char*
alias LPTSTR = char*;
alias LPSTR = char*;

struct PSFILE_CREATE_MPQ
{
    DWORD cbSize;           // Size of this structure, in bytes
    DWORD dwMpqVersion;     // Version of the MPQ to be created
    void* pvUserData;       // Reserved, must be NULL
    DWORD cbUserData;       // Reserved, must be 0
    DWORD dwStreamFlags;    // Stream flags for creating the MPQ
    DWORD dwFileFlags1;     // File flags for (listfile). Use MPQ_FILE_DEFAULT_INTERNAL to set default flags
    DWORD dwFileFlags2;     // File flags for (attributes). Use MPQ_FILE_DEFAULT_INTERNAL to set default flags
    DWORD dwFileFlags3;     // File flags for (signature). Use MPQ_FILE_DEFAULT_INTERNAL to set default flags
    DWORD dwAttrFlags;      // Flags for the (attributes) file. If 0, no attributes will be created
    DWORD dwSectorSize;     // Sector size for compressed files
    DWORD dwRawChunkSize;   // Size of raw data chunk
    DWORD dwMaxFileCount;   // File limit for the MPQ
}

// void * pvUserData, ULONGLONG ByteOffset, DWORD dwTotalBytes
extern(C) alias SFILE_DOWNLOAD_CALLBACK = void function(void*, ULONGLONG, DWORD);
// void * pvUserData, DWORD dwBytesWritten, DWORD dwTotalBytes, bool bFinalCall
extern(C) alias SFILE_ADDFILE_CALLBACK = void function(void*, DWORD, DWORD, bool);
// void * pvUserData, DWORD dwWorkType, ULONGLONG BytesProcessed, ULONGLONG TotalBytes
extern(C) alias SFILE_COMPACT_CALLBACK = void function(void*, DWORD, ULONGLONG, ULONGLONG);

