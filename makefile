#如果提示文件找不到,添加需要的 INCLUDE，LINK 路径
#修改时,请对比原makefile文件,并不要修改原文件(将原makefile文件备份)
#如果提示文件找不到,添加需要的 INCLUDE，LINK 路径
#修改时,请对比原makefile文件,并不要修改原文件(将原makefile文件备份)
INCLUDE = ./ -I ../segment -I ../conceptRecognise -I ../utility \
	  -I ../regexMatch -I ../include -I ../suffixTree -I ../wikiProject \
	  -I ../relationExtractor -I ../simWord -I ../clustering -I ../pattern \
	  -I /usr/local/include -I /usr/local/boost_1_44_0 
VPATH = ../segment:../conceptRecognise:../utility:../suffixTree \
    :../regexMatch:../wikiProject:../relationExtractor \
    :../simWord:../clustering:../pattern

BOOSTLIBS = -L /usr/local/boost_1_44_0/libs/regex/build/gcc -lboost_regex-gcc-1_42

object1=text.o corpus.o simpleConceptExtractor.o
object2=getRulePattern.o regexMatch.o
object3=wikiCategory.o zh2sim.o connectMysql.o regexMatch.o
object4=CWikiNetworkTrainer.o fire.o CWikiNetwork.o StrFun.o
object5=suffixTree.o charConverter.o
object6=relationPopulation.o mark.o kmeans.o patternUtility.o pattern.o synForest.o
object7=clustering.o wordVector.o distance.o tree.o
object8=getPattern.o editDistanceCal.o patternGenerator.o
object=$(object1) $(object2) $(object3) $(object4) $(object5) $(object6) $(object7) $(object8) \
       wikiInfoExtractor.o wikiInfoExtractor.o conceptRecognizor.o \
       addElement.o ontoLearner.o ontologyEnrichment.o sentParser.o
ontologyEnrichment:$(object)
	g++ -o ontologyEnrichment -g $^ -I$(INCLUDE) -lmysqlclient ${BOOSTLIBS} \
	    -L ../segment -lsegment  -L /usr/local/lib -lutil -lxml4nlp -lservice 
myUtility.o:myUtility.cpp
	g++ -g -c $^ -I$(INCLUDE) -L ../segment -lsegment
 
#simpleConceptLearner.o:$(object1) 
#	g++ -g -o simpleConceptLearner.o $^ -L../segment -lsegment
simpleConceptExtractor.o:simpleConceptExtractor.cpp
	g++ -c -g $^ -I$(INCLUDE)
text.o:text.cpp
	g++ -c -g $^ -I$(INCLUDE) -L ../segment -lsegment
corpus.o:corpus.cpp
	g++ -c -g $^ -I$(INCLUDE) -L ../segment -lsegment
 
# getRuleFile.o:$(object2) 
	# g++ -g -o getRuleFile.o $^ -I$(INCLUDE) -L../ -lsegment -lboost_regex-gcc-1_42
getRulePattern.o:getRulePattern.cpp
	g++ -g -c $^ -I$(INCLUDE) 
regexMatch.o:regexMatch.cpp 
	g++ -c -g $^ -I$(INCLUDE) ${BOOSTLIBS}
 
wikiInfoExtractor.o:wikiInfoExtractor.cpp
	g++ -g -c $^ -I$(INCLUDE) ${BOOSTLIBS} -L ../segment -lsegment
 
conceptRecognizor.o:conceptRecognizor.cpp
	g++ -g -c $^ -I$(INCLUDE) -L ../segment -lsegment
 
# cateRel.o:$(object3)
	# g++ -g -o cateRel.o $^  -I$(INCLUDE) -lboost_regex-gcc-1_42 -lmysqlclient -L ../segment -lsegment 
wikiCategory.o:wikiCategory.cpp
	g++ -c -g $^ -I$(INCLUDE) ${BOOSTLIBS} -L ../segment -lsegment
zh2sim.o:zh2sim.cpp
	g++ -g -c $^ -I$(INCLUDE)
connectMysql.o:connectMysql.cpp
	g++ -g -c $^ -I$(INCLUDE) -lmysqlclient
 
addElement.o:addElement.cpp
	g++ -g -c $^ -I$(INCLUDE) -lmysqlclient
ontoLearner.o:ontoLearner.cpp
	g++ -g -c  $^ 
ontologyEnrichment.o:ontologyEnrichment.cpp
	g++ -g -c $^
 
CWikiNetworkTrainer.o: CWikiNetworkTrainer.cpp
	g++ -g -c $^ -I$(INCLUDE)
fire.o :fire.cpp
	g++ -g $^  -c -o fire.o -I$(INCLUDE)
CWikiNetwork.o : CWikiNetwork.cpp
	g++ -g -c $^ -I$(INCLUDE)
StrFun.o: StrFun.cpp
	g++ -g -c $^ -I$(INCLUDE)
 
suffixTree.o:suffixTree.cpp
	g++ -c -g $^ -I$(INCLUDE) -L ../segment -lsegment 
charConverter.o:charConverter.cpp
	g++ -c -g $^
 
relationPopulation.o:relationPopulation.cpp
	g++ -c $^ -I$(INCLUDE)
mark.o:mark.cpp
	g++ -c $^ -I$(INCLUDE)
kmeans.o:kmeans.cpp
	g++ -c $^ -I$(INCLUDE)
patternUtility.o:patternUtility.cpp
	g++ -c $^ -I$(INCLUDE)
pattern.o:pattern.cpp
	g++ -c $^ -I$(INCLUDE) 
synForest.o:synForest.cpp
	g++ -g -c $^ -I$(INCLUDE) -L ../segment -lsegment
 
clustering.o:clustering.cpp
	g++ -c -g $^ -I$(INCLUDE)
wordVector.o:wordVector.cpp
	g++ -c -g $^ -I$(INCLUDE)
distance.o:distance.cpp
	g++ -c -g $^  
tree.o:tree.cpp
	g++ -c -g $^
 
getPattern.o:getPattern.cpp
	g++ -g -c $^ -I$(INCLUDE) ${BOOSTLIBS}
patternGenerator.o:patternGenerator.cpp
	g++ -g -c $^ -I$(INCLUDE) ${BOOSTLIBS}
editDistanceCal.o:editDistanceCal.cpp
	g++ -g -c $^ -I$(INCLUDE)
 
sentParser.o:sentParser.cpp	
	g++ -g -c $^ -I$(INCLUDE)  -L /usr/local/lib -lutil -lxml4nlp -lservice
 
clean:
	rm  $(object) ontologyEnrichment
