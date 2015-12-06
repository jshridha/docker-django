# docker-django
This docker is used to run django 1.9 on python3.
It comes prebuilt with numpy and scipy to avoid forcing the user to spend time building it themselves. 

# PULL
```docker pull jshridha/django:latest```

# RUN
```docker run -d --name=django -p 8001:8000 -v $(PATH_TO_PROJECT):/usr/src/app django```

# Access
After the run command is complete, you should be able to browse to http://hostname:8001/ to access your project
