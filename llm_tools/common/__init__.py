import os

def save_to_file(content, path):
    with open(path, "w", encoding='utf-8') as f:
        f.write(f"{content}")


def read_file(file):
    f = open(file, "r")
    return f.read()


def concatenate_files(
        directory,
        file_extension,
        separator: str = "\n\n"
):
    slq_content = separator
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(file_extension):
                ruta_archivo = os.path.join(root, file)
                with open(ruta_archivo, "r", encoding='utf-8') as f:
                    slq_content += f.read() + separator
    return slq_content
