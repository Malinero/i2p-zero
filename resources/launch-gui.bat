@echo off
set DIR=%~dp0
"%DIR%\java" -cp %DIR%\..\i2p.base\jbigi.jar -m org.getmonero.i2p.zero.gui --i2p.dir.base.template=%DIR%\..\i2p.base %*