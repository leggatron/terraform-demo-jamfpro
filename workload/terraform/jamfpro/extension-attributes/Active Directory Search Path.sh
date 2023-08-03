#!/bin/sh

###
#
#            Name:  Active Directory Search Path.sh
#     Description:  Returns Active Directory search path (if computer is bound
#                   to domain).
#         Created:  2016-06-06
#   Last Modified:  2020-07-08
#         Version:  1.3.1
#
#
# Copyright 2016 Palantir Technologies, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
###



########## main process ##########



# Check dsconfigad for domain bind info.
if [ -z "$(/usr/sbin/dsconfigad -show)" ]; then
  adSearchPath=""
else
  adSearchPath=$(/usr/bin/dscl localhost -read /Search CSPSearchPath | /usr/bin/grep "Active Directory" | /usr/bin/sed 's/^ *//')
fi


# Report result.
echo "<result>$adSearchPath</result>"



exit 0
