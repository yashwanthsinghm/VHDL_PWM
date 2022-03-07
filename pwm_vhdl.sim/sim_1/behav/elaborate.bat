@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto c8f0ab3b0a3b46df81327b7ce827b509 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot pwm_v_behav xil_defaultlib.pwm_v -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
