@cd /D %~dp0
@call ../scripts/set-variables

IF not "%1" == "release" (

%msbuild% 													/p:Configuration=net_4_0_Release cecil/Mono.Cecil.csproj    /verbosity:minimal
%msbuild% NRefactory/NRefactory.sln                       	/p:Configuration=net_4_5_Debug 								/verbosity:minimal
%msbuild% corex/corex.sln 																								/verbosity:minimal
%msbuild% AjaxMin/AjaxMinDll/AjaxMinDll.sln 																			/verbosity:minimal
%msbuild% SharpZipLib/src/ICSharpCode.SharpZLib.csproj 																	/verbosity:minimal
%msbuild% octokit.net/Octokit/Octokit-Mono.csproj 																		/verbosity:minimal
 
) ELSE (

%msbuild% cecil/Mono.Cecil.csproj                         /p:Configuration=net_4_0_Release /p:DebugSymbols=false /p:DebugType=None /verbosity:minimal
%msbuild% NRefactory/NRefactory.sln                       /p:Configuration=net_4_5_Release /p:DebugSymbols=false /p:DebugType=None /verbosity:minimal
%msbuild% corex/corex.sln                                 /p:Configuration=Release         /p:DebugSymbols=false /p:DebugType=None /verbosity:minimal
%msbuild% AjaxMin/AjaxMinDll/AjaxMinDll.sln               /p:Configuration=Release         /p:DebugSymbols=false /p:DebugType=None /verbosity:minimal
%msbuild% SharpZipLib/src/ICSharpCode.SharpZLib.csproj    /p:Configuration=Release         /p:DebugSymbols=false /p:DebugType=None /verbosity:minimal
%msbuild% octokit.net/Octokit/Octokit-Mono.csproj	      /p:Configuration=Release         /p:DebugSymbols=false /p:DebugType=None /verbosity:minimal

)
