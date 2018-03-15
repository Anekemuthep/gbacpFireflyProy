module Instancias.BACP10 (coursesBACP10, creditBACP10, prereqBACP10) where

import Lib.Prelude

{- Adaptacion de BACP10 a data Haskell-}

paramsBACP10 = (10, 10, 24, 2, 10)


coursesBACP10 = ["dew100","fis100","hrwxx1","iwg101","mat021",
                 "qui010","dew101","fis110","hrwxx2","iwi131",
                 "mat022","dewxx0","fis120","hcw310","hrwxx3",
                 "ili134","ili151","mat023","hcw311","ili135",
                 "ili153","ili260","iwn261","mat024","fis130",
                 "ili239","ili245","ili253","fis140","ili236",
                 "ili243","ili270","ili280","ici344","ili263",
                 "ili332","ili355","iwn170","icdxx1","ili362",
                 "iwn270","icdxx2"]



creditBACP10 = [1, 3, 2, 2, 5, 
                3, 1, 5, 2, 3, 
                5, 1, 4, 1, 2, 
                4, 3, 4, 1, 4, 
                3, 3, 3, 4, 4, 
                4, 4, 4, 4, 4, 
                4, 3, 4, 4, 3, 
                4, 4, 3, 3, 3, 
                3, 3 ]


prereqBACP10 =[("dew101","dew100"),
               ("fis110","fis100") , 
               ("fis110","mat021"),
               ("mat022","mat021"),
               ("dewxx0","dew101"),
               ("fis120","fis110"),
               ("fis120","mat022"),
               ("ili134","iwi131"),
               ("ili151","iwi131"),
               ("mat023","mat022"),
               ("hcw311","hcw310"),
               ("ili135","ili134"),
               ("ili153","ili134"),
               ("ili153","ili151"),
               ("mat024","mat023"),
               ("fis130","fis110"),
               ("fis130","mat022"),
               ("ili239","ili135"),
               ("ili245","ili153"),
               ("ili253","ili153"),
               ("fis140","fis120"),
               ("fis140","fis130"),
               ("ili236","ili239"),
               ("ili243","ili245"),
               ("ili270","ili260"),
               ("ili270","iwn261"),
               ("ili280","mat024"),
               ("ici344","ili243"),
               ("ili263","ili260"),
               ("ili263","iwn261"),
               ("ili332","ili236"),
               ("ili355","ili153"), 
               ("ili355","ili280"),
               ("ili362","ili263")]