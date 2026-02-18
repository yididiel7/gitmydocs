**Title:** Zle Expand History Error Fix
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** zle _expand_history_error_fix.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

The fix is applied! The error was caused by using zle _expand_history
which doesn't exist.
I replaced it with zle history-expand-line, which is the correct
built-in widget for
expanding history expressions like !!, !$, etc.
The magic-space function will now properly expand
history commands when you press space, without throwing the
"No such widget `_expand_history'" error.

MPV Player Analysis Complete - Found and Fixed Multiple Issues

I analyzed all mpv-related files and found several critical issues
causing performance problems and errors:
Configuration Issues Fixed:
1. Deprecated Options Removed:
   - audio-resample-quality=0 - Option no longer exists in modern mpv
- demuxer-cache=yes and demuxer-cache-size=16384 - Replaced with
cache=yes and cache-secs=10
2. Missing Profile Definitions:
   - Fixed references to undefined profiles: text-max and text-smaller
   - Replaced with actual subtitle settings
3. Lua Script Error Fixed:
- Critical Bug: total_playtime.lua referenced undefined variable
on_windows on line 45
   - Added platform detection code to fix runtime error
Performance Optimizations:
- Updated hardware decoding from vdpau to auto (lets mpv choose optimal
method)
- Reduced CPU-intensive settings for better performance
- Lowered cache size to prevent memory issues
The "OCD Error" You Mentioned:
The likely culprit was the undefined on_windows variable in
total_playtime.lua causing runtime errors during playback. This script
runs every time you load a playlist or press F12, so it could definitely
impact performance.
Verification:
✅ mpv now starts without configuration errors
✅ All Lua scripts syntax-validated
✅ Hardware acceleration optimized
✅ Performance settings adjusted
Your mpv should now play videos smoothly without the slow playback or
error messages. Try playing a video file to confirm the fix!
