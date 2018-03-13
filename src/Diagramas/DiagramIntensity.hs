module Diagramas.DiagramIntensity (main) where

import Lib.Prelude

import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams(toFile)

signal1 :: [Double] -> [(Double,Double)]
signal1 xs = [ (x, exp(-1*(abs x))) | x <- xs ]

signal2 :: [Double] -> [(Double, Double)]
signal2 xs = [ (x, exp(-1*x)) | x <- xs]

main = toFile def "/Users/alfonsobustamante/mychart.svg" $ do
    layout_title .= "Intensity function with different values of gamma"
    setColors [opaque blue, opaque red]
    plot (line "intensity with FFA definition" [signal1 [0,(-1)..1]])
    plot (points "intensity with -alpha" (signal2 [0,(-1)..1]))