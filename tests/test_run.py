from run import start


def test_start_function(capsys):
    """
    Capture the printed output

    Call start() function
    Get output of start() with capsys
    Assert output with 'Hello world!'
    """

    start()
    captured = capsys.readouterr()

    assert captured.out.strip() == 'Hello world!'
