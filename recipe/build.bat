cd %SRC_DIR%/src
call msvcbuild.bat amalg || goto :error
copy luajit.exe %LIBRARY_BIN%
copy lua51.dll %LIBRARY_BIN%
mkdir -p %LIBRARY_LIB%
copy lua51.lib %LIBRARY_LIB%
copy luajit.lib %LIBRARY_LIB%
mkdir %LIBRARY_INC%\luajit-2.1
xcopy *.h %LIBRARY_INC%\luajit-2.1
xcopy jit %LIBRARY_INC%\luajit-2.1 /s /e

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
