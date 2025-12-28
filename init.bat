@echo off
:: 设置命令行编码为 UTF-8，避免出现乱码
chcp 65001

SET VENV_DIR=.venv
SET REQUIREMENTS_FILE=requirements.txt

:: Step 1: 检查虚拟环境是否存在
IF NOT EXIST "%VENV_DIR%\Scripts\activate.bat" (
    echo 虚拟环境不存在，正在创建...
    python -m venv %VENV_DIR%
    IF %ERRORLEVEL% NEQ 0 (
        echo 创建虚拟环境失败！请检查是否安装了 Python。
        exit /b 1
    )
)

:: Step 2: 激活虚拟环境
echo 激活虚拟环境...
call %VENV_DIR%\Scripts\activate.bat

:: Step 3: 检查并安装所需依赖
IF NOT EXIST "%REQUIREMENTS_FILE%" (
    echo 未找到 requirements.txt 文件，请确保其存在。
    exit /b 1
)

echo 检查并安装依赖...
pip install --upgrade pip
pip install -r %REQUIREMENTS_FILE% -i https://mirrors.aliyun.com/pypi/simple/

:: Step 4: 检查并生成配置文件
IF NOT EXIST "config.json" (
    echo 未找到config.json，从模板生成...
    COPY "config-template.json" "config.json"
    IF %ERRORLEVEL% NEQ 0 (
        echo 生成config.json失败！
        exit /b 1
    )
)

:: Step 5: 检查并复制模板资源
SET RESOURCE_DIR=国服覆盖资源

IF NOT EXIST "templates" (
    echo 未找到templates文件夹，从资源目录复制...
    XCOPY /E /I "%RESOURCE_DIR%\templates" "templates"
    IF %ERRORLEVEL% NEQ 0 (
        echo 复制templates文件夹失败！
        exit /b 1
    )
)

IF NOT EXIST "extra_templates" (
    echo 未找到extra_templates文件夹，从资源目录复制...
    XCOPY /E /I "%RESOURCE_DIR%\extra_templates" "extra_templates"
    IF %ERRORLEVEL% NEQ 0 (
        echo 复制extra_templates文件夹失败！
        exit /b 1
    )
)

echo 初始化检查完成！
pause