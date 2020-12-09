Currenthost Overlay
================

This is the Currenthost Ltd overlay -- it acts as a bolt on to Funtoo Linux to add packages, stabalise some
package versions and add custom features to production images. It is free and open source so you are encouraged
to fork or use the repo if it can be of use to you. If you have forked the overlay, perform the
following steps:

1. Review COPYRIGHT.txt and LICENSE.txt. What is provided should have reasonable defaults,
   using the GNU General Public License Version 2. You will want to change the copyright notice to read:
::

  Copyright ${DATE} Firstname Lastname. Distributed under the terms of the GNU
  General Public License version 2.

2. Modify ``profiles/repo_name`` and enter a single-word name for your repository.

3. Edit ``metadata/layout.conf`` and change the the repo-name line
   to the name of the new repository.

4. Modify this README.rst file to accurately reflect how to contribute. You should
   be able to remove this top part and simply use what follows it as a template.

5. Add ebuilds :)


=================================
How to Contribute to this Overlay
=================================

:author: klib.so
:contact: klib@currenthost.eu
:language: English

Greetings!
=======================

https://trac.currenthost.eu

To contribute bug reports for this overlay, you can open up an issue or send
me a pull request.

If you are using ebuilds in this overlay as part of Funtoo Linux (because they are
merged into the main Funtoo Linux Portage tree, for example,) then
please also open an issue at `bugs.funtoo.org`_.
