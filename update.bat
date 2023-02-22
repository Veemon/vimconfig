@echo off
setlocal

set vimrc_path="C:\Program Files (x86)\Vim\_vimrc"
set vim_colors_path="C:\Program Files (x86)\Vim\vimfiles\colors\shantyv2.vim"
set lightline_colors_path="C:\Program Files (x86)\Vim\vimfiles\bundle\lightline.vim\autoload\lightline\colorscheme\shantyline.vim"

set vimrc_src="./_vimrc"
set vim_colors_src="./colors/shantyv2.vim"
set lightline_colors_src="./colorscheme/shantyline.vim"

echo | set /p dummy="[1/3] checking vimrc " 
diff %vimrc_src% %vimrc_path% > nul
if "%errorlevel%" == "1" (
    echo updated
    cp %vimrc_path% %vimrc_src%
)
echo.

echo | set /p dummy="[2/3] checking vim colors " 
diff %vim_colors_src% %vim_colors_path% > nul
if "%errorlevel%" == "1" (
    echo updated
    cp %vim_colors_path% %vim_colors_src%
)
echo.

echo | set /p dummy="[3/3] checking lightline colors " 
diff %lightline_colors_src% %lightline_colors_path% > nul
if "%errorlevel%" == "1" (
    echo updated
    cp %lightline_colors_path% %lightline_colors_src%
)
echo.
echo.

git status

endlocal
