package Dist::Zilla::App::Command::which;

use strict;
use warnings;
use Dist::Zilla::App -command;

# ABSTRACT: Which for Dist::Zilla plugins
# VERSION

=head1 SYNOPSIS

 $ dzil which @Author::Plicease

=head1 DESCRIPTION

Print out the versions and file locations for L<Dist::Zilla> plugins and plugin bundles.

=head1 SEE ALSO

L<Dist::Zilla>, L<Module::Which>

=cut

sub abstract { 'Display plugin version' }

sub usage_desc { '%c %o <PluginOrBundle>' }

sub execute
{
  my (undef, undef, $arg) = @_;
  foreach my $plugin (@$arg)
  {
    my $class = $plugin =~ /^\@(.*)$/ 
      ? "Dist::Zilla::PluginBundle::$1" 
      : "Dist::Zilla::Plugin::$plugin";
    system("which_pm", $class);
  }
}

1;
