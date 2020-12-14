#!/bin/bash

. functions.sh


echo -e "Checking if dependencies are met"

ieeezip='https://mirrors.ctan.org/macros/latex/contrib/IEEEtran.zip'
ZIPNAME='IEEEtran.zip'

IEEECONF="http://mirrors.ctan.org/macros/latex/contrib/IEEEtran/bare_conf.tex"

CLSLINK="http://mirrors.ctan.org/macros/latex/contrib/IEEEtran/IEEEtran.cls"

IEEECLSFILE='IEEEtran.cls'

make_dir



dl_packages;
completetion_msg DOWNLOAD packages;


printf "Getting IEEE class"
ieee_check IEEECLSFILE CLSLINK
ieee_check ZIPNAME IEEEZIP
