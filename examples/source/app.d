import std.stdio;

import stormlibd;

private immutable string DIABDAT_MPQ = "DIABDAT.MPQ";
private HANDLE diabdat = null;

void main() {
	writeln(init(null));
}

bool init(string pathMPQ) {
	DerelictStormLib.load();
	
	pathMPQ = pathMPQ is null ? DIABDAT_MPQ : pathMPQ;

	bool success = SFileOpenArchive(cast(char*)pathMPQ, 0u, STREAM_FLAG_READ_ONLY, &diabdat);

	if (!success) {
		// GetLastError does not support on Linux
		writefln("Failed to open %s with error %s", pathMPQ, ""/*GetLastError()*/);
	}

	return success;
}
