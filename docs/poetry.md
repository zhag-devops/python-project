# Poetry quick start

What is poetry? Poetry is a dependency manager like Composer in PHP and npm in nodejs

!!! ! First of all make shure that you are acting in virtual environment

> How to install dependencies from pyproject.toml
```
% poetry install

Updating dependencies
Resolving dependencies... (2.8s)

Package operations: 4 installs, 0 updates, 0 removals

  • Installing mccabe (0.7.0)
  • Installing pycodestyle (2.11.0)
  • Installing pyflakes (3.1.0)
  • Installing flake8 (6.1.0)

Writing lock file
```

> How check what dependencies is installed? 
```
% poetry show 

attrs              23.1.0  Classes Without Boilerplate
flake8             6.1.0   the modular source code checker: pep8 pyflakes and co
mccabe             0.7.0   McCabe checker, plugin for flake8
pycodestyle        2.11.0  Python style guide checker
pyflakes           3.1.0   passive checker of Python programs
```

> Ho to add package to environment?
```
% poetry add flake8-bugbear --group=dev

Using version ^23.9.16 for flake8-bugbear

Updating dependencies
Resolving dependencies... (0.4s)

Package operations: 1 install, 0 updates, 0 removals

  • Installing flake8-bugbear (23.9.16)

Writing lock file
```
