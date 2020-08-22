#!/bin/bash
sed "s/tagVersion/$1/g" myweb.yml > myweb-deploy.yml