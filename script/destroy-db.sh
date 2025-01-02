#!/bin/bash

rails db:drop:_unsafe
if [ $? -ne 0 ]
then
  echo "Drop failed"
  exit 1
else
  echo "Drop Successful"
fi

rails db:create
if [ $? -ne 0 ]
then
  echo "Create failed"
  exit 1
else
  echo "Create Successful"
fi

rails db:migrate
if [ $? -ne 0 ]
then
  echo "Migrate failed"
  exit 1
else
  echo "Migrate Successful"
fi