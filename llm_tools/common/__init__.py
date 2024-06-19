def save_to_file(content, path):
    with open(path, "w", encoding='utf-8') as f:
        f.write(f"{content}")


def read_file(file):
    f = open(file, "r")
    return f.read()
