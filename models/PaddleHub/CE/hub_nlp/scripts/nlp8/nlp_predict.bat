@echo off

set cur_path=%cd%
echo "++++++++++++++++++++++++++++++++%1 begin to predict !!!!!!!!!++++++++++++++++++++++++++++++++"

set log_path=%cur_path%

del /q %1_predict_%2_%3_%4.log
del /q EXIT_%1_predict_%2_%3_%4.log

setlocal enabledelayedexpansion
python nlp_predict.py --model_name %1 --use_gpu %2 --max_seq_len %3 --batch_size %4 >> %log_path%/%1_predict_%2_%3_%4.log 2>&1

if not !errorlevel! == 0 (
    echo "exit_code: 1.0" >> %log_path%/EXIT_%1_predict_%2_%3_%4.log
) else (
    echo "exit_code: 0.0" >> %log_path%/EXIT_%1_predict_%2_%3_%4.log
)
