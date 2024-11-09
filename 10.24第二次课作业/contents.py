import os
from pathlib import Path

IGNORE_EXTENSIONS = [
    '.pyc', '.md', '.png', '.idx', '.pack', '.rev', '.sample', 'jpg', '.xmind', '.pdf', '.docx'
]

IGNORE_FILES = [
    '.gitattributes', '.ignore', 'LICENSE', 'contents.py', 'contents.txt'
]

def generate_directory_structure(startpath, indent=''):
    structure = ""
    path = Path(startpath)
    if not any(path.iterdir()):
        structure += f"{indent}|-- (空目录)\n"
    else:
        for item in path.iterdir():
            if item.is_dir():
                structure += f"{indent}|-- 文件夹: {item.name}\n"
                structure += generate_directory_structure(item, indent + '|   ')
            else:
                structure += f"{indent}|-- 文件: {item.name}\n"
    return structure

def write_directory_contents_to_file(output_file_name):
    # 获取当前脚本所在的目录
    current_dir = os.path.dirname(os.path.abspath(__file__))
    
    # 构建输出文件路径
    output_file_path = os.path.join(current_dir, output_file_name)

    with open(output_file_path, 'w', encoding='utf-8') as output_file:
        # 写入目录结构
        directory_structure = generate_directory_structure(current_dir)
        output_file.write("目录结构:\n")
        output_file.write(directory_structure)
        output_file.write("\n\n")

        # 遍历当前目录
        for root, dirs, files in os.walk(current_dir):
            dirs[:] = [d for d in dirs if d != '.git']
            files = [f for f in files if not (
                any(f.endswith(ext) for ext in IGNORE_EXTENSIONS) or
                f in IGNORE_FILES
            )]
            for file in files:
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                except (UnicodeDecodeError, IsADirectoryError):
                    try:
                        with open(file_path, 'r', encoding='latin1') as f:
                            content = f.read()
                    except (UnicodeDecodeError, IsADirectoryError):
                        continue
                
                marker = "=" * 80
                output_file.write(f"{marker}\n")
                output_file.write(f"{file_path} 的内容:\n")
                output_file.write(f"{marker}\n")
                output_file.write(content)
                output_file.write("\n\n")

if __name__ == "__main__":
    output_file_name = "contents.txt"
    write_directory_contents_to_file(output_file_name)
