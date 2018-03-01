#!/bin/sh
#
########################################################################
# Install Anaconda Libraries.
#  $1 = python path (ex. /usr/local)
#  $2 = no sudo
#
#  Maintainer: id774 <idnanashi@gmail.com>
#
#  v0.1 2/28,2018
#       First.
########################################################################

setup_environment() {
    test -n "$1" && export EASY_INSTALL=$1/bin/easy_install
    test -n "$1" || export EASY_INSTALL=$HOME/local/anaconda3/bin/easy_install
    test -n "$1" && export PIP=$1/bin/conda
    test -n "$1" || export PIP=$HOME/local/anaconda3/bin/conda
}

install_libs() {
    $PIP install -y pip
    $PIP install -y 'IPython>=3.1.0'
    $PIP install -y jupyter
    $PIP install -y notebook
    $PIP install -y pyflakes
    $PIP install -y flake8
    $PIP install -y pytest
    $PIP install -y pytest-pep8
    $PIP install -y autopep8
    $PIP install -y autoflake
    $PIP install -y Cython
    $PIP install -y docutils
    $PIP install -y nose
    $PIP install -y docopt
    $PIP install -y simplejson
    $PIP install -y msgpack-python
    $PIP install -y 'numpy>=1.11.0'
    $PIP install -y 'scipy>=0.17.1'
    $PIP install -y 'scikit-learn>=0.17.1'
    $PIP install -y japandas
    $PIP install -y 'pandas-datareader>=0.2.1'
    $PIP install -y chainer
    $PIP install -y joblib
    $PIP install -y dask
    $PIP install -y patsy
    $PIP install -y 'statsmodels>=0.6.1'
    $PIP install -y sympy
    #$PIP install -y pystan
    $PIP install -y seaborn
    $PIP install -y bokeh
    $PIP install -y twisted
    $PIP install -y Flask
    $PIP install -y Flask-Assets
    $PIP install -y Flask-Bootstrap
    $PIP install -y Hamlish-Jinja
    $PIP install -y gunicorn
    $PIP install -y 'django>=1.8'
    $PIP install -y 'SQLAlchemy>=1.0.2'
    $PIP install -y lmdb
    $PIP install -y migrate
    $PIP install -y readline
    $PIP install -y Pygments
    $PIP install -y Babel
    $PIP install -y Genshi
    $PIP install -y bottle
    $PIP install -y cherrypy
    $PIP install -y beautifulsoup4
    $PIP install -y lxml
    $PIP install -y 'requests<3.0'
    $PIP install -y 'pysolr<4.0'
    $PIP install -y watson-developer-cloud
    $PIP install -y html5lib
    $PIP install -y husl
    $PIP install -y pillow
    $PIP install -y ggplot
    $PIP install -y pyper
    $PIP install -y jinja2 tornado pyzmq
    $PIP install -y awscli
    $PIP install -y cchardet
    $PIP install -y openpyxl
    $PIP install -y xlrd
    $PIP install -y simpy
    $PIP install -y networkx
    $PIP install -y pdfminer3k
    $PIP install -y pybrain
    $PIP install -y fabric
    $PIP install -y uwsgi
    $PIP install -y pypandoc
    $PIP install -y zipline
    $PIP install -y DocumentFeatureSelection
    $PIP install -y python-tr
    $PIP install -y -c conda-forge keras
    $PIP install -y tensorflow
    $PIP install -y 'matplotlib<1.5'
    $PIP install -y 'pandas<0.17'
    $PIP install -y 'pep8<1.6'
    $EASY_INSTALL TA-Lib
    $EASY_INSTALL nltk
}

main() {
    setup_environment $*
    install_libs $*
}

ping -c 1 id774.net > /dev/null 2>&1 || exit 1
main $*
