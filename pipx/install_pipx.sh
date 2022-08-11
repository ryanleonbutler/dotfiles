#!/bin/bash

cat requirements.txt | xargs pipx inject <package>
