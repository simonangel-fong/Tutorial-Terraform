# Terraform - AWS Lambda: Layer

[Back](../../README.md)

---

## AWS Lambda Layer

```sh
# add package into requirements.txt file

# for Windows
pip install -r requirements.txt --platform manylinux2014_x86_64 --only-binary=:all: -t python/ --python-version cpython-312 --upgrade
Compress-Archive -Path .\python -DestinationPath .\layer.zip
```
