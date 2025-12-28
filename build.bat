@echo off
:: 设置命令行编码为 UTF-8，避免出现乱码
chcp 65001

SET VENV_DIR=.venv
SET REQUIREMENTS_FILE=requirements.txt
:: 初始化错误标志
SET ERROR_OCCURRED=0

:: Step 2: 激活虚拟环境
call %VENV_DIR%\Scripts\activate.bat
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1

:: Step 3: 执行编译
pyinstaller sv-auto.spec
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1

:: Step 4: 准备发布文件夹
IF EXIST release (rd /s /q release)
md release
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1

:: Step 5: 复制可执行文件
copy dist\ShadowverseAutomation.exe release\sv-auto.exe
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1

:: Step 6: 复制资源文件夹
timeout /t 3 /nobreak >nul
xcopy /E /I "国服覆盖资源" release\国服覆盖资源
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1
xcopy /E /I "国际服覆盖资源" release\国际服覆盖资源
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1
xcopy /E /I shield release\shield
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1
xcopy /E /I templates_cost release\templates_cost
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1

:: Step 7: 复制国服覆盖资源内容到根目录
xcopy /E /I "国服覆盖资源\*" release\
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1

:: Step 8: 复制其他资源文件
copy 使用说明.txt release\使用说明.txt
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1
copy config-template.json release\config.json
IF %ERRORLEVEL% NEQ 0 SET ERROR_OCCURRED=1

:: 检查是否有错误发生
IF %ERROR_OCCURRED% NEQ 0 (
    echo.
    echo ===============================
    echo 构建过程中发生错误！
    echo 请查看上方错误信息并修复后重试。
    echo ===============================
    pause
) ELSE (
    echo.
    echo ===============================
    echo 构建成功完成！
    echo 发布文件已生成在 release 文件夹中。
    echo ===============================
)