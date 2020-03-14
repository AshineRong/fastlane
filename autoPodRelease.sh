#!/bin/bash
tagVersion=$1
tagMessage=$2
projectName="<#这里替换成your_podsec_Name#>" #私有组件名
repoName="YGSpecs" #私有pod库名

echo "....切换到fastlane的同级目录..."
cd .. 
pwd  #显示当前目录
echo "....一键发布私有库..."

fastlane JHUpdatePodTool project:"${projectName}" version:"${tagVersion}" tagMsg:"${tagMessage}" repo:"${repoName}" 
#fastlane JHUpdatePodTool project:"SDCycleScrollView" version:"1.80.0" tagMsg:"基于github版本的1.80修改 by fastlan Auto" repo:"YGSpecs" 