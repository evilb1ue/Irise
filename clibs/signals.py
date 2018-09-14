import os

from django.db.models.signals import post_delete, pre_save, pre_delete
from django.dispatch import receiver

from clibs.models import CodeSearchInfo


@receiver(post_delete, sender=CodeSearchInfo, dispatch_uid='codesearchinfo_on_delete')
def auto_delete_file_on_delete(sender, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `MediaFile` object is deleted.
    """

    instance = kwargs['instance']

    old_file = instance

    # post_delete中引发的异常都会导致事务回滚，从而删除记录失败
    # delete失败时，也会进行事务回滚，而且不执行post_delete
    # try:
    #     # post_delete 和 delete 在同一个事务中， 所以此处会引发DoesNotExist异常
    #     sender.objects.get(pk=instance.pk)
    # except sender.DoesNotExist:
    #     print("============DoesNotExist")
    #     # 重新引发已捕获的异常 raise后不加参数，重新引发捕获的异常
    #     raise

    if old_file.file.__str__() != "":
        # 说明存在旧文件，而且如果delete异常，将不会发送post_delete信号，所以运行到这说明记录删除成功

        if os.path.isfile(old_file.file.path):
            try:
                os.remove(old_file.file.path)
            except Exception:
                # 说明因为某些原因无法删除文件，返回False
                return False
            return True
        else:
            # 说明旧文件不存在，返回False
            return False
    else:
        # 说明不存在旧文件,返回True
        return True


@receiver(pre_save, sender=CodeSearchInfo, dispatch_uid='codesearchinfo_delete_on_change')
def auto_delete_file_on_change(sender, **kwargs):
    """
    Deletes old file from filesystem
    when corresponding `MediaFile` object is updated
    with new file.
    """

    instance = kwargs['instance']
    # print(type(instance), instance.file.__str__(), instance.file.__str__()=="")
    # old_file = sender.objects.get(pk=instance.pk).file
    # print(type(old_file), old_file.__str__(), old_file.__str__()=="")

    # if not instance.pk:
    #    return False

    try:
        old_file = sender.objects.get(pk=instance.pk)
    except sender.DoesNotExist:
        # 说明主键对应记录不存在, 返回False
        return False

    if instance.file.__str__() == "":
        # 说明用户进行了清除，或者是当前记录本身之前没有上传任何文件

        if old_file.file.__str__() != "":
            # 旧文件存在，说明用户进行的是清除操作,并且此时old_file.path(因为str()不为空字符串)存在

            if os.path.isfile(old_file.file.path):
                try:
                    os.remove(old_file.file.path)
                except Exception:
                    # 说明因为某些原因无法删除文件，返回False
                    return False
                return True
            else:
                # 说明旧文件不存在，返回False
                return False
        else:
            # 说明当前记录本身之前没有上传任何文件, 返回True
            return True
    else:
        # 说明用户上传了新文件(分为之前上传了文件，或之前未上传文件)
        # 或者之前上传了文件但此时未选择任何文件

        if old_file.file.__str__() == "":
            # 说明是上传新文件，并且之前未上传任何文件,返回True即可
            return True
        else:
            # 说明之前用户已上传了文件， 此时file.path都存在

            if instance.file.path == old_file.file.path:
                # 说明之前用户已上传文件，此时未选择任何文件,返回True
                return True
            else:
                # 说明之前用户已上传文件，此时再次上传一文件
                # 即使新上传的文件与之前的文件同名，但是它们的file.path不一致(必须file属性有指定upload_to文件夹才行)
                # 故只需要执行删除旧文件即可
                if os.path.isfile(old_file.file.path):
                    try:
                        os.remove(old_file.file.path)
                    except Exception:
                        # 说明因为某些原因无法删除文件，返回False
                        return False
                    return True
                else:
                    # 说明旧文件不存在，返回False
                    return False
