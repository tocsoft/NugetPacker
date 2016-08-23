@echo Off
ECHO Starting build

set version=

if not "%PackageVersion%" == "" (
   set version=-Version %PackageVersion%
)
if not "%GitVersion_NuGetVersion%" == "" (
	if "%version%" == "" (
		set version=-Version %GitVersion_NuGetVersion%
	)
)

if "%version%" == "" (
	set version=-Version 0.0.0
)

ECHO Building pacakge
mkdir Build
call nuget.exe pack "NugetPacker.nuspec" -o Build -p Configuration=%config% %version%
if not "%errorlevel%"=="0" goto failure