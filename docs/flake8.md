# Flake8

```
flake8 --statistics; [ $? -eq 0 ] && echo -e "\e[32mALL GOOD\e[0m" || (echo -e "\e[91mFIX IT\e[0m" && false)

./run.py:6:12: W292 no newline at end of file
1     W292 no newline at end of file
FIX IT

flake8 --statistics; [ $? -eq 0 ] && echo -e "\e[32mALL GOOD\e[0m" || (echo -e "\e[91mFIX IT\e[0m" && false)

ALL GOOD
```


flake8 --count

flake8 --quiet

flake8 --disable-noqa 

flake8 --exit-zero   

flake8 --jobs 4

