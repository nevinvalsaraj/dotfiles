'use strict';

var userhome = require('userhome');

module.exports = function(grunt) {

    grunt.initConfig({

        config: {
            path_dotfiles: process.cwd(),

            neovim: {
                path_vimplug: userhome('.local/share/nvim/site/autoload/plug.vim'),
                url_vimplug: 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
                path: '<%= config.path_dotfiles%>' + '/nvim',
                path_system: userhome('.config/nvim')
            },
            
            vim: {
                path_vimrc: '<%=  config.path_dotfiles%>' + '/.vimrc',
                path_vimrc_system: userhome('.vimrc'),
                path_vim: '<%= config.path_dotfiles%>' + '/.vim',
                path_vim_system: userhome('.vim'),
                path_vundle: userhome('.vim/vundle/Vundle.vim'),
                url_vundle: 'https://github.com/VundleVim/Vundle.vim.git'
            }
        },

        curl: {
            vimplug: {
                src: '<%= config.neovim.url_vimplug%>',
                dest: '<%= config.neovim.path_vimplug%>'
            }
        },

        gitclone: {
            vundle: {
                options: {
                    directory: '<%= config.vim.path_vundle%>',
                    repository: '<%= config.vim.url_vundle%>'
                }
            }
        },

        symlink: {
            neovim: {
                dest: "<%= config.neovim.path_system%>",
                relativeSrc: "<%= config.neovim.path%>",
                options: {type: 'dir'}
            },

            vimrc: {
                dest: "<%= config.vim.path_vimrc_system%>",
                relativeSrc: "<%= config.vim.path_vimrc%>"
            },

            vim: {
                dest: "<%= config.vim.path_vim_system%>",
                relativeSrc: "<%= config.vim.path_vim%>",
                options: {type: 'dir'}
            }
        }

    });

    grunt.loadNpmTasks('grunt-curl');
    grunt.loadNpmTasks('grunt-git');
    grunt.loadNpmTasks('grunt-symlink');

    grunt.registerTask('neovim', ['curl:vimplug', 'symlink:neovim']);

    grunt.registerTask('vim', ['gitclone:vundle', 'symlink:vimrc', 'symlink:vim']);

    grunt.registerTask('banner', function(){
        grunt.log.writeln(grunt.file.read('templates/banner'));
    });

    grunt.registerTask('default', ['banner']);
};
