@ECHO OFF

:: Run unit tests 
cd test\Steeltoe.CloudFoundry.ConnectorBase.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..

cd test\Steeltoe.CloudFoundry.Connector.EF6Core.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose 
if not "%errorlevel%"=="0" goto failure
cd ..\..

cd test\Steeltoe.CloudFoundry.Connector.EFCore.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..

cd test\Steeltoe.CloudFoundry.ConnectorCore.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..

cd test\Steeltoe.CloudFoundry.ConnectorAutofac.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..

echo Unit Tests Pass
goto success
:failure
echo Unit Tests Failure
exit -1
:success