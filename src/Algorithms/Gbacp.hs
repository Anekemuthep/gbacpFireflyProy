{-# LANGUAGE DeriveGeneric #-}
module Algorithms.Gbacp (splitByTwoDots) where

import Lib.Prelude
import Data.Set as Set    
import qualified Data.Char as Charq
import qualified Data.Text as T


splitByTwoDots :: [Char] -> [[Char]]
splitByTwoDots x =
     splitHelper [] [] x
         

splitHelper :: [[Char]] -> [Char] -> [Char] -> [[Char]]
splitHelper acum header act =
    case act of
        (':' : z) ->
            splitHelper
                (acum ++ ([header ++ ""]))
                []
                z


        (y : z) ->
            splitHelper
                acum
                (header ++ [y])
                z

        [] ->
            acum ++ [header]

--computePairs :: ([Char], [Char]) -> Maybe ([Char], [Char])
--computePairs (x, y) = if y=="segmento-1"
--                     then Nothing
--                     else Just (x, y)

data GbacpFeatures = GbacpFeatures
    { descripiton :: String
    , periodsPerYear :: Int
    , numCourses :: Int
    , numCurricula :: Int
    , courseLoad :: CourseLoad
    , numPrerrequisites :: [Prerrequisites]
    , numUndessiredPeriods :: Int
    } deriving (Show, Generic)

data CourseLoad = CourseLoad 
   { mincourse :: Int
   , maxcourse :: Int
   } deriving (Show, Generic)

data Prerrequisites = Prerrequisites
    { preRequisite :: String
    , courseRef :: String
    } deriving (Show, Generic)

len :: [a] -> Integer
len [] = 0
len (_:xs) = 1 + len xs

--The file starts with a header summarizing the main features of the instance, each on a single line, as in the following example:
--DESCRIPTION: Ing@UD aa07-08, first level
--YEARS: 3
--PERIODS_PER_YEAR: 3
--NUM_COURSES: 307
--NUM_CURRICULA: 37
--COURSE_LOAD: 2 6
--NUM_PREREQUISITES: 1383
--NUM_UNDESIRED_PERIODS: 90
--DESCRIPTION:
--a textual description of the instance
--YEARS:
--the number of years
--PERIODS_PER_YEAR:
--the number of periods per year
--NUM_COURSES:
--the number of courses (i.e., the length of the subsequent COURSES section)
--NUM_CURRICULA:
--the number of curricula (i.e., the length of the subsequent CURRICULA section)
--COURSE_LOAD:
--the minimum and the maximum number of courses per each term
--NUM_PREREQUISITES:
--the number of prerequisites (i.e., the length of the subsequent PREREQUISITES section)
--NUM_UNDESIRED_PERIODS:
--the number of undesired periods (i.e., the length of the subsequentUNDESIRED_PERIODS section)
--Then the file contains the following sections:
--COURSES:
--each line contains the information about a single course. The data is the name of the course (a valid identifier with no spaces) and the number of credits (an integer value), separated by spaces as in the following example:
--c6 6
--This line indicates that course c6 accounts for 6 credits.
--CURRICULA:
--each line contains the information about a curriculum. The data is the name of the curriculum (a valid identifier with no spaces), the number of courses included in the curriculum (an iteger value) and the list of courses included in the curriculum. The data is separated by spaces as in the following example:
--Curr_1_2_4 33 c94 c95 c180 c97 c98 c99 c101 c103 c104 c105 c106 c107 c108 c109 c110 c112 c113 c114 c115 c116 c117 c118 c121 c122 c123 c124 c125 c127 c722 c935 c998 c1033 c1034
--This line indicates that curriculum Cur_1_2_4 is made up of 33 courses subsequently listed.
--PREREQUISITES:
--each line contains two courses, the first one is the prerequisite of the second. The data is separated by spaces as in the following example:
--c210 c11
--This line indicates that course c210 is a prerequisite for course c11.
--UNDESIRED_PERIODS:
--each line contains a course and a period, stating that the period is undesired for that course. The data is separated by spaces as in the followign example:
--c1023 1
--This line indicates that course c1023 could not be taught in period 1.                    

--getCustomAudience :: Text -> Maybe (Text, Text)
--getCustomAudience x =
--    case x of
--        "segmento-2" ->
--            Just ("6068523723872","Lookalike (CL 3%) - Segmento-2")
--
--        "segmento-3" ->
--            Just ("6068275952072","Lookalike (CL 3%) - Segmento-3")
--
--        "segmento-4" ->
--            Just ("6068512823872","Lookalike (CL 3%) - Segmento-4")
--
--        "segmento-6" ->   
--            Just ("6068275953472","Lookalike (CL 3%) - Segmento-6")
--
--        "segmento-8" ->    
--            Just ("6068275961672","Lookalike (CL 3%) - Segmento-8")
--        
--        "segmento-9" ->
--            Just ("6068275979272","Lookalike (CL 3%) - Segmento-9")
--        
--        "segmento-10" ->
--            Just ("6068529963872","Lookalike (CL 3%) - Segmento-10")
--
--        "segmento-12" ->
--            Just ("6068275977672","Lookalike (CL 3%) - Segmento-12")
--
--        "segmento-14" ->
--            Just ("6070976731872","Lookalike (CL 3%) - Segmento-14")
--
--        "segmento-15" ->
--            Just ("6068275980272","Lookalike (CL 3%) - Segmento-15")
--
--        "segmento-16" ->
--            Just ("6068275985672","Lookalike (CL 3%) - Segmento-16")
--
--        "segmento-17" ->
--            Just ("6070976994072","Lookalike (CL 3%) - Segmento-17")
--
--        "segmento-18" ->
--            Just ("6068534796672","Lookalike (CL 3%) - Segmento-18")
--
--        "segmento-21" ->
--            Just ("6068275988072","Lookalike (CL 3%) - Segmento-21")
--
--        "segmento-23" ->
--            Just ("6068451444272","Lookalike (CL 3%) - Segmento-23")


--        "segmento-24" ->
--            Just ("6068311151472","Lookalike (CL 3%) - Segmento-24")

        
--        "segmento-25" ->
--            Just ("6068311180472","Lookalike (CL 3%) - Segmento-25") 
            
  
--        "segmento-26" ->
--            Just ("6068311206472","Lookalike (CL 3%) - Segmento-26")          

--        _ ->
--            Nothing