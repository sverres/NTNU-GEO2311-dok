#!/bin/bash
#
# make index-file with all markdown-files
#
# sverre.stikbakke@ntnu.no 19.04.2016
#

GITHUBUSER='sverres'

PLANSFILES='../plans/*.md'
NOTESFILES='../notes/*.md'
PRESENTATIONSFILES='../presentations/*.md'

INDEXFILE='../index/index.md'

# use only if called from commitall.sh
COMMITMSG="${1}"

echo '# GEO2311-filer' > "${INDEXFILE}"
echo '' >> "${INDEXFILE}"

echo '## Ukeplaner' >> "${INDEXFILE}"
#
# insert link to html files: [filename](url)
#
echo '' >> "${INDEXFILE}"
for file in ${PLANSFILES}
do
  echo "- [$(basename ${file} .md)](./$(basename ${file} .md).html)"\
   >> "${INDEXFILE}"
done
echo '' >> "${INDEXFILE}"

echo '## Presentasjoner' >> "${INDEXFILE}"
echo '' >> "${INDEXFILE}"
for file in ${PRESENTATIONSFILES}
do
  echo "- [$(basename ${file} .md)](./$(basename ${file} .md).html)"\
   >> "${INDEXFILE}"
done
echo '' >> "${INDEXFILE}"

echo '## Andre filer' >> "${INDEXFILE}"
echo '' >> "${INDEXFILE}"
for file in ${NOTESFILES}
do
  echo "- [$(basename ${file} .md)](./$(basename ${file} .md).html)"\
   >> "${INDEXFILE}"
done
echo '' >> "${INDEXFILE}"

# Make links to serve html files as html files straight from github
# - permalinks - per commit
# - master-link - do not use in production - according to rawgit.com

cd ..
REPO="$(pwd)"
cd tools

echo '## Denne versjonen' >> "${INDEXFILE}"
#
# insert current date and time
#
echo '' >> "${INDEXFILE}"
echo "- $(date +'%F %T %z') |$(git config --get user.name) |${COMMITMSG}"\
 >> "${INDEXFILE}"
echo '' >> "${INDEXFILE}"

echo '## Tidligere versjoner' >> "${INDEXFILE}"
#
# from git log, insert from each commit:
# - date and time (%ai)
# - author  (%an)
# - commit message (%s)
# - SHA from each commit as part of url (%H) (to index.html)
#
echo '' >> "${INDEXFILE}"
git log --pretty=format:'- [%ai |%an |%s]'\
"(https://cdn.rawgit.com/$GITHUBUSER/$(basename ${REPO})/%H/)" >> "${INDEXFILE}"
echo '' >> "${INDEXFILE}"
echo '' >> "${INDEXFILE}"

echo '## Under arbeid' >> "${INDEXFILE}"
echo '' >> "${INDEXFILE}"
echo '- [siste versjon]'\
"(https://rawgit.com/$GITHUBUSER/$(basename ${REPO})/master/)" >> "${INDEXFILE}"