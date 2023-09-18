# Python project example

## Project initialization 

> Basic python project structure 

### Create virtual environment

```
python -m venv .venv
source .venv/bin/activate
```

> Don`t forget to select python interpreter in VSC by pressing Shift+CMD+P and typing "Python: Select Interpreter". Chose .venv


### Install requirements

```
pip install -r requirements.txt
```

### Install dependencies with Poentry

> Check if Poentry see Virtualenv?
```
poetry env info
```

```
Virtualenv
Python:         3.11.5
Implementation: CPython
Path:           /Users/user/Documents/GitHub/python-project/.venv
Executable:     /Users/user/Documents/GitHub/python-project/.venv/bin/python
Valid:          True

System
Platform:   darwin
OS:         posix
Python:     3.11.5
Path:       /Library/Frameworks/Python.framework/Versions/3.11
Executable: /Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11
```

> Install dependencies

```
poetry install
```
