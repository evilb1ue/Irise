from django import template

register = template.Library()


@register.filter(name='dict_get')
def dict_get(value, arg):
    try:
        ans = value[arg]
    except KeyError:
        ans = None
    return ans


@register.filter(name='dict_items')
def dict_items(value):
    try:
        ans = value.items()
    except AttributeError:
        ans = {}.items()
    return ans