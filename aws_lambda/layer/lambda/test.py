from main import lambda_handler


def test_lambda_function():
    print(lambda_handler(None, None))


if __name__ == "__main__":
    test_lambda_function()
