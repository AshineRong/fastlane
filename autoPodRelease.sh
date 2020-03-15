#!/bin/bash
tagVersion=$1
tagMessage=$2

echo "....切换到fastlane的同级目录..."
cd .. 
pwd  #显示当前目录

podSecPath=`find ./ -name '*.podspec' -print`

echo "podspec的路径是:$podSecPath"

#echo ${podSecPath##*/} 
projectNameTemp=`echo ${podSecPath##*/}` #私有组件文件名
projectName=`echo ${projectNameTemp%%.*}` #文件名.type 取文件名
echo "podsecs是$projectName"
#
repoName="YGSpecs" #私有pod库名,根据需要修改

echo "....一键发布私有库..."
if [ ! $tagMessage ];then
#	echo "tagMessage为空"
	fastlane JHUpdatePodTool project:"${projectName}" version:"${tagVersion}"  repo:"${repoName}"  #tagMsg:"${tagMessage}"
	#fastlane JHUpdatePodTool project:"SDCycleScrollView" version:"1.80.0" tagMsg:"基于github版本的1.80修改 by fastlan Auto" repo:"YGSpecs" 
else
#	echo "tagMessage是:${tagMessage}"
	fastlane JHUpdatePodTool project:"${projectName}" version:"${tagVersion}" tagMsg:"${tagMessage}" repo:"${repoName}" 
fi