@cd /D %~dp0
@call ../../scripts/set-variables

IF not "%1" == "release" (

%msbuild% skc5.csproj

) ELSE (

%msbuild% skc5.csproj /p:Configuration=Release /p:DebugSymbols=false /p:DebugType=None

)

