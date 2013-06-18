#!/usr/bin/env bash
# vim: tabstop=4 shiftwidth=4 softtabstop=4

# Copyright 2012 SINA Corporation
# All Rights Reserved.
# Author: Zhongyue Luo <lzyeval@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

FILES=$(find tuskar -type f -name "*.py" ! -path "tuskar/tests/*" \
        -exec grep -l "Opt(" {} + | sort -u)

export EVENTLET_NO_GREENDNS=yes

MODULEPATH=$(dirname "$0")/../../tuskar/openstack/common/config/generator.py
OUTPUTPATH=etc/tuskar/tuskar.conf.sample
PYTHONPATH=./:${PYTHONPATH} python $MODULEPATH $FILES > $OUTPUTPATH
