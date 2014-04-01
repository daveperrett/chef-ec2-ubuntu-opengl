name             'ec2-ubuntu-opengl'
maintainer       'Dave Perrett'
maintainer_email 'hello@daveperrett.com'
license          'MIT'
description      'Sets up OpenGL on an EC2 ubuntu GPU instance.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

depends 'apt'

recipe 'ec2-ubuntu-opengl', 'Sets up OpenGL on an EC2 ubuntu GPU instance.'