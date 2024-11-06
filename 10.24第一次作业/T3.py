import cv2
import numpy as np
import pandas as pd
import pytesseract
from PIL import Image

def preprocess_image(image_path):
    # 读取图像
    img = cv2.imread(image_path)
    
    # 转换为灰度图
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    
    # 二值化
    thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)[1]
    
    return thresh

def extract_table_data(image):
    # 使用Tesseract OCR提取文本
    text = pytesseract.image_to_string(image, config='--psm 6')
    
    # 将文本分割成行
    lines = text.strip().split('\n')
    
    # 解析数据
    data = []
    current_row = []
    for i, line in enumerate(lines, 1):
        values = line.split()
        if values:
            current_row.extend(values)
        
        if i % 5 == 0:
            data.append(current_row)
            current_row = []
    
    if current_row:  # 添加最后一行（如果有的话）
        data.append(current_row)
    
    return data

def process_image(image_path):
    # 预处理图像
    preprocessed_image = preprocess_image(image_path)
    
    # 提取表格数据
    table_data = extract_table_data(preprocessed_image)
    
    # 创建DataFrame
    df = pd.DataFrame(table_data)
    
    return df

# 主程序
image_paths = ['Zbra0.jpg', 'Zbra1.jpg']

for i, path in enumerate(image_paths):
    # 处理图像并提取数据
    df = process_image(path)
    
    # 保存CSV
    csv_filename = f'Z{i}_data.csv'
    df.to_csv(csv_filename, index=False, header=False)
    print(f"数据已保存到 {csv_filename}")

print("处理完成")
