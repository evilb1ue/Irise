from django.apps import AppConfig


class ClibsConfig(AppConfig):
    name = 'clibs'
    verbose_name = '代码库'

    def ready(self):
        from . import signals
