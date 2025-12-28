@echo off
:: 设置命令行编码为 UTF-8，避免出现乱码
chcp 65001

SET VENV_DIR=.venv

:: Step 2: 激活虚拟环境
echo 激活虚拟环境...
call %VENV_DIR%\Scripts\activate.bat

:: Step 4: 执行 Python 脚本
echo 执行 sv-auto.py 脚本...
python sv-auto.py

:: Step 5: 退出虚拟环境
deactivate

echo 完成！
pause
