echo conda activate "${BUILD_PREFIX}"    > conda_build.sh
echo conda activate --stack "${PREFIX}" >> conda_build.sh
type "%RECIPE_DIR%\build.sh"            >> conda_build.sh

set PREFIX=%PREFIX:\=/%
set SRC_DIR=%SRC_DIR:\=/%
set MSYSTEM=UCRT64
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
bash -lc "./conda_build.sh"
if errorlevel 1 exit 1