#!/usr/bin/env bash

#######################################################################
#                                                                     #
#     Application : create_site.sh                                    #
#     Description:  create the site structure and all common files    #
#     Version:      0.1.0                                             #
#                                                                     #
#     Author: Christian ACHILLE                                       #
#     Website: http://www.christian-achille.com                       #
#                                                                     #
#######################################################################

# Pre-requisites
# --------------
# BEFORE CREATE THE WEBSITE, assume :
# $> sudo usermod -a -G www-data $USER
# $> sudo chown -R root:www-data /var/www
# $> sudo chmod -R 775 /var/www

# Site name
# ---------
#SITE=$1

# Variable
# --------
WEB_ROOT="/var/www"
DOCUMENT_ROOT="public"
ASSETS="assets"
JQUERY_UI=""
SASS_LIB=""
CSS_DIR="css"
SCSS_DIR="scss"
JS_DIR="js"
IMG_DIR=""
MIN_DIR=""
PAGES_DIR="pages"
TEMPLATES_DIR="templates"
FONTS_DIR=""
TEST_DIR=""
PHP_DIR=""
BLOG_ITEM_DIR="blog"
PAGE_EXT=""

# Web root for the application
# ----------------------------
cd $WEB_ROOT

# If Site already exists, don't create it
# ---------------------------------------
for SITE in "$@"

  do

    if [ -d "$WEB_ROOT/$SITE" ]
      then
        echo "$ITE already exists !!!"
        exit 1
    else
      mkdir -p $SITE/{${DOCUMENT_ROOT:-public}/{${CSS_DIR:-css},${SCSS_DIR:-scss},${JS_DIR:-js},${IMG_DIR:-img}/${MIN_DIR:-min},${PAGES_DIR:-partials}/${BLOG_ITEM_DIR:-blog},${TEMPLATES_DIR:-templates},${FONTS_DIR:-fonts},${TEST_DIR:-test},${PHP_DIR:-php}},${ASSETS:-assets}/{js/${JQURY_UI:-jquery_ui},sass/${SASS_LIB:-bourbon}}}
      touch $SITE/$DOCUMENT_ROOT/{README.md,LICENSE,robots.txt,.htaccess,{package,bower}.json,404.html,{Gruntfile,$JS_DIR/main}.js,$CSS_DIR/main.css,$SCSS_DIR/main.scss}
      touch $SITE/$DOCUMENT_ROOT/{index,$TEMPLATES_DIR/{header,footer},$PAGES_DIR/{home,about,services,contact,blog,$BLOG_ITEM_DIR/article_{1..3}}}.${PAGE_EXT:-html}
      echo -n ""
      echo -e $white"The site < $light_green${SITE^^}$white > is created !!!"$reset
    fi

  done

  echo -e ""
  echo $white"You can starting to develop the site(s) < $light_green"${@^^}"$white > !!!"$reset
  echo -e ""

# Unset all variables
# -------------------
unset WEB_ROOT DOCUMENT_ROOT ASSETS JQUERY_UI SASS_LIB CSS_DIR SCSS_DIR JS_DIR IMG_DIR MIN_DIR PAGES_DIR TEMPLATES_DIR FONTS_DIR TEST_DIR PHP_DIR BLOG_ITEM_DIR PAGE_EXT
