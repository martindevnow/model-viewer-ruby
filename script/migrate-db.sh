#!/bin/bash

rails db:migrate
if [ $? -ne 0 ]
then
  echo "Migrate failed"
  exit 1
else
  echo "Migrate Successful"
fi