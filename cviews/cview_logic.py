from django.db import transaction

from cviews.models import CmdHistory, InputHistory, OutputHistory


def excute_task_logic(task, config, code_content):

    # 上下文对象，以后可能会有用，暂时为空
    context = {}
    dict_output = {}
    dict_cmd = {}
    dict_input = {}
    cmd_history = CmdHistory.objects.filter(tid=task)
    input_history = InputHistory.objects.filter(tid=task)
    for cmd in cmd_history:
        if config['Cmd'][cmd.key]['View']['Type'] == 'checkbox':
            dict_cmd[cmd.key] = eval(cmd.value)
        else:
            dict_cmd[cmd.key] = cmd.value
    for input in input_history:
        if config['Input'][input.key]['View']['Type'] == 'checkbox':
            dict_input[input.key] = eval(input.value)
        else:
            dict_input[input.key] = input.value

    exec_dict = {"context": context, "dict_cmd": dict_cmd, "dict_input": dict_input, "dict_output": dict_output}
    flag = False
    try:
        # 设置task的状态为执行
        task.task_progress = 1
        task.save()
        # print(code_content)
        # print(type(code_content))
        exec(code_content, exec_dict)
        flag = True
    except Exception as error:
        # 设置task的状态为准备
        # print(error)
        task.task_progress = 0
        task.save()

    # 保存输出结果
    if flag:
        try:
            # 开启事务
            with transaction.atomic():
                output_history = OutputHistory.objects.filter(tid=task)
                for output in output_history:
                    output.value = dict_output[output.key].__str__()
                    output.save()
                task.task_progress = 2
                task.save()
        except Exception as error:
            # 只要触发异常，就将task.task_progress 设置为准备，让用户重新执行
            print(error)
            task.task_progress = 0
            task.save()
