# appbundle-updater
[![Build status](https://badge.buildkite.com/0d8c5acd906f8477d39b49680f28aa818149dd255ffdabf86f.svg?branch=master)](https://buildkite.com/chef-oss/chef-appbundle-updater-master-verify)
[![Gem Version](https://badge.fury.io/rb/appbundle-updater.svg)](https://badge.fury.io/rb/appbundle-updater)

**Umbrella Project**: [Chef Foundation](https://github.com/chef/chef-oss-practices/blob/master/projects/chef-foundation.md)

**Project State**: [Active](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md#active)

**Issues [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md)**: 14 days

**Pull Request [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md)**: 14 days

Helper to update Chef and Chef-DK appbundle'd apps inside of an omnibus bundle.

## Requirements

* A Chef Workstation, ChefDK, or Chef Client installation in the standard location.
* You need to have the `git` command in your PATH.

## Usage Examples

Install as a gem:

```
gem install appbundle-updater
```

Updating chef in the /opt/chefdk bundle to master:

```
sudo appbundle-updater chefdk chef master
```

Updating chef-dk in the /opt/chefdk bundle to master (sorry about the inconsistent dashes here
but the project/gem is called "chef-dk" while the path on the filesystem is /opt/chefdk, the
path on the filesystem comes first):

```
sudo appbundle-updater chefdk chef-dk master
```

Updating various other softwares in /opt/chefdk bundle to master:

```
sudo appbundle-updater chefdk berkshelf master
sudo appbundle-updater chefdk chef-vault master
sudo appbundle-updater chefdk cookstyle master
sudo appbundle-updater chefdk ohai master
sudo appbundle-updater chefdk foodcritic master
sudo appbundle-updater chefdk test-kitchen master
```

Updating chef and ohai in the /opt/chef bundle to master:

```
sudo appbundle-updater chef chef master
sudo appbundle-updater chef ohai master
```

Windows users from PowerShell use the bat file:

```powershell
& appbundle-updater chefdk test-kitchen master
```

If you don't want "master" you can use any other git tag/branch/sha/etc that git understands.

## Using a GitHub Fork

By default this gem clones from the official repos from the software. To override and point
at at fork use the `--github`` option on the command-line:

```ruby
sudo appbundle-updater chef chef lcg/cool-feature --github lamont-granquist/chef
```

## Using a GitHub tarball instead of a git clone

Using the `--tarball` method will not use `git clone` and will not require the git binary being
installed on the system.  By using this command the whole functionality should run in pure ruby,
be portable across all operating systems that omnibus-chef is ported to, and should only use
ruby stdlib functions.  The disadvantage is that you do now wind up with a real git checkout
in the apps directory, just an extracted snapshot.

```ruby
sudo appbundle-updater chef chef master --tarball
```

## Execution and Target rubies

This does not need to be installed into the embedded ruby that you are doing the update on.

You can install this into an rvm gemset as a local user (for example) and run:

```
rvmsudo appbundle-updater chef chef master
```

It will invoke appbundle-updater via rvm (using your user ruby+gemset under sudo), but will
correctly break the bundle and setup the PATH in order to manipulate your /opt/chefdk or
/opt/chef ruby environment.

Only tested with RVM, but chruby and rbenv are usually simpler and easier.

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])

[license]:      https://github.com/chef/appbundle-updater/blob/master/LICENSE
[fnichol]:      https://github.com/fnichol
[repo]:         https://github.com/chef/appbundle-updater
[issues]:       https://github.com/chef/appbundle-updater/issues
