#!/bin/bash
#
# make index-file with all markdown-files
#
# sverre.stikbakke@ntnu.no 19.04.2016
#

GITHUBUSER='sverres'

INFOFILES='../info/*.md'
PLANSFILES='../plans/*.md'
PRESENTATIONSFILES='../presentations/*.md'
RECORDINGSFILES='../recordings/*.md'
NOTESFILES='../notes/*.md'



INDEXFILE='../index/index.md'

# use only if called from commitall.sh
COMMITMSG="${1}"

echo '# GEO2311 Geografisk informasjonsbehandling Høst 2016' > "${INDEXFILE}"
echo '' >> "${INDEXFILE}"

echo '## Informasjon om emnet' >> "${INDEXFILE}"
#
# insert link to html files: [filename](url)
#
echo '' >> "${INDEXFILE}"
for file in ${INFOFILES}
do
  echo "- [$(basename ${file} .md)](./$(basename ${file} .md).html)"\
   >> "${INDEXFILE}"
done
echo '' >> "${INDEXFILE}"

echo '## Ukeplaner' >> "${INDEXFILE}"
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

echo '## Opptak' >> "${INDEXFILE}"
echo '' >> "${INDEXFILE}"
for file in ${RECORDINGSFILES}
do
  echo "- [$(basename ${file} .md)](./$(basename ${file} .md).html)"\
   >> "${INDEXFILE}"
done
echo '' >> "${INDEXFILE}"

echo '## Notater m.m.' >> "${INDEXFILE}"
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
