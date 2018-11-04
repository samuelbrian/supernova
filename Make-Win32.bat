@echo off
echo.
echo ###############################################################################
echo #                                   FUNCORP                                   #
echo # 'Supernova' Win64 i386 (32-bit) build script                                #
echo # Requires the Free Pascal Win32 compiler (v3.0.4 from freepascal.org)        #
echo ###############################################################################

rm -f NOVA.EXE Supernova-Win32.zip

echo.
echo -------------------------------------------------------------------------------
echo Compiling NOVA.EXE ...
echo.

ppc386 -Mtp -O3 -Xt NOVA.PAS -oNOVA.EXE

echo.
echo -------------------------------------------------------------------------------
echo Creating distribution archive Supernova-Win32.zip ...
echo.

zip Supernova-Win32.zip NOVA.EXE HELP*.TXT HELP.BAT INSTRUCT.TXT B1 C1 L1 R1 R2 S1 SM LICENSE FILE_ID.DIZ FUNCORP.TXT

echo.
echo -------------------------------------------------------------------------------
echo.
echo Build complete.
