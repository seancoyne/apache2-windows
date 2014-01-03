Chef Cookbook for Apache 2 on Windows
=====================================

Installs and configures Apache2 on Windows Azure

Requirements
------------
#### packages
- windows
- vcruntime

Supported Platforms
-------------------
Microsoft Windows 2008 R2
Microsoft Azure ACS, blob, xSQL

Attributes
----------

#### apache2_windows::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['apache2']['windows']['source']</tt></td>
    <td>String</td>
    <td>Location of Apache2 distribution</td>
    <td><tt>http://www.apachelounge.com/download/win32/binaries/httpd-2.2.24-win32-ssl_0.9.8-VC9.zip</tt></td>
  </tr>
  <tr>
    <td><tt>['apache2']['windows']['checksum']</tt></td>
    <td>String</td>
    <td>Checksum of Apache2 distribution</td>
    <td><tt>564cfae5935681ad679871f6132f1a8ed28fe3bbd8b2338952b36f335f6dc1db</tt></td>
  </tr>
  <tr>
    <td><tt>['apache2']['windows']['path']</tt></td>
    <td>String</td>
    <td>Path where Apache2 will be installed</td>
    <td><tt>c:\Apache2</tt></td>
  </tr>
  <tr>
    <td><tt>['apache2']['windows']['confd']</tt></td>
    <td>String</td>
    <td>Apache2 confd directory</td>
    <td><tt>#{node['apache2']['windows']['path']}/conf.d</tt></td>
  </tr>
  <tr>
    <td><tt>['azurefqdn']</tt></td>
    <td>String</td>
    <td>Azure FQDN</td>
    <td><tt>#{node['hostname'].downcase}.cloudapp.net</tt></td>
  </tr>
</table>

Usage
-----
#### apache2_windows::default

Just include `apache2_windows` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[apache2_windows]"
  ]
}
```

License and Authors
-------------------

* Author:: Yvo Van Doorn (yvo@getchef.com)
* Author:: Chris McClimans (hh@hippiehacker.org)
* Author:: Dan Robinson (dan@getchef.com)
* Author:: Julian Dunn (jdunn@getchef.com)
* Author:: James Francis (james@gnslngr.us)

* Copyright (C) 2013 Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
