!#/bin/bash

echo 'foofoo'
wach vagrant ssh -- -t 'cd /vagrant/modules/django/dashboard && python manage.py runtests ' "$@"


