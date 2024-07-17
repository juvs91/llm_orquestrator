import json
import os
from typing import Any, List, Generator


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


def concatenate_files_as_object(
        directory,
        file_extension,
) -> List[str]:
    arr = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(file_extension):
                ruta_archivo = os.path.join(root, file)
                with open(ruta_archivo, "r", encoding='utf-8') as f:
                    arr.append(f.read())
    return arr


def print_object(obj: Any):
    try:
        # Attempt to serialize the object to JSON
        json_string = json.dumps(obj, indent=2)
        print("JSON-serializable object:")
        print(json_string)
    except (TypeError, ValueError):
        print("NON-JSON-serializable object:")
        print(f"{obj}")


def chunk_array(arr: List[Any], chunk_size: int) -> Generator[list, Any, None]:
    for i in range(0, len(arr), chunk_size):
        yield arr[i:i + chunk_size]
