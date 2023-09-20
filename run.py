import logging
import os
import sys

from pythonjsonlogger import jsonlogger

log_level = os.environ.get('APP_LOG_LEVEL', 'WARNING')

logger = logging.getLogger(__name__)
log_output = logging.StreamHandler(stream=sys.stdout)
log_formater = jsonlogger.JsonFormatter(
    "%(name)s %(asctime)s %(levelname)s %(filename)s %(lineno)s %(process)d %(message)s",
)
log_output.setFormatter(log_formater)
logger.addHandler(log_output)
logger.setLevel(log_level)


def start():
    '''Function print Hello world'''
    logger.info('Info message')
    logger.warning('Warning message')
    logger.error('Error message')
    print('Hello world!')


if __name__ == "__main__":
    start()
