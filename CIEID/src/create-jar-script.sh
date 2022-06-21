#!/bin/sh

echo "#!/bin/sh" > create-jar.sh
echo -n "jar cf ../CIEID.jar " > create-jar.sh
IFS='
'
for i in `find . -type f -name "*.class"` ; do echo -n "$i" | sed 's/\ /\\\ /g' | sed 's/\$/\\\$/g' | sed 's/\@/\\@/g' >> create-jar.sh ; echo -n " " >> create-jar.sh ; done
for i in `find ./it/ipzs/cieid/res/ -type f` ; do echo -n "$i" | sed 's/\ /\\\ /g' | sed 's/\$/\\\$/g' | sed 's/\@/\\@/g' >> create-jar.sh ; echo -n " " >> create-jar.sh ; done
for i in `find ./com/sun/jna/ -type f -name libjnidispatch.so` ; do echo -n "$i" | sed 's/\ /\\\ /g' | sed 's/\$/\\\$/g' | sed 's/\@/\\@/g' >> create-jar.sh ; echo -n " " >> create-jar.sh ; done
chmod a+x create-jar.sh
[[ -e create-jar.sh ]] && ./create-jar.sh
