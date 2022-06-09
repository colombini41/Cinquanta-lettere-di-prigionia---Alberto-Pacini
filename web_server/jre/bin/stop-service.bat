@echo off
call config.cmd
"%JAVA_PATH%" -Djetty.home="%JETTY_HOME%" -Djetty.base="%JETTY_BASE%" %JAVA_OPTS% -jar "%JETTY_HOME%\start.jar" --lib="%XSLWEB_HOME%\config" STOP.PORT=8153 STOP.KEY=xslweb_4_0_0 --stop