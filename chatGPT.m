clc;
clear;
close all;

% 导入 JSONlab 工具箱
addpath('jsonlab-2.0');

% 设置 OpenAI API 的端点和 API 密钥
% url = 'https://api.openai.com/v1/engines/davinci-codex/completions';
url = 'https://api.openai.com/v1/chat/completions';

options = weboptions('HeaderFields', {'Authorization', 'Bearer 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'});

% 聊天输入文本;
prompt = 'Hi ChatGPT, how are you doing today?';

% 构造 API 请求参数
request_data = struct(...
    'prompt', prompt,...
    'temperature', 0.7,...
    'max_tokens', 60,...
    'n', 1,...
    'stop', '');

% 发送 HTTP POST 请求并获取响应
response = webwrite(url, request_data, options);

% 解析 JSON 数据
json_data = loadjson(response);

% 提取 ChatGPT 的响应文本
chat_response = json_data.choices.text;

% 在 MATLAB 中显示 ChatGPT 的响应文本
disp(chat_response);
