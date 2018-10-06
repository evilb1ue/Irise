#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re

"""
{
    "Author":"evilb1ue",
    "Language":"Python3",
    "CodeDescription":"使用Caesar方法进行加解密",
    "Cmd":{
        "cmd_range":{
            "Caption":"变换范围",
            "Help":"Format(start,end),分号分隔，闭区间，可以写<span style='color:red'>多个范围</span>，但每个范围必须区间<span style='color:red'>长度一致</span>，默认范围为'A'-'Z'和'a'-'z'",
            "View":{
            "Type":"text",
            "Default":"(65,90);(97,122);"
            }
        },
        "cmd_ouput_format":{
            "Caption":"输出格式",
            "Help":"控制输出显示格式",
            "View":{
                "Type":"radio",
                "List":["人类友好", "机器友好"],
                "Default":"人类友好"
            }		
        },
        "cmd_filter":{
            "Caption":"过滤关键词",
            "Help":"未选择时，不过滤任何结果;选择后，将只保留含有关键字的结果，忽略大小写",
            "View":{
                "Type":"checkbox",
                "List":["flag", "key"],
                "Default":[]
            }		
        }
    },
    "Input":{
        "input_data":{
            "Caption":"Input Data",
            "Help":"输入",
            "View":{
                "Type":"textarea",
                "Default":""						
            }
        }
    },
    "Output":{
        "output_data":{
            "Caption":"Output Data",
            "Help":"输出",
            "View":{
                "Type":"textarea",
                "Default":""						
            }
        }
    }
}
"""

"""
使用Json方式处理配置
Caption 可选  如果不写，将显示为所在对象对应的Key名称 input_data output_data 测试
Help 可选  没有Help时，不显示提示信息  input_data output_data用来测试
View 必须
Type 必须  Type为checkbox时，获取的是内容为字符串的数组，其余情况获取时就仅仅为字符串
List 必须  仅用在Type为 radio 和 checkbox 时  其它情况不需要
Default 必须  checkbox时，为数组，空数组不选则   radio时，就为单个值
第一个三引号注释，必须为配置Json   且属性名称必须用双引号
Cmd可以是空的，但不能没有  Input Output都是必须的
Cmd Input Output中的属性名都要不相同
radio 的 Default必须指定一个值且只有一个值， checkbox Default可以指定空数组，或者字符串数组
"""


# 不处理异常，如果出现问题，就放弃执行，退回准备状态，假定数据都是正确格式进行处理
def handle(dict_cmd, dict_input, dict_output):

    # 参数获取失败抛出KeyError
    cmd_range = dict_cmd['cmd_range']
    # 应该是个字符串
    cmd_output_format = dict_cmd['cmd_ouput_format']
    # 这里应该是个Array
    cmd_filter = dict_cmd['cmd_filter']
    # 获取拆分后的cmd_range,cmd_range中的元素是元组,失败抛出SyntaxError
    cmd_range = [eval(x) for x in cmd_range.split(';') if x != '']
    # 获取输入数据
    input_data = dict_input['input_data']
    # 调用caesar方法,内部处理了dict_output
    caesar(cmd_range, cmd_output_format, cmd_filter, input_data, dict_output)

    return dict_output


def caesar(cmd_range, cmd_output_format, cmd_filter, input_data, dict_output):
    max_offset = cmd_range[0][1] - cmd_range[0][0]
    mod_num = max_offset + 1
    case_arr = []

    for offset in range(0, mod_num):
        str_content = ''
        if cmd_output_format == '人类友好':
            str_content = '偏移K=' + offset.__str__() + ':'
        for c in input_data:
            flag_in = False
            flag_in_start = -1
            for r in cmd_range:
                if r[0] <= ord(c) <= r[1]:
                    flag_in = True
                    flag_in_start = r[0]
                    break
            if flag_in:
                caesar_num = flag_in_start + (ord(c) - flag_in_start + offset) % mod_num
                # 将c转换为新值
                c = chr(caesar_num)
            str_content += c
        case_arr.append(str_content)
    str_content = ''
    for s in case_arr:
        if len(cmd_filter) == 0:
            flag_in = True
        else:
            flag_in = False
            for f in cmd_filter:
                if re.search(f, s, re.I) is not None:
                    flag_in = True
                    break
        if flag_in:
            str_content += s + '\n'
    dict_output['output_data'] = str_content
    return dict_output


# 入口函数
def main(context, dict_cmd, dict_input, dict_output):
    return handle(dict_cmd, dict_input, dict_output)

# context dict_cmd dict_input dict_output 在执行时会动传递
# main(context=context, dict_cmd=dict_cmd, dict_input=dict_input, dict_output=dict_output)
main(context, dict_cmd, dict_input, dict_output)

# print(main(context={}, dict_cmd= {'cmd_range': '(65,90);(97,122);', 'cmd_ouput_format': '人类友好', 'cmd_filter': []}, dict_input= {'input_data':'Uryyb, Unpxre jbeyq!'}, dict_output={})['output_data'])