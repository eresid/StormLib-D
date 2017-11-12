module stormlibd.Constsants;

// Defines

immutable uint STORMLIB_VERSION				= 0x0916; // Current version of StormLib (9.21)
immutable string STORMLIB_VERSION_STRING	= "9.22"; // String version of StormLib version

// Flags for SFileOpenArchive
immutable uint BASE_PROVIDER_FILE			= 0x00000000; // Base data source is a file
immutable uint BASE_PROVIDER_MAP			= 0x00000001; // Base data source is memory-mapped file
immutable uint BASE_PROVIDER_HTTP			= 0x00000002; // Base data source is a file on web server
immutable uint BASE_PROVIDER_MASK			= 0x0000000F; // Mask for base provider value

immutable uint STREAM_PROVIDER_FLAT			= 0x00000000; // Stream is linear with no offset mapping
immutable uint STREAM_PROVIDER_PARTIAL		= 0x00000010; // Stream is partial file (.part)
immutable uint STREAM_PROVIDER_MPQE			= 0x00000020; // Stream is an encrypted MPQ
immutable uint STREAM_PROVIDER_BLOCK4		= 0x00000030; // 0x4000 per block, text MD5 after each block, max 0x2000 blocks per file
immutable uint STREAM_PROVIDER_MASK			= 0x000000F0; // Mask for stream provider value

immutable uint STREAM_FLAG_READ_ONLY		= 0x00000100; // Stream is read only
immutable uint STREAM_FLAG_WRITE_SHARE		= 0x00000200; // Allow write sharing when open for write
immutable uint STREAM_FLAG_USE_BITMAP		= 0x00000400; // If the file has a file bitmap, load it and use it
immutable uint STREAM_OPTIONS_MASK			= 0x0000FF00; // Mask for stream options

immutable uint STREAM_PROVIDERS_MASK		= 0x000000FF; // Mask to get stream providers
immutable uint STREAM_FLAGS_MASK			= 0x0000FFFF; // Mask for all stream flags (providers+options)

immutable uint MPQ_OPEN_NO_LISTFILE			= 0x00010000; // Don't load the internal listfile
immutable uint MPQ_OPEN_NO_ATTRIBUTES		= 0x00020000; // Don't open the attributes
immutable uint MPQ_OPEN_NO_HEADER_SEARCH	= 0x00040000; // Don't search for the MPQ header past the begin of the file

immutable uint MPQ_OPEN_FORCE_MPQ_V1		= 0x00080000; // Always open the archive as MPQ v 1.00, ignore the "wFormatVersion" variable in the header
immutable uint MPQ_OPEN_CHECK_SECTOR_CRC	= 0x00100000; // On files with MPQ_FILE_SECTOR_CRC, the CRC will be checked when reading file
immutable uint MPQ_OPEN_PATCH				= 0x00200000; // This archive is a patch MPQ. Used internally.
immutable uint MPQ_OPEN_READ_ONLY			= STREAM_FLAG_READ_ONLY;
