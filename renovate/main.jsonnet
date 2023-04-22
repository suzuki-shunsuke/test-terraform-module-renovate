local moduleRegexManager(modulePath) = {
  fileMatch: [
    '.*\\.tf$',
  ],
  matchStrings: [
    '^ +source += +"github\\.com/(?<depName>suzuki-shunsuke/test-terraform-module-renovate//modules/%s)\\?ref=module_modules_%s_(?<currentValue>v\\d+\\.\\d+\\.\\d+(?:-\\d+)?)"' % [
      modulePath,
      std.strReplace(modulePath, '/', '_'),
    ],
  ],
  packageNameTemplate: 'suzuki-shunsuke/test-terraform-module-renovate',

  datasourceTemplate: 'github-releases',
  // extract version from datasource (GitHub Releases)
  extractVersionTemplate: '^module_modules_%s_(?<version>v\\d+\\.\\d+\\.\\d+(?:-\\d+)?)$' % std.strReplace(modulePath, '/', '_'),
};

local modules = import 'modules.json';

{
  extends: [
    'config:base',
  ],
  branchConcurrentLimit: 0,
  prConcurrentLimit: 0,
  prHourlyLimit: 0,
  regexManagers: [
  ] + [
    moduleRegexManager(module)
    for module in modules
  ],
}
