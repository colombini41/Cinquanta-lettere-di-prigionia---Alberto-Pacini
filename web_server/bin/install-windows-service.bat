@echo off
call config.cmd
nssm\nssm.exe install XSLWeb_4_0_0 "%JAVA_PATH%" -Xmx%MAXMEM% -Djetty.home="%JETTY_HOME%" -Djetty.base="%JETTY_BASE%" %JAVA_OPTS% -jar "%JETTY_HOME%\start.jar" --lib="%XSLWEB_HOME%\config" STOP.PORT=8153 STOP.KEY=XSLWeb
nssm\nssm.exe set XSLWeb_4_0_0 AppDirectory %PRGDIR%
nssm\nssm.exe set XSLWeb_4_0_0 DisplayName XSLWeb 4.0.0
nssm\nssm.exe set XSLWeb_4_0_0 Start SERVICE_AUTO_START
nssm\nssm.exe set XSLWeb_4_0_0 AppEnvironmentExtra JAVA_HOME=%JAVA_HOME% 