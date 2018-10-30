'use strict';

var userhome = require('userhome');

module.exports = function(grunt) {

    grunt.initConfig({
        config: {
            path_dotfiles: process.cwd(),
        },

        curl: {
            vimplug: {
                src: 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
                dest: userhome('.local/share/nvim/site/autoload/plug.vim')
            }
        },

        gitclone: {
            vundle: {
                options: {
                    directory: userhome('.vim/vundle/Vundle.vim'),
                    repository: 'https://github.com/VundleVim/Vundle.vim.git'
                }
            },
            prezto: {
                options: {
                    directory: userhome('.zprezto'),
                    repository: 'https://github.com/sorin-ionescu/prezto.git',
                    recursive: true
                }
            }
        },

        symlink: {
            // neovim symlink
            nvim: {
                dest: userhome('.config/nvim'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/nvim',
                options: {type: 'dir'}
            },

            // vim symlinks
            vimrc: {
                dest: userhome('.vimrc'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/vim/vimrc'
            },
            vim: {
                dest: userhome('.vim'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/vim',
                options: {type: 'dir'}
            },

            // git symlinks
            gitconfig: {
                dest: userhome('.gitconfig'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/git/gitconfig'
            },
            gitignore: {
                dest: userhome('.gitignore'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/git/gitignore'
            },

            // zsh symlinks
            zlogin: {
                dest: userhome('.zlogin'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/zsh/zlogin'
            },
            zshrc: {
                dest: userhome('.zshrc'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/zsh/zshrc'
            },
            zshenv: {
                dest: userhome('.zshenv'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/zsh/zshenv'
            },
            zprofile: {
                dest: userhome('.zprofile'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/zsh/zprofile'
            },
            zpreztorc: {
                dest: userhome('.zpreztorc'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/zsh/zpreztorc'
            },
            zlogout: {
                dest: userhome('.zlogout'),
                relativeSrc: '<%= config.path_dotfiles%>' + '/zsh/zlogout'
            }
        },

        mkdir: {
            dotconfig: {
                options:{
                    create: [userhome('.config')]
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-curl');
    grunt.loadNpmTasks('grunt-git');
    grunt.loadNpmTasks('grunt-symlink');
    grunt.loadNpmTasks('grunt-mkdir');

    grunt.registerTask('neovim', ['curl:vimplug', 'mkdir:dotconfig', 'symlink:nvim']);
    grunt.registerTask('vim', ['gitclone:vundle', 'symlink:vimrc', 'symlink:vim']);
    grunt.registerTask('git', ['symlink:gitconfig', 'symlink:gitignore']);
    grunt.registerTask('zsh', [
        'gitclone:prezto',
        'symlink:zlogin',
        'symlink:zshrc',
        'symlink:zshenv',
        'symlink:zprofile',
        'symlink:zpreztorc',
        'symlink:zlogout'
    ]);
    grunt.registerTask('banner', function(){
        grunt.log.writeln(grunt.file.read('templates/banner'));
    });
    grunt.registerTask('default', ['banner']);
};
